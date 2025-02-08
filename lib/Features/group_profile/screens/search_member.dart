// import 'package:flutter/material.dart';
// import 'package:nearme_app/Features/Group_Profile/components/members_style_widget.dart';
// import 'package:nearme_app/Features/group_profile/screens/add_members_screen.dart';
// import '../../../core/constants.dart';

// class SearchMember extends StatelessWidget {
//   static String searchMemberKey = '/SearchMember';
//   const SearchMember({
//     super.key,
//     // required this.screenWidth,
//     // required this.onSearchPressed,
//   });

//   // final double screenWidth;
//   // final VoidCallback onSearchPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               // IconButton(
//               //   icon: const Icon(
//               //     Icons.arrow_back_ios,
//               //     color: kFontColor,
//               //     size: 28,
//               //   ),
//               //   onPressed: () {
//               //     Navigator.pop(context);
//               //   },
//               // ),

//               IconButton(
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                   color: kFontColor,
//                   size: 28,
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               Expanded(
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white, // لون الخلفية أبيض
//                       borderRadius:
//                           BorderRadius.circular(30.0), // زوايا مستديرة
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1), // لون الظل
//                           blurRadius: 10.0, // درجة تموج الظل
//                           spreadRadius: 2.0, // انتشار الظل
//                           offset: Offset(0, 4), // اتجاه الظل (x, y)
//                         ),
//                       ],
//                     ),
//                     child: TextField(
//                       style: const TextStyle(
//                         fontFamily: kFontRegular,
//                         fontSize: 18,
//                         color: kFontColor,
//                       ),
//                       decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 20.0,
//                         ),
//                         hintText: 'Search...',
//                         hintStyle: TextStyle(
//                           color: Colors.grey[500], // لون نص التلميح
//                         ),
//                         suffixIcon: const Icon(
//                           Icons.search,
//                           color: kPrimaryColor1,
//                         ),
//                         fillColor: Colors.white, // لون الخلفية أبيض
//                         filled: true,
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                           borderSide: const BorderSide(
//                               color: kPrimaryColor1, width: 1.0),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                           borderSide: const BorderSide(
//                               color: Colors.transparent, width: 1.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SingleChildScrollView(
//             child: Column(
//               children: const [
//                 SizedBox(height: 30),
//                 MembersStyleWidget(userName: 'Radwa'),
//                 SizedBox(height: 10),
//                 MembersStyleWidget(userName: 'Nada'),
//                 SizedBox(height: 10),
//                 MembersStyleWidget(userName: 'Radwa'),
//                 SizedBox(height: 10),
//                 MembersStyleWidget(userName: 'Nada'),
//                 SizedBox(height: 10),
//                 MembersStyleWidget(userName: 'Radwa'),
//                 SizedBox(height: 10),
//                 MembersStyleWidget(userName: 'Nada'),
//                 SizedBox(height: 10),
//               ],
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Group_Profile/components/members_style_widget.dart';
import '../../../core/constants.dart';

class SearchMember extends StatelessWidget {
  static String searchMemberKey = '/SearchMember';

  const SearchMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: Text(
          'Search',
          style: TextStyle(color: kFontColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kFontColor,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    suffixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(0.5)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(0.5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(0.8)),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {},
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                      .onDrag, // يخفي الكيبورد عند السحب
                  children: const [
                    SizedBox(height: 30),
                    MembersStyleWidget(userName: 'Radwa'),
                    SizedBox(height: 10),
                    MembersStyleWidget(userName: 'Nada'),
                    SizedBox(height: 10),
                    MembersStyleWidget(userName: 'Radwa'),
                    SizedBox(height: 10),
                    MembersStyleWidget(userName: 'Nada'),
                    SizedBox(height: 10),
                    MembersStyleWidget(userName: 'Radwa'),
                    SizedBox(height: 10),
                    MembersStyleWidget(userName: 'Nada'),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
