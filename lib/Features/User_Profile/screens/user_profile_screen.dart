// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nearme_app/components/bottom_bar.dart';
// import 'package:nearme_app/core/constants.dart';
// import 'package:nearme_app/core/data/bloc/profile/profile_bloc.dart';

// import '../../../../core/data/models/userRadwa.dart';
// import '../components/user_profile_all_info_widget.dart';

// class UserProfileScreen extends StatelessWidget {
//   static String userProfileScreenKey = '/UserProfileScreen';
//   bool showThreeDotsWidget = false;

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     double spaceWithRows = screenWidth * 0.08;

//     return BlocConsumer<ProfileBloc, ProfileState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: kBackgroundColor,
//           body: StreamBuilder(
//             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//               if (snapshot.hasError) {
//                 return Center(
//                     child: Text('Something went wrong: ${snapshot.error}'));
//               }
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.data!.isEmpty) {
//                 return const Center(child: Text("No custom places found"));
//               }

//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 90),
//                     UserProfileAll_InfoWidget(
//                       firstName: snapshot.data['fName'],
//                       spaceWithRows: 5,
//                       lastName: snapshot.data['fName'],
//                       phoneNumber: snapshot.data['phoneNumber'],
//                       email: snapshot.data['email'],
//                       birthDate: snapshot.data['dateOfBirth'],
//                       paddingTopContainer: 40,
//                       imagePositionTop: -20,
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearme_app/components/bottom_bar.dart';
import 'package:nearme_app/core/constants.dart';
import 'package:nearme_app/core/data/bloc/profile/profile_bloc.dart';

import '../../../../core/data/models/userRadwa.dart';
import '../components/user_profile_all_info_widget.dart';

class UserProfileScreen extends StatefulWidget {
  static String userProfileScreenKey = '/UserProfileScreen';

  UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool showThreeDotsWidget = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double spaceWithRows = screenWidth * 0.08;

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 90),
              UserProfileAll_InfoWidget(
                spaceWithRows: 30,
                paddingTopContainer: 40,
                imagePositionTop: -20,
              ),
            ],
          ),
        ));
  }
}
