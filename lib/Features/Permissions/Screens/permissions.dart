import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Permissions/Compnents/button.dart';
import 'package:nearme_app/Features/Permissions/Compnents/permission_tile.dart';
import 'package:nearme_app/core/constants.dart';
import 'package:nearme_app/core/font_style.dart';
import 'package:permission_handler/permission_handler.dart';

class Permissions extends StatefulWidget {
  const Permissions({super.key});
  static const String permissionsKey = 'Permissions';

  @override
  _PermissionsState createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  // List to store the status of each permission switch
  List<bool> switchStatus = List.filled(8, false); // Added more permissions

  // Function to update switch status
  void updateSwitchStatus(int index, bool value) {
    setState(() {
      switchStatus[index] = value;
    });
  }

  Future<void> togglePermission(Permission permission, int index) async {
    var status = await permission.status;
    if (status.isGranted) {
      // If permission is granted, revoke it
      await permission.request().then((value) {
        if (value.isDenied || value.isPermanentlyDenied) {
          updateSwitchStatus(index, false);
        }
      });
    } else {
      // If permission is not granted, request it
      var newStatus = await permission.request();
      if (newStatus.isGranted) {
        updateSwitchStatus(index, true);
      } else if (newStatus.isPermanentlyDenied) {
        openAppSettings();
      }
    }
  }



  // Future<void> togglePermission(Permission permission, int index) async {
  //   var status = await permission.status;
  //   if (status.isGranted) {
  //     // If permission is granted, open app settings to let the user revoke it manually
  //     openAppSettings();
  //     updateSwitchStatus(index, false); // Update switch status to false
  //   } else {
  //     // If permission is not granted, request it
  //     var newStatus = await permission.request();
  //     if (newStatus.isGranted) {
  //       updateSwitchStatus(index, true);
  //     } else if (newStatus.isPermanentlyDenied) {
  //       openAppSettings();
  //     }
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    bool anySwitchActive = switchStatus.contains(true);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Permissions',
                    style: TextStyle(
                      fontSize: 38,
                      fontFamily: 'OpenSans-Regular',
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Added spacing
                // Camera Permission
                PermissionTile(
                  icon: Icons.camera_alt_outlined,
                  title: 'Camera',
                  subtitle: 'Access to your camera to capture photos.',
                  switchValue: switchStatus[0],
                  onChanged: (value) async {
                    await togglePermission(Permission.camera, 0);
                  },
                ),

                // Microphone Permission
                PermissionTile(
                  icon: Icons.mic_none_outlined,
                  title: 'Microphone',
                  subtitle:
                      'Access to your microphone to record audio or enable voice-based services.',
                  switchValue: switchStatus[1],
                  onChanged: (value) async {
                    await togglePermission(Permission.microphone, 1);
                  },
                ),

                // Storage Permission
                PermissionTile(
                  icon: Icons.folder_outlined,
                  title: 'Access files',
                  subtitle:
                      'Access to your files to upload or manage documents.',
                  switchValue: switchStatus[2],
                  onChanged: (value) async {
                    await togglePermission(Permission.storage, 2);
                  },
                ),

                // Notification Permission
                PermissionTile(
                  icon: Icons.notifications_outlined,
                  title: 'Notification',
                  subtitle: 'Allow the app to send you alerts and updates.',
                  switchValue: switchStatus[3],
                  onChanged: (value) async {
                    await togglePermission(Permission.notification, 3);
                  },
                ),

                // Contacts Permission
                PermissionTile(
                  icon: Icons.contacts_outlined,
                  title: 'Contacts',
                  subtitle: 'Grant access to choose friends.',
                  switchValue: switchStatus[4],
                  onChanged: (value) async {
                    await togglePermission(Permission.contacts, 4);
                  },
                ),

                // Location Permission
                PermissionTile(
                  icon: Icons.location_on_outlined,
                  title: 'Location',
                  subtitle:
                      'Access to your location for location-based services.',
                  switchValue: switchStatus[5],
                  onChanged: (value) async {
                    await togglePermission(Permission.location, 5);
                  },
                ),

                // Phone Permission
                PermissionTile(
                  icon: Icons.phone_outlined,
                  title: 'Phone',
                  subtitle: 'Access to make phone calls.',
                  switchValue: switchStatus[6],
                  onChanged: (value) async {
                    await togglePermission(Permission.phone, 6);
                  },
                ),

                // Sensors Permission
                PermissionTile(
                  icon: Icons.sensors_outlined,
                  title: 'Sensors',
                  subtitle: 'Access to device sensors like the accelerometer.',
                  switchValue: switchStatus[7],
                  onChanged: (value) async {
                    await togglePermission(Permission.sensors, 7);
                  },
                ),

                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'PermissionLocation');
                        },
                        child: Text(
                          anySwitchActive ? 'Next' : 'Skip',
                          style: TextStyles.permissionButtonText,
                        ),
                        style: AppButtonStyles.elevatedButtonStyle(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
