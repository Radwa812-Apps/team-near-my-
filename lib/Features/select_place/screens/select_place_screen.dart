// import 'dart:ui';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../core/data/bloc/custom_places/custom_places_bloc.dart';
// import '../../../core/messages.dart';
// import '../../../core/services/customplace_crud_operation.dart';
// import '../../Map_After_SignUp/Components/custom_container.dart';
// import '../../auth/Sign_up_and_in/components/custom_back_button.dart';

// class SelectPlaceScreen extends StatefulWidget {
//   const SelectPlaceScreen({super.key, required this.searchQuery});
//   static String selectPlaceScreenKey = '/SelectPlaceScreen';
//   final String searchQuery;
//   @override
//   _SelectPlaceScreenState createState() => _SelectPlaceScreenState();
// }

// class _SelectPlaceScreenState extends State<SelectPlaceScreen> {
//   // final List<String> items = [
//   //   'Place 1',
//   //   'Place 2',
//   //   'Place 3',
//   //   'Place 4',
//   //   'Place 5',
//   // ];

//   // final Map<String, bool> selectedItems = {};

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // تهيئة الحالة الافتراضية لكل عنصر
//   //   for (var item in items) {
//   //     selectedItems[item] = false;
//   //   }
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     body: SafeArea(
//   //       child: Column(
//   //         children: [
//   //           // زر الرجوع
//   //           Padding(
//   //             padding:
//   //                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//   //             child: Row(
//   //               children: [
//   //                 CustomBackButton(
//   //                   ontap: () {
//   //                     Navigator.pop(context);
//   //                   },
//   //                   icon: Icons.arrow_back_ios_outlined,
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //           // العنوان
//   //           const Padding(
//   //             padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
//   //             child: Text(
//   //               'Custom Places',
//   //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//   //             ),
//   //           ),
//   //           // حقل البحث
//   //           Padding(
//   //             padding:
//   //                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//   //             child: TextField(
//   //               decoration: InputDecoration(
//   //                 hintText: 'Search...',
//   //                 suffixIcon: const Icon(Icons.search),
//   //                 border: OutlineInputBorder(
//   //                   borderRadius: BorderRadius.circular(25.0), // حواف مدورة
//   //                 ),
//   //                 filled: true,
//   //                 fillColor: Colors.white,
//   //               ),
//   //             ),
//   //           ),
//   //           // قائمة العناصر
//   //           Expanded(
//   //             child: ListView.builder(
//   //               padding: const EdgeInsets.all(16.0),
//   //               itemCount: items.length,
//   //               itemBuilder: (context, index) {
//   //                 final item = items[index];
//   //                 return Container(
//   //                     margin: const EdgeInsets.all(5.0),
//   //                     decoration: BoxDecoration(
//   //                       color: Colors.white, // لون الخلفية أبيض
//   //                       borderRadius: BorderRadius.circular(10.0), // حواف مدورة
//   //                       boxShadow: [
//   //                         BoxShadow(
//   //                           color: Colors.grey.withOpacity(0.5), // لون الظل
//   //                           spreadRadius: 2,
//   //                           blurRadius: 5,
//   //                           offset: const Offset(0, 3), // اتجاه الظل
//   //                         ),
//   //                       ],
//   //                     ),
//   //                     child: CheckboxListTile(
//   //                       title: Text(item),
//   //                       value: selectedItems[item],
//   //                       onChanged: (bool? value) {
//   //                         setState(() {
//   //                           selectedItems[item] = value!;
//   //                         });
//   //                       },
//   //                       controlAffinity: ListTileControlAffinity
//   //                           .trailing, // لجعل الـ Checkbox على اليسار
//   //                       checkboxShape: RoundedRectangleBorder(
//   //                         borderRadius: BorderRadius.circular(
//   //                             5.0), // تدوير حدود الـ Checkbox
//   //                       ),
//   //                       activeColor:
//   //                           Colors.blue, // لون الـ Checkbox عند التحديد
//   //                       checkColor: Colors.white, // لون علامة التحديد
//   //                     ));
//   //               },
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   late Stream<List<DocumentSnapshot>> _usersStream;

//   @override
//   void initState() {
//     super.initState();
//     _usersStream = _getUserCustomPlaces();
//   }

//   Stream<List<DocumentSnapshot>> _getUserCustomPlaces() {
//     final userId = _auth.currentUser?.uid;
//     if (userId == null) {
//       return const Stream.empty();
//     }

//     return FirebaseFirestore.instance
//         .collection('user_customPlaces')
//         .where('userId', isEqualTo: userId)
//         .snapshots()
//         .asyncMap((userPlacesSnapshot) async {
//       List<DocumentSnapshot> customPlacesDocs = [];
//       for (var userPlaceDoc in userPlacesSnapshot.docs) {
//         var customPlaceId = userPlaceDoc['customPlaceId'];
//         var customPlaceDoc = await FirebaseFirestore.instance
//             .collection('customPlaces')
//             .doc(customPlaceId)
//             .get();
//         customPlacesDocs.add(customPlaceDoc);
//       }
//       return customPlacesDocs;
//     });
//   }

//   void _showEditDialog(
//       BuildContext context, String documentId, String currentName) {
//     TextEditingController controller = TextEditingController(text: currentName);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return Stack(children: [
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//             child: Container(
//               color: Colors.white.withOpacity(0.3),
//             ),
//           ),
//           AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             title: const Text("Edit Name"),
//             content: TextField(
//               controller: controller,
//               decoration: const InputDecoration(hintText: "Enter new name"),
//             ),
//             actions: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       "Cancel",
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       String newName = controller.text;
//                       if (newName.isNotEmpty) {
//                         updateUser(documentId, newName);
//                         Navigator.pop(context);
//                         setState(() {
//                           _usersStream = _getUserCustomPlaces();
//                         });
//                         AppMessages().sendVerification(
//                             (context),
//                             Colors.green.withOpacity(0.8),
//                             'Custom place updated successfully!');
//                       }
//                     },
//                     child: const Text(
//                       "Save",
//                       style: TextStyle(color: Colors.green),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ]);
//       },
//     );
//   }

//   void _confirmDelete(BuildContext context, String documentId, String name,
//       Function() onpress) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Confirm Delete"),
//         content: Text("Are you sure you want to delete $name?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel", style: TextStyle(color: Colors.blue)),
//           ),
//           TextButton(
//             onPressed: onpress,
//             child: const Text("Delete", style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget build(BuildContext context) {
//     return BlocConsumer<CustomPlacesBloc, CustomPlacesState>(
//       listener: (context, state) {
//         if (state is DeleteCustomPlacesSuccess) {
//           Navigator.pop(context);
//           setState(() {
//             _usersStream = _getUserCustomPlaces();
//           });
//           AppMessages().sendVerification(
//               (context),
//               Colors.green.withOpacity(0.8),
//               'Custom place deleted successfully!');
//         }
//       },
//       builder: (context, state) {
//         return SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * 0.4,
//             child: StreamBuilder<List<DocumentSnapshot>>(
//               stream: _usersStream,
//               builder: (BuildContext context,
//                   AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
//                 if (snapshot.hasError) {
//                   return Center(
//                       child: Text('Something went wrong: ${snapshot.error}'));
//                 }

//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (snapshot.data!.isEmpty) {
//                   return const Center(child: Text("No custom places found"));
//                 }
//                 final filteredDate = snapshot.data!.where(((element) {
//                   final data = element.data() as Map<String, dynamic>?;
//                   if (data == null) return false;
//                   final name = data['name']?.toString().toLowerCase() ?? '';
//                   return name.contains(widget.searchQuery.toLowerCase());
//                 })).toList();

//                 if (filteredDate.isEmpty) {
//                   return const Center(child: Text("No results found"));
//                 }
//                 return ListView(
//                   shrinkWrap: true,
//                   children: filteredDate.map((DocumentSnapshot document) {
//                     final data = document.data() as Map<String, dynamic>;
//                     String documentId = document.id;

//                     return CustomContainer(
//                       w: 70,
//                       h: 60,
//                       child: ListTile(
//                         title: Text(data['name'] ?? 'No Name'),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             CustomContainer(
//                               w: 40,
//                               h: 40,
//                               child: IconButton(
//                                 icon:
//                                     const Icon(Icons.edit, color: Colors.blue),
//                                 onPressed: () {
//                                   _showEditDialog(
//                                       context, documentId, data['name']);
//                                   print("Edit pressed for ${data['name']}");
//                                 },
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 7,
//                             ),
//                             CustomContainer(
//                               w: 40,
//                               h: 40,
//                               child: IconButton(
//                                 icon:
//                                     const Icon(Icons.delete, color: Colors.red),
//                                 onPressed: () {
//                                   _confirmDelete(
//                                       context, documentId, data['name'], (() {
//                                     BlocProvider.of<CustomPlacesBloc>(context)
//                                         .add(DeleteCustomPlace(documentId));
//                                     Navigator.pop(context);
//                                     setState(() {
//                                       _usersStream = _getUserCustomPlaces();
//                                     });
//                                     AppMessages().sendVerification(
//                                         (context),
//                                         Colors.green.withOpacity(0.8),
//                                         'Custom place deleted successfully!');
//                                   }));
//                                 },
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Components/custom_container.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/components/custom_back_button.dart';
import 'package:nearme_app/core/constants.dart';

import '../../../core/services/customplace_crud_operation.dart';

class SelectPlaceScreen extends StatefulWidget {
  const SelectPlaceScreen({super.key});
  static String selectPlaceScreenKey = '/SelectPlaceScreen';
  @override
  _SelectPlaceScreenState createState() => _SelectPlaceScreenState();
}

class _SelectPlaceScreenState extends State<SelectPlaceScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Stream<List<DocumentSnapshot>> _usersStream;
  final Map<String, bool> _selectedItems = {};
  String _searchQuery = '';
  final List<IconData> _orderedTypes = [
    Icons.home,
    Icons.location_city,
    Icons.work,
    Icons.sunny,
    Icons.restaurant,
  ];
  IconData _getIconForIndex(int index) {
    if (index >= 0 && index < _orderedTypes.length) {
      return _orderedTypes[index];
    }
    return Icons.place;
  }

  @override
  void initState() {
    super.initState();
    _usersStream = _getUserCustomPlaces();
  }

  Stream<List<DocumentSnapshot>> _getUserCustomPlaces() {
    final userId = _auth.currentUser?.uid;
    if (userId == null) {
      return const Stream.empty();
    }

    return FirebaseFirestore.instance
        .collection('user_customPlaces')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .asyncMap((userPlacesSnapshot) async {
      List<DocumentSnapshot> customPlacesDocs = [];
      for (var userPlaceDoc in userPlacesSnapshot.docs) {
        var customPlaceId = userPlaceDoc['customPlaceId'];
        var customPlaceDoc = await FirebaseFirestore.instance
            .collection('customPlaces')
            .doc(customPlaceId)
            .get();
        customPlacesDocs.add(customPlaceDoc);
      }
      return customPlacesDocs;
    });
  }

  @override
  Widget build(BuildContext context) {
    int s = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        title: const Text(
          'Custom Places',
          style: TextStyle(color: kFontColor),
        ),
        centerTitle: true,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
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
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text('Something went wrong: ${snapshot.error}'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data!.isEmpty) {
                    return const Center(child: Text("No custom places found"));
                  }

                  final filteredData = snapshot.data!.where((element) {
                    final data = element.data() as Map<String, dynamic>?;
                    if (data == null) return false;
                    final name = data['name']?.toString().toLowerCase() ?? '';
                    return name.contains(_searchQuery.toLowerCase());
                  }).toList();

                  if (filteredData.isEmpty) {
                    return const Center(child: Text("No results found"));
                  }

                  return ListView(
                    children: filteredData.asMap().entries.map((entry) {
                      final index = entry.key; // الفهرس الحالي
                      final document = entry.value; // العنصر الحالي
                      final data = document.data() as Map<String, dynamic>;
                      String documentId = document.id;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Colors.white.withOpacity(0.7), // لون خلفية شفاف
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                              width: 1.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: _selectedItems[documentId] ?? false
                                    ? Colors.green.withOpacity(0.5)
                                    : Colors.white.withOpacity(0.9),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 40, // عرض الكونتينر
                              height: 40, // ارتفاع الكونتينر
                              decoration: BoxDecoration(
                                color: Colors.white
                                    .withOpacity(0.3), // لون خلفية شفاف
                                borderRadius:
                                    BorderRadius.circular(12), // حواف مدورة
                                border: Border.all(
                                  color: Colors.white
                                      .withOpacity(0.6), // لون الحدود مع شفافية
                                  width: 1.0, // سمك الحدود
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: _selectedItems[documentId] ?? false
                                        ? Colors.green.withOpacity(0.5)
                                        : Colors.grey
                                            .withOpacity(0.4), // لون الظل
                                    blurRadius: 1, // درجة تموج الظل
                                    spreadRadius: 2, // انتشار الظل
                                    offset: const Offset(0, 2), // اتجاه الظل
                                  ),
                                ],
                              ),
                              child: Icon(
                                _getIconForIndex(
                                    index), // الأيقونة بناءً على الفهرس
                                color: Colors.white, // لون الأيقونة
                                size: 24, // حجم الأيقونة
                              ),
                            ),
                            trailing: Checkbox(
                              activeColor:
                                  const Color.fromARGB(255, 107, 149, 105),
                              value: _selectedItems[documentId] ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  _selectedItems[documentId] = value!;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            title: Text(
                              data['name'] ?? 'No Name',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
