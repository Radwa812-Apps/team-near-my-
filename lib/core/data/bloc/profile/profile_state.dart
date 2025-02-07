part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class UserInfoLoadedState extends ProfileState {
  final String fName;
  final String lName;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  UserInfoLoadedState(
      {required this.fName,
      required this.lName,
      required this.email,
      required this.phoneNumber,
      required this.dateOfBirth});
}
class UserInfoLoadingState extends ProfileState {
 
}

class UserEditedState extends ProfileState {
  final String message;

  UserEditedState({required this.message});
}

class UserDeletedState extends ProfileState {
  final String message;

  UserDeletedState({required this.message});
}

class ProfileErrorState extends ProfileState {
  final String error;

  ProfileErrorState({required this.error});
}
