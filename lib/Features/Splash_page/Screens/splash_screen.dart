import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Splash_page/Screens/after_splash.dart';

import 'package:nearme_app/Features/Splash_page/components/animation_controller.dart';
import 'package:nearme_app/Features/Splash_page/components/gradient_background.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String splashPageKey = '/';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late SplashAnimationController _splashAnimationController;

  @override
  void initState() {
    super.initState();

    _splashAnimationController = SplashAnimationController(
      this,
      _navigateToNextScreen,
    );
  }

  void _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeView()),
    );
  }

  @override
  void dispose() {
    _splashAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Screenshot 2025-01-30 135647.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _splashAnimationController.controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        0,
                        _splashAnimationController.translateYAnimation.value,
                      ),
                      child: Image.asset(
                        'assets/images/Screenshot 2025-01-30 135854.png',
                        width: 200,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
