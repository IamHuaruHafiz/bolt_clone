import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as GeoCoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
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

  Future<void> _getRoute() async {
    final directions = await fetchRoutes(pickupLocation, destinationLocation);
    if (directions != null) {
      final points = _decodePolyline(
          directions['routes'][0]['polyline']['encodedPolyline']);
      setState(() {
        _polylines.add(Polyline(
          polylineId: PolylineId('route'),
          points: points,
          color: Colors.blue,
          width: 5,
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
        'X-Goog-FieldMask': 'routes.legs',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: FutureBuilder<void>(
        future: _locationFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: pickupLocation,
                zoom: 14,
              ),
              polylines: _polylines,
              markers: {
                Marker(
                  markerId: MarkerId('pickup'),
                  position: pickupLocation,
                ),
                Marker(
                  markerId: MarkerId('destination'),
                  position: destinationLocation,
                ),
              },
            );
          }
        },
      ),
    );
  }
}
