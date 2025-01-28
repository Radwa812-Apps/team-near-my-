import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Components/show_customplaces.dart';

import '../../../core/constants.dart';
import '../Components/custom_places.dart';

class Map1 extends StatefulWidget {
  const Map1({super.key});
  static const String map1Key = 'Map1';

  @override
  State<Map1> createState() => _Map1State();
}

class _Map1State extends State<Map1> {
  bool _isBottomSheetVisible = false;
  final TextEditingController _textBarController = TextEditingController();
  LatLng? selectedLatLng;

  Set<Marker> markers = {};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _Assuit = CameraPosition(
    target: LatLng(27.18096, 31.18368),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  _showBottomSheet(context);
                },
                markers: markers,
                mapType: MapType.normal,
                initialCameraPosition: _Assuit,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                zoomControlsEnabled: false,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: _isBottomSheetVisible ? 220 : 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 140,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.skip_next_rounded,
                        color: kPrimaryColor1,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.location_on_rounded,
                      color: kPrimaryColor1,
                      size: 40,
                    ),
                    onPressed: () {
                      _showCustomBottomSheet(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 140,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: kPrimaryColor1,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // تحديد شكل الحواف المدورة
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0), // جعل الحواف العلوية مدورة
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // للتأكد من أن الـ TextField لا يتم تغطيته بواسطة لوحة المفاتيح
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0), // جعل حواف الـ BottomSheet مدورة
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // لون خلفية TextField
                    borderRadius: BorderRadius.circular(10.0), // حواف مدورة
                  ),
                  child: TextField(
                    controller: _textBarController,
                    decoration: InputDecoration(
                      hintText: 'Enter place name',
                      border: InputBorder.none, // إزالة الحدود الافتراضية
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0), // تعديل المساحة الداخلية
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: kSpecialColor,
                        ), // أيقونة المسح
                        onPressed: () {
                          _textBarController
                              .clear(); // مسح النص عند الضغط على الأيقونة
                        },
                      ),
                    ),
                    onSubmitted: (value) {
                      _handleTextBarSubmit();
                      _textBarController.clear(); // مسح النص بعد الإرسال
                      Navigator.pop(
                          context); // لإغلاق الـ BottomSheet بعد الإرسال
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _handleTextBarSubmit();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSpecialColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 16.0), // حجم النص
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

        _textBarController.clear();
      });
    }
  }

  void _showCustomBottomSheet(BuildContext context) {
    setState(() {
      _isBottomSheetVisible = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomPlaces(),
                const SizedBox(height: 20),
              ],
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
