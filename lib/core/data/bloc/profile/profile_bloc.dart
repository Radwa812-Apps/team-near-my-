import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    // معالجة حدث تعديل المستخدم
    on<EditUserEvent>((event, emit) async {
      try {
        await Future.delayed(const Duration(seconds: 1));
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');

        Map<String, dynamic> updateData = {};

        updateData['firstName'] = event.fName;

        updateData['lastName'] = event.lName;

        updateData['phoneNumber'] = event.phoneNumber;
        updateData['dateOfBirth'] = event.dateOfBirth;
        updateData['email'] = event.email;
        String id = FirebaseAuth.instance.currentUser!.uid;

        await users.doc(id).update(updateData);

        emit(UserEditedState(message: 'User updated successfully'));
      } catch (e) {
        emit(ProfileErrorState(error: 'Failed to edit user: $e'));
      }
    });

    on<DeleteUserEvent>((event, emit) async {
      try {
        await Future.delayed(const Duration(seconds: 1));
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');

        await users.doc(event.userId).delete();
        emit(UserDeletedState(message: 'User deleted successfully'));
      } catch (e) {
        emit(ProfileErrorState(error: 'Failed to delete user: $e'));
      }
    });

    // on<ShowUserInfoEvent>((event, emit) async {
    //   print('ddddddddddddddddddddddddddddddddddddddddddd');
    //   emit(UserInfoLoadingState());
    //   try {
    //     final User? user = FirebaseAuth.instance.currentUser;

    //     if (user == null) {
    //       emit(ProfileErrorState(error: "No user logged in"));
    //       return;
    //     }

    //     final DocumentSnapshot userDoc = await FirebaseFirestore.instance
    //         .collection('users')
    //         .doc(user.uid)
    //         .get();

    //     if (!userDoc.exists) {
    //       emit(ProfileErrorState(error: "User data not found"));
    //       return;
    //     }

    //     final data = userDoc.data() as Map<String, dynamic>;

    //     final String firstName = data['firstName'] ?? 'No Name';
    //     final String lastName = data['lastName'] ?? 'No Last Name';
    //     final String phoneNumber = data['phoneNumber'] ?? 'No Phone';
    //     final DateTime dateOfBirth =
    //         (data['dateOfBirth'] as Timestamp).toDate();
    //     final String email = data['email'] ?? user.email ?? 'No Email';

    //     emit(UserInfoLoadedState(
    //       fName: firstName,
    //       lName: lastName,
    //       phoneNumber: phoneNumber,
    //       dateOfBirth: dateOfBirth.toString(),
    //       email: email,
    //     ));
    //     print('ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff');
    //     print(firstName);
    //     print(lastName);
    //     print(phoneNumber);
    //     print(dateOfBirth);
    //     print(email);
    //     print('ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff');
    //   } catch (e) {
    //     emit(ProfileErrorState(error: 'Failed to load user info: $e'));
    //   }
    // });
    on<ShowUserInfoEvent>((event, emit) async {
      print('🔄 Fetching user info...');
      emit(UserInfoLoadingState());

      try {
        final User? user = FirebaseAuth.instance.currentUser;
        print('suer id                                : ${user!.uid}');

        if (user == null) {
          print("❌ No user is logged in!");
          emit(ProfileErrorState(error: "No user logged in"));
          return;
        }

        print("🔄 Searching for user in Firestore...");
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('authUid', isEqualTo: user.uid)
            .limit(1)
            .get();

        if (querySnapshot.docs.isEmpty) {
          print("❌ No user document found!");
          emit(ProfileErrorState(error: "User data not found"));
          return;
        }

        final DocumentSnapshot userDoc = querySnapshot.docs.first;
        final String documentId = userDoc.id;
        print("✅ User document found! Document ID: $documentId");

        final data = userDoc.data() as Map<String, dynamic>;
        print("📄 Firestore Data: $data");

        final String firstName = data['fName'] ?? 'No Name';
        final String lastName = data['lName'] ?? 'No Last Name';
        final String rawPhoneNumber = data['phoneNumber'] ?? 'No Phone';

        final RegExp regex = RegExp(r'number:\s*(\d+)');
        final match = regex.firstMatch(rawPhoneNumber);

        final String phoneNumber = match != null ? match.group(1)! : 'No Phone';

        String dateOfBirth = data['dateOfBirth'];

        final String email = data['email'] ?? user.email ?? 'No Email';

        print("✅ User info loaded successfully!");
        emit(UserInfoLoadedState(
          fName: firstName,
          lName: lastName,
          phoneNumber: phoneNumber,
          dateOfBirth: dateOfBirth.toString(),
          email: email,
        ));

        print('🔹 First Name: $firstName');
        print('🔹 Last Name: $lastName');
        print('🔹 Phone Number: $phoneNumber');
        print('🔹 Date of Birth: ${data['dateOfBirth']}');
        print('🔹 Email: $email');
        print(
            '🔹 Firestore Doc ID: $documentId'); 
      } catch (e) {
        print("❌ Error loading user info: $e");
        emit(ProfileErrorState(error: 'Failed to load user info: $e'));
      }
    });
  }
}
