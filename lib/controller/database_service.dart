import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../models/object_gate.dart';

final databaseProvider= Provider((ref) => DatabaseService());
class DatabaseService {
  String? userID, objetID;
  DatabaseService({this.userID, this.objetID});
  // Déclaraction et Initialisation
  FirebaseStorage _storage = FirebaseStorage.instance;

  // upload de l'image vers Firebase Storage
  Future<String> uploadFile(File file, XFile fileWeb) async {
    Reference reference = _storage.ref().child('objects/${DateTime.now()}.png');
    Uint8List imageTosave = await fileWeb.readAsBytes();
    SettableMetadata metaData = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask = kIsWeb
        ? reference.putData(imageTosave, metaData)
        : reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  // ajout de la voiture dans la BDD
  void addObjet(ObjetGate objet) {
    CollectionReference objets = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('objects');
  
    objets.add({
      "objetName": objet.objetName,
      "objetUrlImg": objet.objetUrlImg,
      "etat": objet.etat,
      "objetTimestamp": FieldValue.serverTimestamp(),
    });
  }
   Stream<List<ObjetGate>> get objets {
    CollectionReference objets = FirebaseFirestore.instance.collection('users').doc(userID).collection('objects');
  
    Query queryCars = objets.orderBy('objetTimestamp', descending: true);
    return queryCars.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ObjetGate(
          uid: doc.id,
          objetName: doc.get('objetName'),
          etat: doc.get('etat'),
          objetUrlImg: doc.get('objetUrlImg')
        );
      }).toList();
    });
  }
}
