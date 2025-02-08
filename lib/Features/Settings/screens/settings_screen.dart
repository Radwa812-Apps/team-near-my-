import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Screens/map1.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/screens/sign_in_screen.dart';
import 'package:nearme_app/core/constants.dart';
import 'package:nearme_app/core/data/bloc/profile/profile_bloc.dart';
import 'package:nearme_app/core/messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/Sign_up_and_in/components/text_form_widget.dart';
import '../components/confirm_message_widget.dart';
import '../components/icon_and_text_widget.dart';

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static String settingsScreenKey = '/SettingsScreen';
  double spaceBetweenRows = 40.h;
  String? email, pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Settings',
                style: TextStyle(
                  color: kFontColor,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: spaceBetweenRows),
              // Non-expandable widget
              IconAndTextWidget(
                iconData: Icons.location_on_outlined,
                text: 'Add Place',
                iconSize: 30.sp,
                fontSize: 24.sp,
                onTap: () {
                  Navigator.pushNamed(context, Map1.map1Key);
                },
              ),
              SizedBox(height: spaceBetweenRows),
              // Expandable widget
              IconAndTextWidget(
                iconData: Icons.warning_amber_outlined,
                text: 'Quick Risk Alert',
                iconSize: 30.sp,
                fontSize: 24.sp,
                isExpandable: true,
                expandedContent: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Risk Type 1'),
                    Text('Risk Type 2'),
                    Text('Risk Type 3'),
                  ],
                ),
              ),
              SizedBox(height: spaceBetweenRows),
              // Non-expandable widget
              IconAndTextWidget(
                iconData: Icons.share_outlined,
                text: 'Share',
                iconSize: 30.sp,
                fontSize: 24.sp,
                onTap: () {
                  // Navigate to another screen
                },
              ),

              SizedBox(height: spaceBetweenRows),
              IconAndTextWidget(
                iconData: Icons.qr_code_2_outlined,
                text: 'QR Code',
                iconSize: 30.sp,
                fontSize: 24.sp,
                onTap: () {},
              ),
              SizedBox(height: spaceBetweenRows),
              IconAndTextWidget(
                iconData: Icons.logout_outlined,
                text: 'Logout',
                iconSize: 30.sp,
                fontSize: 24.sp,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmMessageWidget(
                        message: 'Are you sure you want to leave?',
                        onCancel: () {
                          Navigator.of(context).pop();
                        },
                        onConfirm: () async {
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.clear();
                          await FirebaseAuth.instance.signOut();

                          GoogleSignIn googleSignIn = GoogleSignIn();
                          // googleSignIn.disconnect();
                          FirebaseAuth.instance.signOut();
                          // ignore: use_build_context_synchronously
                          Navigator.popAndPushNamed(
                              context, SignInScreen.signInScreenKey);
                        },
                      );
                    },
                  );
                },
              ),

              SizedBox(height: spaceBetweenRows),
              IconAndTextWidget(
                iconData: Icons.lock_outline,
                text: 'Password',
                iconSize: 30.sp,
                fontSize: 24.sp,
                onTap: () {},
              ),
              SizedBox(height: spaceBetweenRows),
              IconAndTextWidget(
                iconData: Icons.perm_device_information_sharp,
                text: 'Permissions',
                iconSize: 30.sp,
                fontSize: 24.sp,
                onTap: () {
                  Navigator.pushNamed(context, '/permissions');
                },
              ),
              SizedBox(height: spaceBetweenRows),
              BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state is UserDeletedSuccessState) {
                    Navigator.of(context, rootNavigator: true).pop();
                    AppMessages().sendVerification(
                        context,
                        Colors.green.withOpacity(0.6),
                        'Your account deleted successfully');

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      SignInScreen.signInScreenKey,
                      (route) => false,
                    );
                  } else if (state is UserDeleteErrorState) {
                    Navigator.of(context, rootNavigator: true).pop();
                    return AppMessages().sendVerification(
                        context,
                        Colors.red.withOpacity(0.6),
                        'Failed to delete account: ${state.error}');
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
                // builder: (context, state) {
                //   return IconAndTextWidget(
                //     iconData: Icons.delete_forever_outlined,
                //     text: 'Delete Account',
                //     iconSize: 30,
                //     fontSize: 24,
                //     onTap: () {
                //       showDialog(
                //         context: context,
                //         builder: (BuildContext context) {
                //           return ConfirmMessageWidget(
                //             message:
                //                 'Are you sure you want to delete your account forever?',
                //             onCancel: () {
                //               Navigator.of(context).pop(); // Close the dialog
                //             },
                //             onConfirm: () {
                //               BlocProvider.of<ProfileBloc>(context)
                //                   .add(DeleteUserEvent());
                //               Navigator.pushNamed(
                //                   context, SignInScreen.signInScreenKey);
                //             },
                //           );
                //         },
                //       );
                //     },
                //   );
                // },
                builder: (context, state) {
                  return IconAndTextWidget(
                    iconData: Icons.delete_forever_outlined,
                    text: 'Delete Account',
                    iconSize: 30.sp,
                    fontSize: 24.sp,
                    onTap: () {
                      TextEditingController emailController =
                          TextEditingController();
                      TextEditingController passwordController =
                          TextEditingController();
                      GlobalKey<FormState> formKey = GlobalKey<FormState>();

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirm Account Deletion"),
                            content: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // TextFormField(
                                  //   onChanged: (value) => email = value,
                                  //   controller: emailController,
                                  //   decoration:
                                  //       const InputDecoration(labelText: "Email"),
                                  //   validator: (value) {
                                  //     if (value == null || value.isEmpty) {
                                  //       return "Please enter your email";
                                  //     }
                                  //     return null;
                                  //   },
                                  // ),
                                  // const SizedBox(height: 10),
                                  // TextFormField(
                                  //   controller: passwordController,
                                  //   obscureText: true,
                                  //   onChanged: (value) => pass = value,
                                  //   decoration: const InputDecoration(
                                  //       labelText: "Password"),
                                  //   validator: (value) {
                                  //     if (value == null || value.isEmpty) {
                                  //       return "Please enter your password";
                                  //     }
                                  //     return null;
                                  //   },
                                  // ),
                                  TextFormFieldWidget(
                                    lineFocusColor: kFontColor,
                                    hintColor: Colors.grey,
                                    lineColor: Colors.grey,
                                    controller: emailController,
                                    hint: 'Email',
                                    prefixIcon: const Icon(Icons.email_outlined,
                                        color: Colors.grey),
                                    keyboardType: TextInputType.emailAddress,
                                    validatior: ((p0) {
                                      if (p0 == null || p0.isEmpty) {
                                        return "Email is required.";
                                      }
                                      return null;
                                    }),
                                    onchange: ((p0) {
                                      email = p0;
                                    }),
                                    editIcon: null,
                                  ),
                                  SizedBox(height: 30.h),
                                  TextFormFieldWidget(
                                    lineFocusColor: kFontColor,
                                    hintColor: Colors.grey,
                                    lineColor: Colors.grey,
                                    controller: passwordController,
                                    hint: 'Password',
                                    prefixIcon: const Icon(Icons.lock_outline,
                                        color: Colors.grey),
                                    keyboardType: TextInputType.text,
                                    isPassword: true,
                                    validatior: ((p0) {
                                      if (p0 == null || p0.isEmpty) {
                                        return "PassWord is required.";
                                      }
                                      return null;
                                    }),
                                    onchange: ((p0) {
                                      pass = p0;
                                    }),
                                    editIcon: null,
                                  ),
                                ],
                              ),
                            ),
                            // actions: [
                            //   TextButton(
                            //     onPressed: () => Navigator.of(context).pop(),
                            //     child: const Text("Cancel"),
                            //   ),
                            //   TextButton(
                            //     onPressed: () {
                            //       if (formKey.currentState!.validate()) {
                            //         BlocProvider.of<ProfileBloc>(context)
                            //             .add(DeleteUserEvent(pass!, email!));
                            //         Navigator.pop(context);
                            //       }
                            //     },
                            //     child: const Text("Delete"),
                            //   ),
                            // ],
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 40.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          40), // حدود مدورة
                                      color: Colors.blue, // لون الكانسيل
                                    ),
                                    child: TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: Colors
                                                .white), // لون النص أبيض ليكون واضحًا
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          40), // حدود مدورة
                                      color: Colors.red, // لون الحذف
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          BlocProvider.of<ProfileBloc>(context)
                                              .add(DeleteUserEvent(
                                                  pass!, email!));
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(
                                            color: Colors
                                                .white), // لون النص أبيض ليكون واضحًا
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              )
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(height: spaceBetweenRows),
              IconAndTextWidget(
                iconData: Icons.copy_outlined,
                text: 'Copy Link To Clipboard',
                iconSize: 30.sp,
                fontSize: 24.sp,
                onTap: () {},
              ),
              SizedBox(height: spaceBetweenRows),
            ],
          ),
        ),
      ),
    );
  }
}
