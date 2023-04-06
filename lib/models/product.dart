class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
    Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'id': id,
      'image':image
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['ame'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      id: map['id'] ?? '',
      image: map['image'] ?? ''
    );
  }

}
