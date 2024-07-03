import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as GeoCoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rydeme/components/colors.dart';
import 'dart:convert';

import 'package:rydeme/keys/secrete_key.dart';

class ConfirmRideScreen extends StatefulWidget {
  final String pickupAddress;
  final String destinationAddress;

  const ConfirmRideScreen(
      {required this.pickupAddress, required this.destinationAddress});

  @override
  _ConfirmRideScreenState createState() => _ConfirmRideScreenState();
}

class _ConfirmRideScreenState extends State<ConfirmRideScreen> {
  late Future<void> _locationFuture;
  late LatLng pickupLocation;
  late LatLng destinationLocation;
  final Set<Polyline> _polylines = {};
  String timeToArrive = "";
  double amountToPay = 0.0;

  @override
  void initState() {
    super.initState();
    _locationFuture = _getLocations();
  }

  Future<void> _getLocations() async {
    List<GeoCoding.Location> pickupLocations =
        await GeoCoding.locationFromAddress(widget.pickupAddress);
    List<GeoCoding.Location> destinationLocations =
        await GeoCoding.locationFromAddress(widget.destinationAddress);

    pickupLocation =
        LatLng(pickupLocations.first.latitude, pickupLocations.first.longitude);
    destinationLocation = LatLng(destinationLocations.first.latitude,
        destinationLocations.first.longitude);

    await _getRoute();
  }

  double calculateFare(int durationInSeconds) {
    double baseFare = 5.0;

    if (durationInSeconds < 300) {
      return baseFare;
    } else {
      double additionalFarePerSecond = 0.02;
      double additionalFare =
          (durationInSeconds - 300) * additionalFarePerSecond;

      double totalFare = baseFare + additionalFare;
      return totalFare;
    }
  }

  Future<void> _getRoute() async {
    final directions = await fetchRoutes(pickupLocation, destinationLocation);
    if (directions != null) {
      final points = _decodePolyline(
          directions['routes'][0]['polyline']['encodedPolyline']);
      final durationInSeconds = directions['routes'][0]['duration'].toString();

      String formattedDuration;

      if (durationInSeconds.length > 1) {
        String shortenedDurationString =
            durationInSeconds.substring(0, durationInSeconds.length - 1);

        int duration = int.parse(shortenedDurationString);

        if (duration < 3600) {
          // Convert to minutes
          int durationInMinutes = (duration / 60).floor();
          formattedDuration = '$durationInMinutes mins';
        } else {
          // Convert to hours
          double durationInHours = duration / 3600;
          formattedDuration = '${durationInHours.toStringAsFixed(1)} hours';
        }
      } else {
        // Handle case where duration is very short (e.g., less than 10 seconds)
        formattedDuration = '$durationInSeconds secs';
      }
      double amount = calculateFare(int.parse(
          durationInSeconds.substring(0, durationInSeconds.length - 1)));
      setState(() {
        timeToArrive = formattedDuration;
        amountToPay = amount;
        _polylines.add(Polyline(
          polylineId: const PolylineId('route'),
          points: points,
          color: Colors.blue,
          width: 3,
        ));
      });
    }
  }

  Future<Map<String, dynamic>?> fetchRoutes(
      LatLng origin, LatLng destination) async {
    final String url =
        'https://routes.googleapis.com/directions/v2:computeRoutes';

    final body = jsonEncode({
      "origin": {
        "location": {
          "latLng": {"latitude": origin.latitude, "longitude": origin.longitude}
        }
      },
      "destination": {
        "location": {
          "latLng": {
            "latitude": destination.latitude,
            "longitude": destination.longitude
          }
        }
      },
      "travelMode": "DRIVE"
    });

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': routeKey,
        'X-Goog-FieldMask':
            'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load routes');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> poly = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      poly.add(LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble()));
    }

    return poly;
  }

  bool onConfirmRide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<void>(
        future: _locationFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Stack(
              children: [
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    Marker pickupMarker = Marker(
                      markerId: const MarkerId('pickup'),
                      infoWindow: const InfoWindow(title: 'Pickup'),
                      position: pickupLocation,
                    );
                  },
                  initialCameraPosition: CameraPosition(
                    target: pickupLocation,
                    zoom: 16,
                  ),
                  polylines: _polylines,
                  markers: {
                    Marker(
                      markerId: const MarkerId('pickup'),
                      infoWindow: const InfoWindow(title: 'Pickup'),
                      position: pickupLocation,
                    ),
                    Marker(
                        markerId: const MarkerId('destination'),
                        infoWindow: InfoWindow(title: 'Arive in $timeToArrive'),
                        position: destinationLocation,
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueGreen)),
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: onConfirmRide
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.pickupAddress,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Row(children: [
                                const Text("RydeMe"),
                                const SizedBox(width: 8),
                                Text("GH₵$amountToPay",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                              ]),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: AppColors.black,
                                  ),
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                        useSafeArea: false,
                                        showDragHandle: true,
                                        isDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return Wrap(children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Driver Found",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge!
                                                            .copyWith(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )),
                                                    Text(
                                                        "Waiting for the driver to confirm order",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge),
                                                    const SizedBox(height: 8),
                                                    const LinearProgressIndicator(
                                                      value: 0.4,
                                                      color: AppColors.primary,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        const CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor:
                                                              AppColors.grey,
                                                        ),
                                                        Column(
                                                          children: [
                                                            IconButton(
                                                                iconSize: 50,
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  setState(() {
                                                                    onConfirmRide =
                                                                        false;
                                                                  });
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .no_transfer)),
                                                            const Text(
                                                                "Cancel ride"),
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ]),
                                            )
                                          ]);
                                        });
                                  },
                                  child: Text(
                                    'Confirm Order',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.6),
                                    border:
                                        Border.all(color: AppColors.primary),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(Icons.car_rental,
                                        size: 40, color: AppColors.black),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "RydeMe",
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        Row(
                                          children: [
                                            Text(timeToArrive),
                                            const Icon(Icons.person),
                                            Text(
                                              "Recommended",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(
                                      "GH₵$amountToPay",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: AppColors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      onConfirmRide = true;
                                      _polylines.clear();
                                    });
                                  },
                                  child: Text(
                                    'Confirm Ride',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
