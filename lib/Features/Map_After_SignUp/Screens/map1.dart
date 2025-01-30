import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Components/custom_container.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/components/custom_back_button.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/screens/sign_in_screen.dart';
import 'package:nearme_app/core/data/models/custom_places.dart';
import 'package:nearme_app/core/data/services/Auth_functions.dart';
import 'package:nearme_app/core/messages.dart';

import '../../../core/constants.dart';
import '../../../core/data/bloc/custom_places/custom_places_bloc.dart';
import '../Components/custom_places.dart';

class Map1 extends StatefulWidget {
  const Map1({super.key});
  static const String map1Key = '/Map1';

  @override
  State<Map1> createState() => _Map1State();
}

class _Map1State extends State<Map1> {
  bool isLoad = false;

  bool _isBottomSheetVisible = false;

  final TextEditingController _textBarController = TextEditingController();
  LatLng? selectedLatLng;
  String? name;
  Set<Marker> markers = {};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _Assuit = CameraPosition(
    target: LatLng(27.18096, 31.18368),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomPlacesBloc, CustomPlacesState>(
      listener: (context, state) {
        if (state is AddCustomPlacesSuccess) {
          isLoad = false;
          AppMessages().sendVerification(context, Colors.green.withOpacity(0.8),
              'This Custon Place added successfuly 😉');
        } else if (state is AddCustomPlacesFailure) {
          isLoad = false;
          AppMessages().sendVerification(
              context, Colors.green.withOpacity(0.8), state.error);
        } else {
          isLoad = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoad,
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GoogleMap(
                      onTap: (latLng) {
                        setState(() {
                          selectedLatLng = latLng;
                        });
                        _addCustomPlaceBottomSheet(context);
                      },
                      markers: markers,
                      mapType: MapType.normal,
                      initialCameraPosition: _Assuit,
                      onMapCreated: (GoogleMapController controller) {
                        if (!_controller.isCompleted) {
                          _controller.complete(controller);
                        }
                      },
                      zoomControlsEnabled: false,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 40,
                  child: Row(children: [
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
                            suffixIcon:
                                Icon(Icons.search, color: kPrimaryColor1),
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
                  ]),
                ),
                Positioned(
                  bottom: 20,
                  left: 310,
                  right: 10,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kSpecialColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.zero,
                          minimumSize: Size(10, 40)),
                      onPressed: () {},
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _addCustomPlaceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _textBarController,
                  decoration: InputDecoration(
                    hintText: 'Enter place name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), // حواف مدوّرة
                      borderSide: BorderSide(color: Colors.white), // لون الحدود
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: kSpecialColor),
                      onPressed: () {
                        _textBarController.clear();
                      },
                    ),
                  ),
                  onSubmitted: (value) {
                    _handleTextBarSubmit();
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_textBarController.text.isEmpty ||
                        selectedLatLng == null) {
                      AppMessages().sendVerification(
                        context,
                        Colors.red.withOpacity(0.8),
                        'Please enter a place name and select a location on the map.',
                      );
                      return;
                    }

                    // إرسال البيانات إلى الكيوبت
                    BlocProvider.of<CustomPlacesBloc>(context).add(
                      AddCustomPlaces(
                        latitude: selectedLatLng!.latitude,
                        placeName: _textBarController.text,
                        raduis: 500,
                        longitude: selectedLatLng!.longitude,
                        createdAt: Timestamp.now(),
                        updatedAt: Timestamp.now(),
                        // uId: FirebaseAuth.instance.currentUser!.uid,
                      ),
                    );

                    // إضافة marker
                    _handleTextBarSubmit();

                    // إغلاق الـ BottomSheet
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSpecialColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _handleTextBarSubmit() async {
    if (_textBarController.text.isNotEmpty && selectedLatLng != null) {
      setState(() {
        markers.add(
          Marker(
            markerId: MarkerId(selectedLatLng.toString()),
            position: selectedLatLng!,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: InfoWindow(
              title: _textBarController.text,
            ),
          ),
        );
      });

      _textBarController.clear();
    }
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
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7), // لون أبيض شفاف
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
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                              onPressed: (() {}),
                              icon: Icon(Icons.search, color: Colors.grey)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 9, vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CustomPlacesCrudOp(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      setState(() {
        _isBottomSheetVisible = false;
      });
    });
  }
}
