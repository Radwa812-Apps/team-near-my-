import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Group_Profile/components/icons_text_switch_widget.dart';

class FeaturesOne extends StatelessWidget {
  const FeaturesOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IconsTextSwitchWidget(
          iconData: Icons.notifications_outlined,
          featureName: 'Notifications',
        ),
        const SizedBox(height: 20),
        const IconsTextSwitchWidget(
          iconData: Icons.location_on_outlined,
          featureName: 'Share Location',
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: const IconsTextSwitchWidget(
            iconData: Icons.select_all_rounded,
            featureName: 'Select Places',
            showSwitch: false,
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: const IconsTextSwitchWidget(
            iconData: Icons.image_outlined,
            featureName: 'Media',
            showSwitch: false,
          ),
        ),
      ],
    );
  }
}
