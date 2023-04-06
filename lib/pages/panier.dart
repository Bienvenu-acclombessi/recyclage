import 'package:flutter/material.dart';
import 'package:recyclage/models/product.dart';
class CartPage extends StatelessWidget {

  CartPage({Key? key}) : super(key: key);

  final List<Product> productsInCart=[
    Product(id: 1, name: 'Frigo', description: 'description', price: 200, image: 'assets/image')
 ,   Product(id: 1, name: 'Frigo', description: 'description', price: 200, image: 'assets/image')
 ,   Product(id: 1, name: 'Frigo', description: 'description', price: 200, image: 'assets/image')
 ,   Product(id: 1, name: 'Frigo', description: 'description', price: 200, image: 'assets/image')
 ,   Product(id: 1, name: 'Frigo', description: 'description', price: 200, image: 'assets/image')
 ,   Product(id: 1, name: 'Frigo', description: 'description', price: 200, image: 'assets/image')
 ,   Product(id: 1, name: 'Frigo', description: 'description', price: 200, image: 'assets/image')
 ,   Product(id: 1, name: 'Frigo', description: 'description', price: 200, image: 'assets/image')
 ,   Product(id: 1, name: 'Frigo', description: 'description', price: 200, image: 'assets/image')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: productsInCart.isEmpty
          ? Center(
              child: Text('Votre panier est vide.'),
            )
          : ListView.builder(
              itemCount: productsInCart.length,
              itemBuilder: (BuildContext context, int index) {
                final product = productsInCart[index];
                return ListTile(
                  leading: Image.asset("assets/klipartz.png"),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {},
                  ),
                );
              },
            ),
    );
  }
}
