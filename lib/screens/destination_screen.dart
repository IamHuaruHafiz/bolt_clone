import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart'; // Add this package for geocoding

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({Key? key}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  TextEditingController pickupController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  List<Placemark> pickupPlacemarks = [];
  List<Placemark> destinationPlacemarks = [];

  void searchPickupLocation(String query) async {
    if (query.trim().isNotEmpty) {
      List<Location> locations = await locationFromAddress(query.trim());
      List<Placemark> placemarks = [];
      for (var location in locations) {
        placemarks += await placemarkFromCoordinates(
            location.latitude, location.longitude);
      }
      setState(() {
        pickupPlacemarks = placemarks;
      });
    } else {
      setState(() {
        pickupPlacemarks = [];
      });
    }
  }

  void searchDestinationLocation(String query) async {
    if (query.trim().isNotEmpty) {
      List<Location> locations = await locationFromAddress(query.trim());
      List<Placemark> placemarks = [];
      for (var location in locations) {
        placemarks += await placemarkFromCoordinates(
            location.latitude, location.longitude);
      }
      setState(() {
        destinationPlacemarks = placemarks;
      });
    } else {
      setState(() {
        destinationPlacemarks = [];
      });
    }
  }

  String formatPlacemark(Placemark placemark) {
    return "${placemark.name}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Set Destination"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: pickupController,
              decoration: InputDecoration(labelText: "Search Pickup Location"),
              onChanged: searchPickupLocation,
            ),
            SizedBox(height: 10),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(labelText: "Destination"),
              onChanged: searchDestinationLocation,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ...pickupPlacemarks.map((placemark) => ListTile(
                        title: Text(formatPlacemark(placemark)),
                      )),
                  ...destinationPlacemarks.map((placemark) => ListTile(
                        title: Text(formatPlacemark(placemark)),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
