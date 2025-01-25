import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Permissions/Compnents/button.dart';
import 'package:nearme_app/Features/Permissions/Compnents/permission_tile.dart';
import 'package:nearme_app/core/constants.dart';
import 'package:nearme_app/core/font_style.dart';

class Permissions extends StatefulWidget {
  const Permissions({super.key});
    static const String permissionsKey = 'Permissions';

  @override
  _PermissionsState createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
 
  List<bool> switchStatus = [false, false, false, false, false];

  
  void updateSwitchStatus(int index, bool value) {
    setState(() {
      switchStatus[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    bool anySwitchActive = switchStatus.contains(true);

    return Scaffold(
      backgroundColor:background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
                      subtitle: 'Access to your microphone to record audio or enable voice-based services.',
                      switchValue: switchStatus[1],
                      onChanged: (value) => updateSwitchStatus(1, value),
                    ),
                    PermissionTile(
                      icon: Icons.folder_outlined,
                      title: 'Access files',
                      subtitle: 'Access to your files to upload or manage documents.',
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
            ],
          ),
        ),
      ),
    );
  }
}
