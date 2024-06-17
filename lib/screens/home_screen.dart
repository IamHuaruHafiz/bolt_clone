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
  bool initialBottomSheetShown = false;

  @override
  void initState() {
    super.initState();
    getPolyPoints();
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
    });

    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 13.5,
          target: LatLng(
            currentLocation!.latitude!,
            currentLocation!.longitude!,
          ),
        ),
      ),
    );

    // After locating the current position, show the destination input bottom sheet
    _showDestinationInputBottomSheet();
  }

  void _showInitialBottomSheet() {
    if (!initialBottomSheetShown) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        showModalBottomSheet(
          context: context,
          isDismissible: false,
          builder: (context) {
            return SizedBox(
              height: SizeConfig.screenheight! * 0.3,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      getCurrentLocation();
                      Navigator.pop(context); // Close initial bottom sheet
                    },
                    child: const Text('Locate Me'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close initial bottom sheet
                      _showDestinationInputBottomSheet();
                    },
                    child: const Text('Set Later'),
                  ),
                ],
              ),
            );
          },
        );
      });
      initialBottomSheetShown = true;
    }
  }

  void _showDestinationInputBottomSheet() {
    showBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            height: SizeConfig.screenheight! * 0.2, // 20% of screen height
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Enter your destination',
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DestinationScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    // Show initial bottom sheet when the screen is built
    _showInitialBottomSheet();

    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
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
          currentLocation == null
              ? const Center(child: Text("Press the button to get location"))
              : SizedBox(
                  height: SizeConfig.screenheight,
                  width: double.infinity,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        currentLocation!.latitude!,
                        currentLocation!.longitude!,
                      ),
                      zoom: 13.5,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId("currentLocation"),
                        position: LatLng(
                          currentLocation!.latitude!,
                          currentLocation!.longitude!,
                        ),
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
            bottom: 20,
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
