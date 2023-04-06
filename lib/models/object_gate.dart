import 'package:cloud_firestore/cloud_firestore.dart';

class ObjetGate {
  Timestamp? objetTimestamp;
  String? uid, objetName, objetUrlImg, etat;
  ObjetGate(
      {this.uid,this.objetName,this.etat,this.objetUrlImg});
}
