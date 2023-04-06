class UserModel {
  final String nom;
  final String prenom;
  final String uid;
  final String email;

  UserModel({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nom: map['nom'] ?? '',
      prenom: map['prenom'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? ''
    );
  }
}
