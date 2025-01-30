import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nearme_app/core/data/models/custom_places.dart';

class Services {
  CollectionReference customPlace =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(
      {required String fName,
      required String lName,
      required String email,
      required String phoneNumber,
      required String dateOfBirth,
      required String profilPicture,
      required String role}) {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    return user
        .add({
          'fName': fName,
          'lName': lName,
          'email': email,
          'phoneNumber': phoneNumber,
          'dateOfBirth': dateOfBirth,
          'profilPicture': profilPicture,
          'role': role
        })
        .then((value) => print("user added successfuly"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> deleteCustomPlace(String dId) {
    return customPlace
        .doc(dId)
        .delete()
        .then((value) => print("customPlace Deleted"))
        .catchError((error) => print("Failed to delete customPlace: $error"));
  }

  ShowCustomPlaceMethod(String userId) async {
    var customPlaces = await FirebaseFirestore.instance
        .collection('customPlaces')
        .where('userId', isEqualTo: userId);





    QuerySnapshot querySnapshot = await customPlaces.get();
    List<CustomPlace> customplacesList = [];
    querySnapshot.docs.forEach((doc) {
      customPlace.add(CustomPlace.fromJson(doc.data()));
    });
    // customPlace.snapshots().listen((event) {
    //   // customplacesList = [];
    //   for (int i = 0; i < event.docs.length; i++) {
    //     customplacesList.add(CustomPlace.fromJson(event.docs[i]));
    //   }
    // });

    return customplacesList;
  }
}
