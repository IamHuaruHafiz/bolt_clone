import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/config/size_config.dart';
import 'package:rydeme/keys/secrete_key.dart';
import 'package:rydeme/widgets/drawer_widget.dart';

import 'destination_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  LatLng? markerPosition;
  bool initialBottomSheetShown = false;

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey, // Your Google Map Key
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      setState(() {
        polylineCoordinates = result.points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();
      });
    }
  }

  CameraPosition? cameraPosition;

  void updateCameraPosition(CameraPosition position) {
    setState(() {
      cameraPosition = position;
    });
  }

  void getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    LocationData locationData = await location.getLocation();
    setState(() {
      currentLocation = locationData;
      markerPosition =
          LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
      print(currentLocation!.latitude.toString() +
          currentLocation!.longitude.toString());
    });

    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 13.5,
          target: markerPosition!,
        ),
      ),
    );

    // After locating the current position, show the destination input bottom sheet
  }

  void _showInitialBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) {
        return SizedBox(
          height: SizeConfig.screenheight! * 0.3,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
                onPressed: () {
                  getCurrentLocation();
                  Navigator.pop(context); // Close initial bottom sheet
                },
                child: const Text('Locate Me'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
                onPressed: () {
                  Navigator.pop(context); // Close initial bottom sheet
                },
                child: const Text('Set Later'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 80,
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[400],
              hintText: "Enter destination",
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DestinationScreen(),
                ),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu_outlined),
          ),
        ),
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: const DrawerWidget(),
      body: Stack(
        children: [
          SizedBox(
            height: SizeConfig.screenheight,
            width: double.infinity,
            child: GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocation == null
                      ? 37.33500926
                      : currentLocation!.latitude!,
                  currentLocation == null
                      ? -122.03272188
                      : currentLocation!.longitude!,
                ),
                zoom: 13.5,
              ),
              markers: {
                if (markerPosition != null)
                  Marker(
                    markerId: const MarkerId("currentLocation"),
                    position: markerPosition!,
                  ),
                const Marker(
                  markerId: MarkerId("source"),
                  position: sourceLocation,
                ),
                const Marker(
                  markerId: MarkerId("destination"),
                  position: destination,
                ),
              },
              onTap: (LatLng position) {
                setState(() {
                  markerPosition = position;
                });
              },
              onMapCreated: (mapController) {
                if (!_controller.isCompleted) {
                  _controller.complete(mapController);
                }
              },
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates,
                  color: const Color(0xFF7B61FF),
                  width: 6,
                ),
              },
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: FloatingActionButton(
              onPressed: getCurrentLocation,
              child: const Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}
