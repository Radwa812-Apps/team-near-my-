import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/constants.dart';
import '../../../core/data/bloc/custom_places/custom_places_bloc.dart';
import '../../../core/messages.dart';

class ContainerAddCustom extends StatefulWidget {
  const ContainerAddCustom({
    super.key,
    required this.selectedLatLng,
    required this.markers,
    // required this.onPlaceAdded
  });
  final LatLng selectedLatLng;
  final Set<Marker> markers;
  // final VoidCallback onPlaceAdded;

  @override
  State<ContainerAddCustom> createState() => _ContainerAddCustomState();
}

class _ContainerAddCustomState extends State<ContainerAddCustom> {
  final TextEditingController _textBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                borderSide: const BorderSide(color: Colors.white), // لون الحدود
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear, color: kSpecialColor),
                onPressed: () {
                  _textBarController.clear();
                },
              ),
            ),
            onSubmitted: (value) {
              //  _addMarker();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_textBarController.text.isEmpty ||
                  widget.selectedLatLng == null) {
                AppMessages().sendVerification(
                  context,
                  Colors.red.withOpacity(0.8),
                  'Please enter a place name and select a location on the map.',
                );
                return;
              }
              BlocProvider.of<CustomPlacesBloc>(context).add(
                AddCustomPlaces(
                  latitude: widget.selectedLatLng!.latitude,
                  placeName: _textBarController.text,
                  raduis: 500,
                  longitude: widget.selectedLatLng!.longitude,
                  createdAt: Timestamp.now(),
                  updatedAt: Timestamp.now(),
                  // uId: FirebaseAuth.instance.currentUser!.uid,
                ),
              );

              // _addMarker();

              Navigator.pop(context);
              // setState(() {
              //   widget.onPlaceAdded();
              // });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kSpecialColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            ),
            child: const Text(
              'Add',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> _addMarker() async {
  //   if (_textBarController.text.isNotEmpty && widget.selectedLatLng != null) {
  //     setState(() {
  //       widget.markers.add(
  //         Marker(
  //           markerId: MarkerId(widget.selectedLatLng.toString()),
  //           position: widget.selectedLatLng,
  //           icon:
  //               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //           infoWindow: InfoWindow(
  //             title: _textBarController.text,
  //           ),
  //         ),
  //       );
  //     });

  //     _textBarController.clear();
  //   }
  // }
}
