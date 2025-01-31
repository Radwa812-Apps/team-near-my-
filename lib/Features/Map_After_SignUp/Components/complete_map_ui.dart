import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constants.dart';
import 'custom_container.dart';
import 'custom_places.dart';

class CompleteMapUi extends StatefulWidget {
  const CompleteMapUi({super.key});

  @override
  State<CompleteMapUi> createState() => _CompleteMapUiState();
}

class _CompleteMapUiState extends State<CompleteMapUi> {
  bool _isBottomSheetVisible = false;
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomContainer(
        w: 44,
        h: 44,
        child: IconButton(
          icon: const Icon(
            Icons.location_on_outlined,
            color: kPrimaryColor1,
            size: 30,
          ),
          onPressed: () {
            _showCustomBottomSheet(context);
          },
        ),
      ),
      CustomContainer(
        w: 250,
        h: 50,
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search ...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: BorderSide.none,
              ),
              suffixIcon: const Icon(Icons.search, color: kPrimaryColor1),
            ),
          ),
        ),
      ),
      CustomContainer(
        w: 44,
        h: 44,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: kPrimaryColor1,
            size: 25,
          ),
          onPressed: () {},
        ),
      )
    ]);
  }

  void _showCustomBottomSheet(BuildContext context) {
    setState(() {
      _isBottomSheetVisible = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setModalState(() {
                                searchQuery = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  onPressed: (() {}),
                                  icon: const Icon(Icons.search,
                                      color: Colors.grey)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomPlacesCrudOp(
                          searchQuery: searchQuery,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {
        _isBottomSheetVisible = false;
      });
    });
  }
}
