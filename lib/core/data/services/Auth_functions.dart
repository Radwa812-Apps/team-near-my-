import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
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
          'lName':lName,
          'email': email,
          'phoneNumber': phoneNumber,
          'dateOfBirth': dateOfBirth,
          'profilPicture': profilPicture,
          'role': role
        })
        .then((value) => print("user added successfuly"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

