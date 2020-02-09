import 'package:cloud_firestore/cloud_firestore.dart';

final databaseReference = Firestore.instance;

void storeLocation() {
  databaseReference
      .collection("district")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => print('${f.data}}'));
  });
}

void searchLocation() {
  databaseReference
      .collection('district')
      .where('nama', isGreaterThanOrEqualTo: "Jak")
      .snapshots()
      .listen((data) => print('district ${data.documents.toString()}'));
}
