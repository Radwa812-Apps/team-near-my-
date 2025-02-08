import 'package:flutter/material.dart';
import 'package:nearme_app/Features/group_profile/screens/add_members_screen.dart';
import '../../../core/constants.dart';
import '../screens/search_member.dart';

class RowAddMember extends StatelessWidget {
  const RowAddMember({
    super.key,
    required this.screenWidth,
    required this.onSearchPressed,
  });

  final double screenWidth;
  final VoidCallback onSearchPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, AddMembersScreen.addMembersScreenKey);
            },
            child: Row(
              children: const [
                Icon(
                  Icons.person_add_alt_1_outlined,
                  size: 28,
                  color: kPrimaryColor1,
                ),
                SizedBox(width: 10),
                Text(
                  'Add Members',
                  style: TextStyle(
                    color: kFontColor,
                    fontSize: 20,
                    fontFamily: kFontRegular,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ), // Use Spacer to take up remaining space
          IconButton(
              icon: const Icon(Icons.search, size: 28, color: kPrimaryColor1),
              onPressed: (() =>
                  Navigator.pushNamed(context, SearchMember.searchMemberKey))),
        ],
      ),
    );
  }
}
