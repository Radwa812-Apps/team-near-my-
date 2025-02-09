import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nearme_app/core/data/models/user.dart';
import 'package:nearme_app/core/messages.dart';
import 'package:sign_in_button/sign_in_button.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserModel? userModel;
  ProfileBloc() : super(ProfileInitial()) {
    on<EditUserEvent>((event, emit) async {
      emit(UserEditeLoadingState());
      try {
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        String id = FirebaseAuth.instance.currentUser!.uid;
        Map<String, dynamic> updateData = {};

        updateData['fName'] = event.fName;
        updateData['lName'] = event.lName;
        updateData['phoneNumber'] = event.phoneNumber;
        updateData['dateOfBirth'] = event.dateOfBirth;
        updateData['email'] = event.email;
        await users.doc(id).update(updateData);

        emit(UserEditedSuccessState(userModel: userModel!));
      } catch (e) {
        emit(UserEditeErrorState(error: 'Failed to edit user: $e'));
      }
    });

    // on<DeleteUserEvent>((event, emit) async {
    //   try {
    //     emit(UserDeleteLoadingState());
    //     User? user = FirebaseAuth.instance.currentUser;
    //     if (user != null) {
    //       final authCredential = EmailAuthProvider.credential(
    //         email: event.email,
    //         password: event.password,
    //       );
    //       await user.reauthenticateWithCredential(authCredential);
    //       CollectionReference users =
    //           FirebaseFirestore.instance.collection('users');
    //       await users.doc(user.uid).delete();
    //       await user.delete();
    //       emit(UserDeletedSuccessState());
    //     } else {
    //       emit(UserDeleteErrorState(error: 'No user logged in'));
    //     }
    //   } catch (e) {
    //     emit(UserDeleteErrorState(error: 'Failed to delete user: $e'));
    //   }
    // });

    // on<DeleteUserEvent>((event, emit) async {
    //   try {
    //     emit(UserDeleteLoadingState());
    //     User? user = FirebaseAuth.instance.currentUser;
    //     if (user != null) {
    //       final authCredential = EmailAuthProvider.credential(
    //         email: event.email,
    //         password: event.password,
    //       );
    //       await user.reauthenticateWithCredential(authCredential);
    //       final customPlacesRef =
    //           FirebaseFirestore.instance.collection('customPlaces');
    //       final userCustomPlacesRef =
    //           FirebaseFirestore.instance.collection('user_customPlaces');
    //       final userCustomPlacesQuery =
    //           userCustomPlacesRef.where('userId', isEqualTo: user.uid);
    //       final userCustomPlacesSnapshot = await userCustomPlacesQuery.get();
    //       for (var doc in userCustomPlacesSnapshot.docs) {
    //         final customPlaceId = doc['customPlaceId'];
    //         await customPlacesRef.doc(customPlaceId).delete();
    //         await doc.reference.delete();
    //       }
    //       CollectionReference users =
    //           FirebaseFirestore.instance.collection('users');
    //       await users.doc(user.uid).delete();
    //       await user.delete();
    //       emit(UserDeletedSuccessState());
    //     } else {
    //       emit(UserDeleteErrorState(error: 'No user logged in'));
    //     }
    //   } catch (e) {
    //     emit(UserDeleteErrorState(error: 'Failed to delete user: $e'));
    //   }
    // });

    on<DeleteUserEvent>((event, emit) async {
      try {
        emit(UserDeleteLoadingState());

        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          if (user.providerData
              .any((info) => info.providerId == 'google.com')) {
            final GoogleSignIn googleSignIn = GoogleSignIn();
            final GoogleSignInAccount? googleAuth = await googleSignIn.signIn();

            if (googleAuth != null) {
              final GoogleSignInAuthentication googleAuthCredential =
                  await googleAuth.authentication;

              final AuthCredential credential = GoogleAuthProvider.credential(
                accessToken: googleAuthCredential.accessToken,
                idToken: googleAuthCredential.idToken,
              );

              await user.reauthenticateWithCredential(credential);
            }
          } else {
            // إعادة المصادقة باستخدام EmailAuthProvider
            final authCredential = EmailAuthProvider.credential(
              email: event.email,
              password: event.password,
            );
            await user.reauthenticateWithCredential(authCredential);
          }

          final customPlacesRef =
              FirebaseFirestore.instance.collection('customPlaces');
          final userCustomPlacesRef =
              FirebaseFirestore.instance.collection('user_customPlaces');

          final userCustomPlacesQuery =
              userCustomPlacesRef.where('userId', isEqualTo: user.uid);
          final userCustomPlacesSnapshot = await userCustomPlacesQuery.get();

          for (var doc in userCustomPlacesSnapshot.docs) {
            final customPlaceId = doc['customPlaceId'];

            await customPlacesRef.doc(customPlaceId).delete();

            await doc.reference.delete();
          }

          CollectionReference users =
              FirebaseFirestore.instance.collection('users');
          await users.doc(user.uid).delete();

          await user.delete();
          emit(UserDeletedSuccessState());
        } else {
          emit(UserDeleteErrorState(error: 'No user logged in'));
        }
      } catch (e) {
        emit(UserDeleteErrorState(error: 'Failed to delete user: $e'));
      }
    });
    on<ShowUserInfoEvent>((event, emit) async {
      emit(UserInfoLoadingState());
      try {
        final User? user = FirebaseAuth.instance.currentUser;
        print('suer id________________: ${user!.uid}');
        if (user == null) {
          emit(UserInfoErrorState(error: "No user logged in"));
          return;
        }
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('authUid', isEqualTo: user.uid)
            .limit(1)
            .get();

        if (querySnapshot.docs.isEmpty) {
          emit(UserInfoErrorState(error: "User data not found"));
          return;
        }

        final DocumentSnapshot userDoc = querySnapshot.docs.first;
        final String documentId = userDoc.id;
        final data = userDoc.data() as Map<String, dynamic>;
        userModel = UserModel.fromJson(data, user.uid);
        print("✅ User info loaded successfully!");
        emit(UserInfoLoadedSuccessState(userModel: userModel!));
        print('🔹 First Name: ${userModel!.fName}');
        print('🔹 Last Name: ${userModel!.lName}');
        print('🔹 Phone Number: ${userModel!.phoneNumber}');
        print('🔹 Date of Birth: ${userModel!.dateOfBirth}');
        print('🔹 Email: ${userModel!.email}');
        print('🔹 Firestore Doc ID: $documentId');
      } catch (e) {
        print("❌ Error loading user info: $e");
        emit(UserInfoErrorState(error: 'Failed to load user info: $e'));
      }
    });
  }
}
