// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:nearme_app/Features/Permissions/Compnents/button.dart';
// import 'package:nearme_app/Features/Permissions/Compnents/permission_tile.dart';
// import 'package:nearme_app/Features/Permissions/Screens/permission_location.dart';
// import 'package:nearme_app/core/constants.dart';
// import 'package:nearme_app/core/font_style.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:permission_handler/permission_handler.dart';
// class Permissions extends StatefulWidget {
//   const Permissions({super.key});
//   static String permissionsKey = '/Permissions';
//   @override
//   _PermissionsState createState() => _PermissionsState();
// }
// class _PermissionsState extends State<Permissions> {
//   Future<void> requestCamiraPermission() async {
//     PermissionStatus status = await Permission.camera.request();
//     if (status == PermissionStatus.granted) {
//       Fluttertoast.showToast(msg: 'Permission Granted');
//     } else if (status == PermissionStatus.denied) {
//       Fluttertoast.showToast(msg: 'Permission Denied');
//     } else if (status == PermissionStatus.permanentlyDenied) {
//       Fluttertoast.showToast(msg: 'Permission Permanently Denied');
//       openAppSettings();
//     }
//   }
//   List<bool> switchStatus = [false, false, false, false, false];
//   void updateSwitchStatus(int index, bool value) {
//     setState(() {
//       switchStatus[index] = value;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     bool anySwitchActive = switchStatus.contains(true);
//     return Scaffold(
//       backgroundColor: background,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             children: [
//               const Center(
//                 child: Text(
//                   'Permissions',
//                   style: TextStyle(
//                     fontSize: 38,
//                     fontFamily: 'OpenSans-Regular',
//                     fontWeight: FontWeight.w400,
//                     color: textColor,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     PermissionTile(
//                       icon: Icons.camera_alt_outlined,
//                       title: 'Camera',
//                       subtitle: 'Access to your camera to capture photos.',
//                       switchValue: switchStatus[0],
//                       onChanged: (value) => updateSwitchStatus(0, value),
//                     ),
//                     PermissionTile(
//                       icon: Icons.mic_none_outlined,
//                       title: 'Microphone',
//                       subtitle:
//                           'Access to your microphone to record audio or enable voice-based services.',
//                       switchValue: switchStatus[1],
//                       onChanged: (value) => updateSwitchStatus(1, value),
//                     ),
//                     PermissionTile(
//                       icon: Icons.folder_outlined,
//                       title: 'Access files',
//                       subtitle:
//                           'Access to your files to upload or manage documents.',
//                       switchValue: switchStatus[2],
//                       onChanged: (value) => updateSwitchStatus(2, value),
//                     ),
//                     PermissionTile(
//                       icon: Icons.notifications_outlined,
//                       title: 'Notification',
//                       subtitle: 'Allow the app to send you alerts and updates.',
//                       switchValue: switchStatus[3],
//                       onChanged: (value) => updateSwitchStatus(3, value),
//                     ),
//                     PermissionTile(
//                       icon: Icons.contacts_outlined,
//                       title: 'Contacts',
//                       subtitle: 'Grant access to choose friends.',
//                       switchValue: switchStatus[4],
//                       onChanged: (value) => updateSwitchStatus(4, value),
//                     ),
//                     const SizedBox(height: 20),
//                     Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context,
//                                   PermissionLocation.permissionLocationKey);
//                             },
//                             style: AppButtonStyles.elevatedButtonStyle(),
//                             child: Text(
//                               anySwitchActive ? 'Next' : 'Skip',
//                               style: TextStyles.permissionButtonText,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:nearme_app/Features/Permissions/Compnents/button.dart';
// import 'package:nearme_app/Features/Permissions/Compnents/permission_tile.dart';
// import 'package:nearme_app/Features/Permissions/Screens/permission_location.dart';
// import 'package:nearme_app/core/constants.dart';
// import 'package:nearme_app/core/font_style.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:permission_handler/permission_handler.dart';
// class Permissions extends StatefulWidget {
//   const Permissions({super.key});
//   static String permissionsKey = '/Permissions';
//   @override
//   _PermissionsState createState() => _PermissionsState();
// }
// class _PermissionsState extends State<Permissions> {
//   List<bool> switchStatus = [false, false, false, false, false];
//   // Future<void> requestPermission(Permission permission, int index) async {
//   //   PermissionStatus status = await permission.status;
//   // //  PermissionStatus status = await permission.request();
//   //   if (status == PermissionStatus.granted) {
//   //     Fluttertoast.showToast(msg: '${permission.toString().split('.').last} Permission Granted');
//   //     updateSwitchStatus(index, true);
//   //   } else if (status == PermissionStatus.denied) {
//   //      status = await permission.request();
//   //    // Fluttertoast.showToast(msg: '${permission.toString().split('.').last} Permission Denied');
//   //     updateSwitchStatus(index, false);
//   //   } else if (status == PermissionStatus.permanentlyDenied) {
//   //     Fluttertoast.showToast(msg: '${permission.toString().split('.').last} Permission Permanently Denied');
//   //     openAppSettings();
//   //     updateSwitchStatus(index, false);
//   //   }
//   // }
//   Future<void> requestPermission(Permission permission, int index) async {
//     // التحقق من الصلاحية أولا قبل محاولة طلبها
//     PermissionStatus status = await permission.status;
//     if (status == PermissionStatus.granted) {
//       Fluttertoast.showToast(
//           msg:
//               '${permission.toString().split('.').last} Permission Already Granted');
//       updateSwitchStatus(index, true);
//     } else if (status == PermissionStatus.denied) {
//       // هنا نطلب الـ permission فقط لو كانت مرفوضة
//       status = await permission.request();
//       if (status == PermissionStatus.granted) {
//         Fluttertoast.showToast(
//             msg: '${permission.toString().split('.').last} Permission Granted');
//         updateSwitchStatus(index, true);
//       } else {
//         Fluttertoast.showToast(
//             msg: '${permission.toString().split('.').last} Permission Denied');
//         updateSwitchStatus(index, false);
//       }
//     } else if (status == PermissionStatus.permanentlyDenied) {
//       // لو تم رفض الصلاحية بشكل دائم
//       Fluttertoast.showToast(
//           msg:
//               '${permission.toString().split('.').last} Permission Permanently Denied');
//       openAppSettings();
//       updateSwitchStatus(index, false);
//     }
//   }
//   void togglePermission(int index) async {
//     if (switchStatus[index]) {
//       await requestPermission(Permission.camera,
//           index);
//     } else {
//       updateSwitchStatus(index, false);
//     }
//   }
//   void updateSwitchStatus(int index, bool value) {
//     setState(() {
//       switchStatus[index] = value;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     bool anySwitchActive = switchStatus.contains(true);
//     return Scaffold(
//       backgroundColor: background,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             children: [
//               const Center(
//                 child: Text(
//                   'Permissions',
//                   style: TextStyle(
//                     fontSize: 38,
//                     fontFamily: 'OpenSans-Regular',
//                     fontWeight: FontWeight.w400,
//                     color: textColor,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     PermissionTile(
//                       icon: Icons.camera_alt_outlined,
//                       title: 'Camera',
//                       subtitle: 'Access to your camera to capture photos.',
//                       switchValue: switchStatus[0],
//                       onChanged: (value) {
//                         updateSwitchStatus(0, value);
//                         if (value)
//                           requestPermission(Permission.camera, 0);
//                         else
//                           togglePermission(0);
//                       },
//                     ),
//                     PermissionTile(
//                       icon: Icons.mic_none_outlined,
//                       title: 'Microphone',
//                       subtitle:
//                           'Access to your microphone to record audio or enable voice-based services.',
//                       switchValue: switchStatus[1],
//                       onChanged: (value) {
//                         updateSwitchStatus(1, value);
//                         if (value)
//                           requestPermission(Permission.microphone, 1);
//                         else
//                           togglePermission(1);
//                       },
//                     ),
//                     PermissionTile(
//                       icon: Icons.folder_outlined,
//                       title: 'Access files',
//                       subtitle:
//                           'Access to your files to upload or manage documents.',
//                       switchValue: switchStatus[2],
//                       onChanged: (value) {
//                         updateSwitchStatus(2, value);
//                         if (value)
//                           requestPermission(Permission.storage, 2);
//                         else
//                           togglePermission(2);
//                       },
//                     ),
//                     PermissionTile(
//                       icon: Icons.notifications_outlined,
//                       title: 'Notification',
//                       subtitle: 'Allow the app to send you alerts and updates.',
//                       switchValue: switchStatus[3],
//                       onChanged: (value) {
//                         updateSwitchStatus(3, value);
//                         if (value)
//                           requestPermission(Permission.notification, 3);
//                         else
//                           togglePermission(3);
//                       },
//                     ),
//                     PermissionTile(
//                       icon: Icons.contacts_outlined,
//                       title: 'Contacts',
//                       subtitle: 'Grant access to choose friends.',
//                       switchValue: switchStatus[4],
//                       onChanged: (value) {
//                         updateSwitchStatus(4, value);
//                         if (value) {
//                           requestPermission(Permission.contacts, 4);
//                         } else {
//                           togglePermission(4);
//                         }
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context,
//                                   PermissionLocation.permissionLocationKey);
//                             },
//                             style: AppButtonStyles.elevatedButtonStyle(),
//                             child: Text(
//                               anySwitchActive ? 'Next' : 'Skip',
//                               style: TextStyles.permissionButtonText,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nearme_app/Features/Permissions/Compnents/button.dart';
import 'package:nearme_app/Features/Permissions/Compnents/permission_tile.dart';
import 'package:nearme_app/Features/Permissions/Screens/permission_location.dart';
import 'package:nearme_app/core/constants.dart';
import 'package:nearme_app/core/font_style.dart';
import 'package:nearme_app/core/messages.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/services/permission_handler.dart';

class Permissions extends StatefulWidget {
  const Permissions({super.key});
  static String permissionsKey = '/Permissions';
  @override
  _PermissionsState createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  List<bool> switchStatus = [false, false, false, false, false];
  final PermissionHandler _permissionHandler = PermissionHandler();

  // void updateSwitchStatus(int index, bool value) async {
  //   bool permissionGranted = false;
  //   try {
  //     switch (index) {
  //       case 0:
  //         permissionGranted = await _permissionHandler.checkCameraPermission();
  //         break;
  //       case 1:
  //         permissionGranted =
  //             await _permissionHandler.checkMicrophonePermission();
  //         break;
  //       case 2:
  //         permissionGranted = await _permissionHandler.checkStoragePermission();
  //         break;
  //       case 3:
  //         permissionGranted =
  //             await _permissionHandler.checkNotificationPermission();
  //         break;
  //       case 4:
  //         permissionGranted = await _permissionHandler.checkContactPermission();
  //         break;
  //     }
  //     setState(() {
  //       switchStatus[index] = permissionGranted;
  //     });
  //     if (!permissionGranted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //               'Permission not granted for ${_getPermissionName(index)}. Please enable it manually in settings.'),
  //           backgroundColor: Colors.red,
  //           action: SnackBarAction(
  //             label: 'Open Settings',
  //             onPressed: () async {
  //               await openAppSettings();
  //             },
  //           ),
  //         ),
  //       );
  //     } else {
  //       AppMessages().sendVerification(context, Colors.red.withOpacity(0.5),
  //           'Permission already granted for ${_getPermissionName(index)}');
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('An error occurred: ${e.toString()}'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }
// void updateSwitchStatus(int index, bool value) async {
//   bool permissionGranted = false;
//   try {
//     if (value) {
//       // إذا كان المستخدم يحاول تفعيل الإذن
//       switch (index) {
//         case 0:
//           permissionGranted = await _permissionHandler.requestCameraPermission();
//           break;
//         case 1:
//           permissionGranted = await _permissionHandler.requestMicrophonePermission();
//           break;
//         case 2:
//           permissionGranted = await _permissionHandler.requestStoragePermission();
//           break;
//         case 3:
//           permissionGranted = await _permissionHandler.requestNotificationPermission();
//           break;
//         case 4:
//           permissionGranted = await _permissionHandler.requestContactPermission();
//           break;
//       }
//     } else {
//       // إذا كان المستخدم يحاول إلغاء تفعيل الإذن
//       switch (index) {
//         case 0:
//           permissionGranted = !(await _permissionHandler.denyCameraPermission());
//           break;
//         case 1:
//           permissionGranted = !(await _permissionHandler.denyMicrophonePermission());
//           break;
//         case 2:
//           permissionGranted = !(await _permissionHandler.denyStoragePermission());
//           break;
//         case 3:
//           permissionGranted = !(await _permissionHandler.denyNotificationPermission());
//           break;
//         case 4:
//           permissionGranted = !(await _permissionHandler.denyContactPermission());
//           break;
//       }
//     }
//     setState(() {
//       switchStatus[index] = permissionGranted;
//     });
//     if (!permissionGranted && value) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//               'Permission not granted for ${_getPermissionName(index)}. Please enable it manually in settings.'),
//           backgroundColor: Colors.red,
//           action: SnackBarAction(
//             label: 'Open Settings',
//             onPressed: () async {
//               await openAppSettings();
//             },
//           ),
//         ),
//       );
//     } else if (permissionGranted && value) {
//       AppMessages().sendVerification(context, Colors.red.withOpacity(0.5),
//           'Permission already granted for ${_getPermissionName(index)}');
//     } else if (!value) {
//       AppMessages().sendVerification(context, Colors.red.withOpacity(0.5),
//           'Permission denied for ${_getPermissionName(index)}');
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('An error occurred: ${e.toString()}'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }

  Future<void> updateSwitchStatus(int index, bool value) async {
    bool permissionGranted = false;

    try {
      if (value) {
        switch (index) {
          case 0:
            permissionGranted =
                await _permissionHandler.checkCameraPermission();
            break;
          case 1:
            permissionGranted =
                await _permissionHandler.checkMicrophonePermission();
            break;
          case 2:
            permissionGranted =
                await _permissionHandler.checkStoragePermission();
            break;
          case 3:
            permissionGranted =
                await _permissionHandler.checkNotificationPermission();
            break;
          case 4:
            permissionGranted =
                await _permissionHandler.checkContactPermission();
            break;
        }
      } else {
        permissionGranted = false;
      }

      setState(() {
        switchStatus[index] = permissionGranted;
      });

      if (!permissionGranted && value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Permission not granted for ${_getPermissionName(index)}. Please enable it manually in settings.'),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Open Settings',
              onPressed: () async {
                await openAppSettings();
              },
            ),
          ),
        );
      } else if (permissionGranted && value) {
        AppMessages().sendVerification(context, Colors.red.withOpacity(0.5),
            'Permission already granted for ${_getPermissionName(index)}');
      } else if (!value) {
        AppMessages().sendVerification(context, Colors.red.withOpacity(0.5),
            'Permission denied for ${_getPermissionName(index)}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _getPermissionName(int index) {
    switch (index) {
      case 0:
        return 'Camera';
      case 1:
        return 'Microphone';
      case 2:
        return 'Storage';
      case 3:
        return 'Notifications';
      case 4:
        return 'Contacts';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool anySwitchActive = switchStatus.contains(true);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
               Center(
                child: Text(
                  'Permissions',
                  style: TextStyle(
                    fontSize: 38.sp,
                    fontFamily: 'OpenSans-Regular',
                    fontWeight: FontWeight.w400,
                    color: textColor,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PermissionTile(
                      icon: Icons.camera_alt_outlined,
                      title: 'Camera',
                      subtitle: 'Access to your camera to capture photos.',
                      switchValue: switchStatus[0],
                      onChanged: (value) => updateSwitchStatus(0, value),
                    ),
                    PermissionTile(
                      icon: Icons.mic_none_outlined,
                      title: 'Microphone',
                      subtitle:
                          'Access to your microphone to record audio or enable voice-based services.',
                      switchValue: switchStatus[1],
                      onChanged: (value) => updateSwitchStatus(1, value),
                    ),
                    PermissionTile(
                      icon: Icons.folder_outlined,
                      title: 'Access files',
                      subtitle:
                          'Access to your files to upload or manage documents.',
                      switchValue: switchStatus[2],
                      onChanged: (value) => updateSwitchStatus(2, value),
                    ),
                    PermissionTile(
                      icon: Icons.notifications_outlined,
                      title: 'Notification',
                      subtitle: 'Allow the app to send you alerts and updates.',
                      switchValue: switchStatus[3],
                      onChanged: (value) => updateSwitchStatus(3, value),
                    ),
                    PermissionTile(
                      icon: Icons.contacts_outlined,
                      title: 'Contacts',
                      subtitle: 'Grant access to choose friends.',
                      switchValue: switchStatus[4],
                      onChanged: (value) => updateSwitchStatus(4, value),
                    ),
                     SizedBox(height: 20.h),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  PermissionLocation.permissionLocationKey);
                            },
                            style: AppButtonStyles.elevatedButtonStyle(),
                            child: Text(
                              anySwitchActive ? 'Next' : 'Skip',
                              style: TextStyles.permissionButtonText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
