/*import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class ThreeDotMenu extends StatelessWidget {
  final VoidCallback? onOption1Pressed;
  final VoidCallback? onOption2Pressed;
  final VoidCallback? onOption3Pressed;

  const ThreeDotMenu({
    Key? key,
    this.onOption1Pressed,
    this.onOption2Pressed,
    this.onOption3Pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.more_vert,
        color: kPrimaryColor1,
        size: 30,
      ),
      onSelected: (value) {
        switch (value) {
          case 'Option 1':
            if (onOption1Pressed != null) onOption1Pressed!();
            break;
          case 'Option 2':
            if (onOption2Pressed != null) onOption2Pressed!();
            break;
          case 'Option 3':
            if (onOption3Pressed != null) onOption3Pressed!();
            break;
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.transparent,
      elevation: 0,
      itemBuilder: (BuildContext context) {
        return [
          // Option 1
          PopupMenuItem<String>(
            value: 'Option 1',
            child: Container(
              width: 121,
              height: 98,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
                color: background,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.volume_off_outlined,
                          color: textColor,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Mute',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.cleaning_services_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Clear Chat',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class ThreeDotMenu extends StatelessWidget {
  final VoidCallback? onMutePressed;
  final VoidCallback? onClearChatPressed;
  final VoidCallback? onSearchPressed;

  const ThreeDotMenu({
    Key? key,
    this.onMutePressed,
    this.onClearChatPressed,
    this.onSearchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.more_vert,
        color: kPrimaryColor1,
        size: 30,
      ),
      onSelected: (value) {
        switch (value) {
          case 'Mute':
            if (onMutePressed != null) onMutePressed!();
            break;
          case 'Clear Chat':
            if (onClearChatPressed != null) onClearChatPressed!();
            break;
          case 'Search':
            if (onSearchPressed != null) onSearchPressed!();
            break;
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: background,
      elevation: 8,
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'Mute',
            child: _buildMenuItem(Icons.volume_off_outlined ,'Mute',),
          ),
          PopupMenuItem<String>(
            value: 'Clear Chat',
            child: _buildMenuItem(Icons.cleaning_services_outlined, 'Clear Chat'),
          ),
          PopupMenuItem<String>(
            value: 'Search',
            child: _buildMenuItem(Icons.search, 'Search'),
          ),
        ];
      },
    );
  }

  Widget _buildMenuItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: kPrimaryColor1, size: 20),
        SizedBox(width: 8),
        Expanded( 
          child: Text(
            text,
            style: const TextStyle(
              color:textColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
