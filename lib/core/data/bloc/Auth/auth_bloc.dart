import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:nearme_app/core/data/models/user.dart';
import 'package:nearme_app/core/services/auth_error.dart';

import '../../../services/Auth_functions.dart';
import '../../../services/internet_connection.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Services services;
  AuthBloc(this.services) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          bool isConnected = await checkConnection();
          {
            if (!isConnected) {
              emit(LoginError(
                  'No internet connection. Please check your network.'));
              return;
            }
          }
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.pass);

          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          final error = AuthError(e.code);
          emit(LoginError(error.message));
        } catch (e, stackTrace) {
          log("Unknown error occurred", error: e, stackTrace: stackTrace);
          emit(LoginError('An unknown error occurred. Please try again.'));
        }
      } else if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          bool isConnected = await checkConnection();
          {
            if (!isConnected) {
              emit(RegisterError(
                  'No internet connection. Please check your network.'));
              return;
            }
          }

          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.pass,
          );
          String userId = credential.user!.uid;
          print("User created and data stored in Firestore: $userId");

          emit(RegisterSuccess());
          print('create User With Email And Password success');
        } on FirebaseAuthException catch (e) {
          final error = AuthError(e.code);
          emit(RegisterError(error.message));
        } catch (e, stackTrace) {
          log("Unknown error occurred", error: e, stackTrace: stackTrace);
          emit(RegisterError('An unknown error occurred. Please try again.'));
        }
      }
    });
  }
}
