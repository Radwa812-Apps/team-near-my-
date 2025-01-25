import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String profilPicture;
  final String role;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.dateOfBirth,
      required this.profilPicture,
      required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json, String id) {
    return UserModel(
      id: id,
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'],
      profilPicture: json['profilPicture'],
      role: json['role'],
    );
  }

  factory UserModel.fromUserCredential({
    required UserCredential userCredential,
  }) {
    final user = userCredential.user;
    if (user == null) {
      throw Exception("UserCredential does not contain a valid user.");
    }
    return UserModel(
        id: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        phoneNumber: user.phoneNumber ?? '',
        dateOfBirth: '',
        profilPicture: user.photoURL ?? '',
        role: 'not admin');
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': this.id,
      'name': this.name,
      'email': this.email,
      'phone': this.phoneNumber,
      'dateOfBirth': this.dateOfBirth,
    };
  }
}
