import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';

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
    //     await Future.delayed(const Duration(seconds: 1));
    //     CollectionReference users =
    //         FirebaseFirestore.instance.collection('users');
    //     await users.doc(event.userId).delete();
    //     emit(UserDeletedState(message: 'User deleted successfully'));
    //   } catch (e) {
    //     emit(ProfileErrorState(error: 'Failed to delete user: $e'));
    //   }
    // });

    on<ShowUserInfoEvent>((event, emit) async {
      emit(UserInfoLoadingState());
      try {
        final User? user = FirebaseAuth.instance.currentUser;
        print('suer id                                : ${user!.uid}');

        // ignore: unnecessary_null_comparison
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

        // final String firstName = data['fName'] ?? 'No Name';
        // final String lastName = data['lName'] ?? 'No Last Name';
        // final String rawPhoneNumber = data['phoneNumber'] ?? 'No Phone';
        // final RegExp regex = RegExp(r'number:\s*(\d+)');
        // final match = regex.firstMatch(rawPhoneNumber);
        // final String phoneNumber = match != null ? match.group(1)! : 'No Phone';
        // String dateOfBirth = data['dateOfBirth'];
        // final String email = data['email'] ?? user.email ?? 'No Email';

        userModel = UserModel.fromJson(data, user.uid);
        print("✅ User info loaded successfully!");
        emit(UserInfoLoadedSuccessState(userModel: userModel!
            // fName: firstName,
            // lName: lastName,
            // phoneNumber: phoneNumber,
            // dateOfBirth: dateOfBirth.toString(),
            // email: email,
            ));

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
