import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearme_app/Features/Group_Profile/screens/group_profile_screen.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Screens/MapSearchWidget.dart';
import 'package:nearme_app/Features/Notifications/Screens/general_notifications.dart';
import 'package:nearme_app/Features/Settings/screens/settings_screen.dart';
import 'package:nearme_app/Features/Splash_page/Screens/after_splash.dart';
import 'package:nearme_app/Features/User_Profile/components/edit_user_widget.dart';
import 'package:nearme_app/Features/User_Profile/screens/edit_screen.dart';
import 'package:nearme_app/Features/auth/Forgot_password/Screens/change_password.dart';
import 'package:nearme_app/Features/auth/Forgot_password/Screens/change_password2.dart';
import 'package:nearme_app/Features/auth/Forgot_password/Screens/forgot_password.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/screens/add_user_success.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/screens/signUp_verifiy_email.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/screens/sign_up_screen.dart';
import 'package:nearme_app/Features/Splash_page/Screens/splash_screen.dart';
import 'package:nearme_app/Features/chat/screens/group_chat.dart';
import 'package:nearme_app/Features/group_profile/screens/add_members_screen.dart';
import 'package:nearme_app/core/data/bloc/Auth/auth_bloc.dart';
import 'package:nearme_app/core/services/Auth_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Features/Home/Home/Screens/home_screen.dart';
import 'Features/Map_After_SignUp/Screens/map1.dart';
import 'Features/Permissions/Screens/permission_location.dart';
import 'Features/Permissions/Screens/permissions.dart';
import 'Features/auth/Forgot_password/Screens/confirm_password.dart';
import 'Features/auth/Sign_up_and_in/screens/sign_in_screen.dart';
import 'components/mainScaffold.dart';
import 'core/data/bloc/custom_places/custom_places_bloc.dart';
// Use only one import path

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }
  runApp(NearMeApp());
}

class NearMeApp extends StatelessWidget {
  NearMeApp({super.key});
  bool isUserLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            isUserLoggedIn = snapshot.data?.getBool('KeppUserLogIn') ?? false;
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => AuthBloc(
                    Services(),
                  ),
                  child: Container(),
                ),
                BlocProvider(
                  create: (context) => CustomPlacesBloc(Services()),
                  child: Container(),
                )
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorObservers: [routeObserver],
                initialRoute: FirebaseAuth.instance.currentUser != null &&
                        FirebaseAuth.instance.currentUser!.emailVerified
                    ? MainScaffold.mainScaffoldKey
                    : SplashPage.splashPageKey,
                // isUserLoggedIn
                //     ? SignInScreen.signInScreenKey
                //     : SplashPage.splashPageKey,
                routes: {
                  SplashPage.splashPageKey: (context) => const SplashPage(),
                  // '/shimass': (context) => const Map1shimaa(),
                  SignUpScreen.signUpScreenKey: (context) =>
                      const SignUpScreen(),
                  SignInScreen.signInScreenKey: (context) => SignInScreen(),
                  ChangePassword.changePasswordKey: (context) =>
                      const ChangePassword(),
                  Permissions.permissionsKey: (context) => const Permissions(),
                  PermissionLocation.permissionLocationKey: (context) =>
                      PermissionLocation(),
                  ConfirmPassword.confirmPasswordKey: (context) =>
                      ConfirmPassword(),
                  ChangePassword2.changePassword2Key: (context) =>
                      const ChangePassword2(),
                  ForgotPassword.forgotPasswordKey: (context) =>
                      ForgotPassword(),
                  WelcomeView.welcomeViewKey: (context) => WelcomeView(),
                  HomeScreen.homeScreenKey: (context) => HomeScreen(),
                  Map1.map1Key: (context) => const Map1(),
                  GeneralNotifications.generalNotificationsKey: (context) =>
                      const GeneralNotifications(title: 'Radwa'),
                  // SplashPage.splashPageKey: ((context) => const SplashPage()),
                  SuccessPage.successPageKey: ((context) => SuccessPage()),
                  SignUpVerificationEmailPage.signUpVerificationEmailPageKey:
                      (context) =>
                          SignUpVerificationEmailPage(services: Services()),
                  MainScaffold.mainScaffoldKey: (context) => MainScaffold(),
                  SettingsScreen.settingsScreenKey: (context) =>
                      SettingsScreen(),
                  GroupProfileScreen.groupProfileScreenKey: (context) =>
                      GroupProfileScreen(),
                  AddMembersScreen.addMembersScreenKey: (context) =>
                      AddMembersScreen(),
                  GroupChat.groupChatKey: (context) => const GroupChat(),
                  EditScreen.editScreenKey: (context) => EditScreen(),
                  // '/': (context) => MainScaffold(),
                  // GroupChatScreen.groupChatScreenKey:((context) => GroupChatScreen())
                },
              ),
            );
          }
        }));
  }
}


  //  routes: {
  //                 '/': (context) =>
  //                     (FirebaseAuth.instance.currentUser != null &&
  //                             FirebaseAuth.instance.currentUser!.emailVerified)
  //                         ? SignInScreen()
  //                         : HomeScreen(),