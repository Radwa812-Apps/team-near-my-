import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nearme_app/Features/Map_After_SignUp/Components/complete_map_ui.dart';
import 'package:nearme_app/Features/auth/Sign_up_and_in/screens/sign_in_screen.dart';
import '../../../core/data/bloc/custom_places/custom_places_bloc.dart';
import '../../../core/data/models/custom_places.dart';
import '../../../core/data/services/customplace_crud_operation.dart';
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
  List<CustomPlace> customPlaces = [];
  bool isLoad = false;
  LatLng? selectedLatLng;
  Set<Marker> markers = {};
  StreamSubscription<User?>? _authListener;
  Set<Marker> convertToMarkers(List<CustomPlace> customPlaces) {
    return customPlaces.map((place) {
      return Marker(
        markerId: MarkerId(place.id),
        position: LatLng(place.latitude, place.longitude),
        infoWindow: InfoWindow(title: place.name),
      );
    }).toSet();
  }

  void initState() {
    _authListener =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("User is signed out.");
      } else {
        print("User is signed in: ${user.uid}");
      }
    });
    _loadCustomPlaces();
  }

  void dispose() {
    _authListener?.cancel();
    super.dispose();
  }

  Future<void> _loadCustomPlaces() async {
    final customPlaces = await getUserCustomPlaces();
    setState(() {
      this.customPlaces = customPlaces;
      markers = convertToMarkers(customPlaces);
    });
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  // ignore: constant_identifier_names
  static const CameraPosition _Assuit = CameraPosition(
    target: LatLng(27.18096, 31.18368),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    final markers = convertToMarkers(customPlaces);
    return BlocConsumer<CustomPlacesBloc, CustomPlacesState>(
      listener: (context, state) {
        if (state is AddCustomPlacesSuccess) {
          isLoad = false;
          AppMessages().sendVerification(context, Colors.green.withOpacity(0.8),
              'This Custon Place added successfuly 😉');
          setState(() {
            _loadCustomPlaces(); // تحديث الخريطة بعد نجاح الإضافة
          });
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
              selectedLatLng: selectedLatLng!,
              markers: markers,
              // onPlaceAdded: () {
              //   setState(() {
              //     _loadCustomPlaces();
              //   });
              // },
            
            ));
      },
    );
  }

  // void _checkIfUserIsSignedIn() {
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user == null) {
  //     Navigator.pushNamed(context, SignInScreen.signInScreenKey);
  //     print("User is not signed in.");
  //   } else {
  //     print("User is signed in: ${user.uid}");
  //   }
  // }

}
