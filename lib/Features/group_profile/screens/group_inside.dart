// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import '../../../core/constants.dart';
// import '../../Home/Home/components/round_image_widget.dart';
// import '../components/member_group_inside.dart';
// class GroupInsideScreen extends StatelessWidget {
//   static String groupInsideScreenKey = '/GroupInsideScreen';
//   String userName = 'Radwa';
//   String lastLocatin = 'Just arrived home';
//   String distance = '2.5km';

//   @override
//   Widget build(BuildContext context) {
//     final String name = ModalRoute.of(context)!.settings.arguments as String;

//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(
//                 Icons.arrow_back_ios_outlined,
//                 color: kFontColor,
//               ))),
//       backgroundColor: kBackgroundColor,
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/group.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(100),
//             child: RoundImageWidget(
//               name: kDefaultGroupImge,
//               height: 40,
//               width: 40,
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.all(100),
//           //   child: Image.asset('assets/images/user.jpg'),
//           // ),
//           // DraggableScrollableSheet
//           DraggableScrollableSheet(
//             initialChildSize: .6,
//             minChildSize: .12,
//             maxChildSize: .9,
//             builder: (context, scrollController) {
//               return Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white, // Add a background color
//                   borderRadius: const BorderRadius.vertical(
//                     top: Radius.circular(20), // Add rounded corners
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1), // Shadow color
//                       offset: const Offset(0, -5), // Shadow position (top)
//                       blurRadius: 10, // Shadow blur
//                       spreadRadius: 0, // Shadow spread
//                     ),
//                   ],
//                 ),
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         const Icon(
//                           Icons.horizontal_rule,
//                           color: Colors.grey,
//                           size: 30,
//                         ),
//                         Row(
//                           children: [
//                             TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 name,
//                                 style: const TextStyle(
//                                     color: kFontColor,
//                                     fontSize: 20,
//                                     fontFamily: kFontRegular),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 220,
//                             ),
//                             const Icon(
//                               Icons.notifications_outlined,
//                               color: kPrimaryColor1,
//                               size: 30,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         MemberGroupInside(
//                             userName: userName,
//                             lastLocatin: lastLocatin,
//                             distance: distance),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           //Navigator.pushNamed(context, GroupChat.groupChatKey);
//         },
//         backgroundColor: kPrimaryColor1,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50.0),
//         ),
//         child: const Icon(Icons.message, color: Colors.white),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import '../../../core/constants.dart';
// import '../../Home/Home/components/round_image_widget.dart';
// import '../components/member_group_inside.dart';

// class GroupInsideScreen extends StatelessWidget {
//   static String groupInsideScreenKey = '/GroupInsideScreen';

//   String userName = 'Radwa';
//   String lastLocatin = 'Just arrived home';
//   String distance = '2.5km';

//   @override
//   Widget build(BuildContext context) {
//     final String name = ModalRoute.of(context)!.settings.arguments as String;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_outlined,
//             color: kFontColor,
//           ),
//         ),
//       ),
//       backgroundColor: kBackgroundColor,
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/group.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(100),
//             child: RoundImageWidget(
//               name: kDefaultGroupImge,
//               height: 40,
//               width: 40,
//             ),
//           ),
//           // DraggableScrollableSheet
//           DraggableScrollableSheet(
//             initialChildSize: .6,
//             minChildSize: .12,
//             maxChildSize: .9,
//             builder: (context, scrollController) {
//               return Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: const BorderRadius.vertical(
//                     top: Radius.circular(20),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       offset: const Offset(0, -5),
//                       blurRadius: 10,
//                       spreadRadius: 0,
//                     ),
//                   ],
//                 ),
//                 child: ListView(
//                   controller: scrollController, // Use the controller here
//                   padding: const EdgeInsets.all(16.0),
//                   children: [
//                     const Center(
//                       child: Icon(
//                         Icons.horizontal_rule,
//                         color: Colors.grey,
//                         size: 30,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             name,
//                             style: const TextStyle(
//                               color: kFontColor,
//                               fontSize: 20,
//                               fontFamily: kFontRegular,
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         // const Icon(
//                         //   Icons.notifications_outlined,
//                         //   color: kPrimaryColor1,
//                         //   size: 30,
//                         // ),

//                         InkWell(
//                           onTap: () {
//                             // تنفيذ حدث عند الضغط على الأيقونة
//                           },
//                           borderRadius: BorderRadius.circular(10),
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: const Icon(
//                               Icons.notifications_outlined,
//                               color: kPrimaryColor1,
//                               size: 30,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     MemberGroupInside(
//                       userName: userName,
//                       lastLocatin: lastLocatin,
//                       distance: distance,
//                     ),
//                     // Add more members or content here
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           //Navigator.pushNamed(context, GroupChat.groupChatKey);
//         },
//         backgroundColor: kPrimaryColor1,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50.0),
//         ),
//         child: const Icon(Icons.message, color: Colors.white),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/components/custom_back_button.dart';
import 'package:nearme_app/Features/group_profile/screens/search_member.dart';

import '../../../core/constants.dart';
import '../../Home/Home/components/round_image_widget.dart';
import '../components/member_group_inside.dart';

class GroupInsideScreen extends StatelessWidget {
  static String groupInsideScreenKey = '/GroupInsideScreen';

  String userName = 'Radwa';
  String lastLocatin = 'Just arrived home';
  String distance = '2.5km';

  final LatLng _initialPosition =
      const LatLng(30.0444, 31.2357); // Cairo, Egypt

  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back_ios_outlined,
      //       color: kFontColor,
      //     ),
      //   ),
      // ),

      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('group_location'),
                position: _initialPosition,
                infoWindow: const InfoWindow(title: 'Group Location'),
              ),
            },
          ),
          // const Padding(
          //   padding: EdgeInsets.all(100),
          //   child: RoundImageWidget(
          //     name: kDefaultGroupImge,
          //     height: 40,
          //     width: 40,
          //   ),
          // ),
          // // DraggableScrollableSheet
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: DraggableScrollableSheet(
              initialChildSize: 0.15, // تقليل الحجم الافتراضي
              minChildSize: 0.1, // الحجم الأدنى
              maxChildSize: 0.85, // الحجم الأقصى
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1), // جعل الخلفية شفافة
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, -5),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      const Center(
                        child: Icon(
                          Icons.horizontal_rule,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     name,
                      //     style: const TextStyle(
                      //       color: kFontColor,
                      //       fontSize: 20,
                      //       fontFamily: kFontRegular,
                      //     ),
                      //   ),
                      // ),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.1),
                                //     blurRadius: 10,
                                //     spreadRadius: 2,
                                //     offset: const Offset(0, 4),
                                //   ),
                                // ],
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  hintStyle: TextStyle(color: kPrimaryColor1),
                                  suffixIcon: const Icon(Icons.search,
                                      color: kPrimaryColor1),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.5)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.5)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.8)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                style: const TextStyle(color: Colors.white),
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              // تنفيذ حدث عند الضغط على الأيقونة
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.notifications_outlined,
                                color: kPrimaryColor1,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      MemberGroupInside(
                        userName: userName,
                        lastLocatin: lastLocatin,
                        distance: distance,
                      ),
                      // Add more members or content here
                    ],
                  ),
                );
              },
            ),
          ),
          CustomBackButton(
            icon: Icons.arrow_back_ios_outlined,
            ontap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pushNamed(context, GroupChat.groupChatKey);
        },
        backgroundColor: kPrimaryColor1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}
