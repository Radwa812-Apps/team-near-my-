import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nearme_app/core/messages.dart';

Future<void> deleteUser(BuildContext context, String documentId) async {
  try {
    String? user = FirebaseAuth.instance.currentUser?.uid;
    if (user == null) {
      AppMessages().sendVerification((context), Colors.red.withOpacity(0.8),
          'No authenticated user found!');
      return;
    }

    QuerySnapshot userCustomPlacesSnapshot = await FirebaseFirestore.instance
        .collection('user_customPlaces')
        .where('customPlaceId', isEqualTo: documentId)
        .where('userId', isEqualTo: user)
        .get();
    for (var doc in userCustomPlacesSnapshot.docs) {
      await FirebaseFirestore.instance
          .collection('user_customPlaces')
          .doc(doc.id)
          .delete();
      print("User Custom Place Deleted: ${doc.id}");
    }

    await FirebaseFirestore.instance
        .collection('customPlaces')
        .doc(documentId)
        .delete();
    print("User Deleted");
  } catch (error) {
    print("Failed to delete user: $error");
  }
}

Future<void> updateUser(String documentId, String newName) async {
  try {
    await FirebaseFirestore.instance
        .collection('customPlaces')
        .doc(documentId)
        .update({'name': newName});
    print("User Updated");
  } catch (error) {
    print("Failed to update user: $error");
  }
}
