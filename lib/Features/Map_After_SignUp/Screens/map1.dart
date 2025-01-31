import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Components/complete_map_ui.dart';
import '../../../core/data/bloc/custom_places/custom_places_bloc.dart';
import '../../../core/messages.dart';
import '../Components/container_add_custom.dart';
import '../Components/custom_botton_skip.dart';

class Map1 extends StatefulWidget {
  const Map1({super.key});
  static const String map1Key = '/Map1';
  @override
  State<Map1> createState() => _Map1State();
}

class _Map1State extends State<Map1> {
  bool isLoad = false;
  LatLng? selectedLatLng;
  Set<Marker> markers = {};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  // ignore: constant_identifier_names
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
                const Positioned(left: 10, top: 40, child: CompleteMapUi()),
                const Positioned(
                    bottom: 20, left: 310, right: 10, child: SkipBtn()),
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
            child: ContainerAddCustom(
              selectedLatLng: selectedLatLng!, markers: markers,
            ));
      },
    );
  }
}
