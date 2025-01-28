// import 'package:flutter/material.dart';

// class GroupChatScreen extends StatelessWidget {
//   static const groupChatScreenKey = 'GroupChatScreen';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(40),
//           color: const Color.fromRGBO(253, 253, 253, 1),
//         ),
//         child: Stack(
//           children: [
//             // Header Section
//             _buildHeader(),
//             // Back Button
//             _buildBackButton(),
//             // Profile Image
//             _buildProfileImage(),
//             // Group Name
//             _buildGroupName(),
//             // Menu Icon
//             _buildMenuIcon(),
//             // Bottom Navigation Bar
//             _buildBottomNavigationBar(),
//             // Message Input Field
//             _buildMessageInputField(),
//             // Send Button
//             _buildSendButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   // Header Section
//   Widget _buildHeader() {
//     return Positioned(
//       top: 0,
//       left: 0,
//       child: Container(
//         width: 395,
//         height: 103,
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           color: Color.fromRGBO(61, 83, 0, 0.25),
//         ),
//       ),
//     );
//   }

//   // Back Button
//   Widget _buildBackButton() {
//     return Positioned(
//       top: 56,
//       left: 14,
//       child: Image.network(
//         'https://img.freepik.com/free-photo/cute-astronaut-kid-playing_23-2149836513.jpg?uid=R177892281&ga=GA1.1.1624578928.1723730262&semt=ais_hybrid',
//         semanticLabel: 'shape',
//       ),
//     );
//   }

//   // Profile Image
//   Widget _buildProfileImage() {
//     return Positioned(
//       top: 48,
//       left: 48,
//       child: Container(
//         width: 41,
//         height: 41,
//         decoration: BoxDecoration(
//           image: const DecorationImage(
//             image: NetworkImage(
//                 'https://img.freepik.com/free-photo/cute-astronaut-kid-playing_23-2149836513.jpg?uid=R177892281&ga=GA1.1.1624578928.1723730262&semt=ais_hybrid'),
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     );
//   }

//   // Group Name
//   Widget _buildGroupName() {
//     return const Positioned(
//       top: 56,
//       left: 57,
//       child: Text(
//         'Alex Trip',
//         style: TextStyle(
//           color: Color.fromRGBO(57, 57, 57, 1),
//           fontFamily: 'Open Sans',
//           fontSize: 25,
//           fontWeight: FontWeight.normal,
//           height: 0.88,
//         ),
//       ),
//     );
//   }

//   // Menu Icon
//   Widget _buildMenuIcon() {
//     return Positioned(
//       top: 62,
//       left: 346,
//       child: Container(
//         width: 26,
//         height: 26,
//         decoration: const BoxDecoration(
//           color: Color.fromRGBO(255, 255, 255, 1),
//         ),
//         child: Stack(
//           children: [
//             Positioned(
//               top: 19.5,
//               left: 9.75,
//               child: Image.network(
//                 'https://img.freepik.com/free-photo/cute-astronaut-kid-playing_23-2149836513.jpg?uid=R177892281&ga=GA1.1.1624578928.1723730262&semt=ais_hybrid',
//                 semanticLabel: 'vector',
//               ),
//             ),
//             Positioned(
//               top: 9.75,
//               left: 9.75,
//               child: Image.network(
//                 'https://img.freepik.com/free-photo/cute-astronaut-kid-playing_23-2149836513.jpg?uid=R177892281&ga=GA1.1.1624578928.1723730262&semt=ais_hybrid',
//                 semanticLabel: 'vector',
//               ),
//             ),
//             Positioned(
//               top: 0,
//               left: 9.75,
//               child:  Image.network(
//                 'https://img.freepik.com/free-photo/cute-astronaut-kid-playing_23-2149836513.jpg?uid=R177892281&ga=GA1.1.1624578928.1723730262&semt=ais_hybrid',
//                 semanticLabel: 'vector',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Bottom Navigation Bar
//   Widget _buildBottomNavigationBar() {
//     return Positioned(
//       top: 831,
//       left: 103,
//       child: Container(
//         width: 170,
//         height: 9,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           color: const Color.fromRGBO(0, 0, 0, 0.42),
//         ),
//       ),
//     );
//   }

//   // Message Input Field
//   Widget _buildMessageInputField() {
//     return Positioned(
//       top: 762,
//       left: 8,
//       child: Container(
//         width: 331,
//         height: 45,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: const Color.fromRGBO(217, 217, 217, 0.74),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             children: [
//                Image.network(
//                 'https://img.freepik.com/free-photo/cute-astronaut-kid-playing_23-2149836513.jpg?uid=R177892281&ga=GA1.1.1624578928.1723730262&semt=ais_hybrid',
//                 semanticLabel: 'vector',
//               ),
//               const SizedBox(width: 8),
//               const Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Message',
//                     hintStyle: TextStyle(
//                       color: Color.fromRGBO(57, 57, 57, 0.6),
//                       fontFamily: 'Open Sans',
//                       fontSize: 20,
//                       fontWeight: FontWeight.normal,
//                     ),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               IconButton(
//                 icon: Icons.message,
              
//                 onPressed: () {
//                   // Add functionality for send button
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Send Button
//   Widget _buildSendButton() {
//     return Positioned(
//       top: 762,
//       left: 343,
//       child: Container(
//         width: 43,
//         height: 43,
//         decoration: BoxDecoration(
//           color: const Color.fromRGBO(61, 83, 0, 1),
//           borderRadius: BorderRadius.circular(21.5),
//         ),
//         child: IconButton(
//           icon:  Image.network(
//                 'https://img.freepik.com/free-photo/cute-astronaut-kid-playing_23-2149836513.jpg?uid=R177892281&ga=GA1.1.1624578928.1723730262&semt=ais_hybrid',
//                 semanticLabel: 'vector',
//               ),
//           onPressed: () {
//             // Add functionality for send button
//           },
//         ),
//       ),
//     );
//   }
// }
