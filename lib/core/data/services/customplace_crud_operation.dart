import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteUser(String documentId) async {
    try {
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
