import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nearme_app/Features/Home/components/search_bar_widget.dart';
import 'package:nearme_app/core/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSearching;
  final VoidCallback onSearchPressed;
  final VoidCallback onClosePressed;
  final TextEditingController searchController;
  final VoidCallback onSearch;
  final ValueChanged<String> onSearchChanged;

  const HomeAppBar({
    Key? key,
    required this.isSearching,
    required this.onSearchPressed,
    required this.onClosePressed,
    required this.searchController,
    required this.onSearch,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isSearching
          ? SearchBarWidget(
              // Use CustomSearchBar here
              controller: searchController,
              onSearch: onSearch,
              onChanged: onSearchChanged,
            )
          : Row(
              children: [
                Image.asset(
                  'assets/images/GreenTransparent.png',
                  height: 153,
                  width: 153,
                ),
                //const SizedBox(width: 10),
              ],
            ),
      actions: isSearching
          ? [
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: kPrimaryColor1,
                  size: 33,
                ),
                onPressed: onClosePressed,
              ),
            ]
          : [
              IconButton(
                icon: Icon(
                  Icons.search_outlined,
                  color: kPrimaryColor1,
                  size: 33,
                ),
                onPressed: onSearchPressed,
              ),
            ],
      backgroundColor: kBackgroundColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
