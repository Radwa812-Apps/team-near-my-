import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Permissions/Compnents/button.dart';
import 'package:nearme_app/core/Icons/arrow_back.dart';
import 'package:nearme_app/core/constants.dart';
import 'package:nearme_app/core/font_style.dart';

class PermissionLocation extends StatefulWidget {
  @override
  _PermissionLocationState createState() => _PermissionLocationState();
}

class _PermissionLocationState extends State<PermissionLocation> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          
          children: [
            const ArrowBack(top: 50,left: 20,),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Turn on your location',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      color: spectialgreen,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/Rectangle253.png',
                          height: 150,
                        ),
                        const SizedBox(height: 20),
                        Switch(
                          value: isSwitchOn,
                          onChanged: (value) {
                            setState(() {
                              isSwitchOn = value;
                            });
                          },
                          activeColor: kPrimaryColor1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: spectialgreen,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Text(
                          'This is an important step to continue using our app',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Positioned(
                          bottom: -10,
                          left: 20,
                          child: CustomPaint(
                            size: const Size(10, 10),
                            painter: TrianglePainter(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            if (isSwitchOn)
              Positioned(
                bottom: 20,
                right: 0,
                child: ElevatedButton(
                    onPressed: () {
                      print('Button pressed');
                    },
                    child: const Text(
                      'Next',
                      style: TextStyles.permissionButtonText,
                    ),
                    style: AppButtonStyles.elevatedButtonStyle()),
              ),
          ],
        ),
      ),
    );
  }
}
