import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rydeme/keys/secrete_key.dart';
import 'package:rydeme/provider/auth_provider.dart';

Future<void> fetchRouteData(
  double originLat,
  double originLng,
  double destinationLat,
  double destinationLng,
) async {
  // Replace with your own Google API key

  // Define the request body
  Map<String, dynamic> requestBody = {
    "origin": {
      "location": {
        "latLng": {"latitude": originLat, "longitude": originLng}
      }
    },
    "destination": {
      "location": {
        "latLng": {"latitude": destinationLat, "longitude": destinationLng}
      }
    },
    "travelMode": "DRIVE",
    "routingPreference": "TRAFFIC_AWARE",
    "departureTime": "2023-10-15T15:01:23.045123456Z",
    "computeAlternativeRoutes": false,
    "routeModifiers": {
      "avoidTolls": false,
      "avoidHighways": false,
      "avoidFerries": false
    },
    "languageCode": "en-US",
    "units": "IMPERIAL"
  };

  // Define the API endpoint
  final String url =
      'https://routes.googleapis.com/directions/v2:computeRoutes';

  // Define headers
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'X-Goog-Api-Key': routingKey,
    'X-Goog-FieldMask':
        'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
  };

  // Make POST request
  try {
    final response = await http.post(Uri.parse(url),
        headers: headers, body: json.encode(requestBody));

    // Check if request was successful
    if (response.statusCode == 200) {
      // Parse response body
      Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData); // Replace with your handling logic
    } else {
      // Handle errors
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
