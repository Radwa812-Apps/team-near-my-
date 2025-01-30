import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Components/custom_container.dart';

import '../../../core/data/services/customplace_crud_operation.dart';

class CustomPlacesCrudOp extends StatefulWidget {
  const CustomPlacesCrudOp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomPlacesCrudOpState createState() => _CustomPlacesCrudOpState();
}

class _CustomPlacesCrudOpState extends State<CustomPlacesCrudOp> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('customPlaces').snapshots();

  void _showEditDialog(
      BuildContext context, String documentId, String currentName) {
    TextEditingController controller = TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (context) {
        return Stack(children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text("Edit Name"),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: "Enter new name"),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      String newName = controller.text;
                      if (newName.isNotEmpty) {
                        updateUser(documentId, newName);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('Something went wrong: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No custom places found"));
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                String documentId = document.id;
                return CustomContainer(
                  w: 70,
                  h: 60,
                  child: ListTile(
                    title: Text(data['name'] ?? 'No Name'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomContainer(
                          w: 40,
                          h: 40,
                          child: IconButton(
                            icon: const Icon(Icons.edit,
                                color: Colors.blue), // أيقونة التعديل
                            onPressed: () {
                              _showEditDialog(
                                  context, documentId, data['name']);
                              print("Edit pressed for ${data['name']}");
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        CustomContainer(
                          w: 40,
                          h: 40,
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              deleteUser(documentId);
                              print("Delete pressed for ${data['name']}");
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
