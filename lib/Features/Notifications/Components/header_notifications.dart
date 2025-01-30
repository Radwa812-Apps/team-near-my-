import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Notifications/Components/search_icon.dart';
import 'package:nearme_app/core/constants.dart';
import 'package:nearme_app/core/font_style.dart';

class HeaderNotifications extends StatefulWidget {
  final String title;
  final Widget? backArrow;
  final VoidCallback? onBackPressed;
  final bool showCircleAvatar;
  final String? circleAvatarImage;

  const HeaderNotifications({
    Key? key,
    required this.title,
    this.backArrow,
    this.onBackPressed,
    this.showCircleAvatar = true,
    this.circleAvatarImage,
  }) : super(key: key);

  @override
  _HeaderNotificationsState createState() => _HeaderNotificationsState();
}

class _HeaderNotificationsState extends State<HeaderNotifications> {
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();

  void _toggleSearchBar() {
    setState(() {
      _showSearchBar = !_showSearchBar;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget defaultBackArrow = Icon(
      Icons.arrow_back_ios,
      color: kPrimaryColor1,
      size: 25,
    );

    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
        color: kPrimaryColor1.withOpacity(0.20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: _showSearchBar
              ? SearchIcon(
                  controller: _searchController,
                  onSearch: () {
                    // Handle search action
                  },
                  onChanged: (value) {
                    // Handle text change
                  },
                  onClose: _toggleSearchBar,
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.backArrow != null ||
                        widget.onBackPressed != null)
                      GestureDetector(
                        onTap: widget.onBackPressed ??
                            () {
                              Navigator.pop(context);
                            },
                        child: widget.backArrow ?? defaultBackArrow,
                      ),
                    const SizedBox(width: 10),
                    if (widget.showCircleAvatar)
                      CircleAvatar(
                        backgroundImage: widget.circleAvatarImage != null
                            ? AssetImage(widget.circleAvatarImage!)
                            : AssetImage("assets/images/Ellipse104.png"),
                        radius: 20,
                      ),
                    if (widget.showCircleAvatar) const SizedBox(width: 10),
                    Text(
                      widget.title,
                      style: TextStyles.NotificationsTilteText,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: kPrimaryColor1,
                            size: 30,
                          ),
                          onPressed: _toggleSearchBar,
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
