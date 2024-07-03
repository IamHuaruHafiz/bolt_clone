import 'package:flutter/material.dart';
import 'package:rydeme/components/colors.dart';
import 'package:rydeme/keys/secrete_key.dart';
import 'package:rydeme/models/auto_complete_prediction.dart';
import 'package:rydeme/models/place_autocomplete_response.dart';
import 'package:http/http.dart' as http;
import 'package:rydeme/screens/confirm_rider_screen.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({Key? key}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  TextEditingController pickupController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  List<AutoCompletePrediction> predictions = [];
  FocusNode pickupFocusNode = FocusNode();
  FocusNode destinationFocusNode = FocusNode();
  String currentSearchField = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    pickupFocusNode.addListener(() {
      if (pickupFocusNode.hasFocus) {
        setState(() {
          currentSearchField = 'pickup';
        });
      }
    });
    destinationFocusNode.addListener(() {
      if (destinationFocusNode.hasFocus) {
        setState(() {
          currentSearchField = 'destination';
        });
      }
    });
  }

  void placeAutoComplete(String query) async {
    if (query.isEmpty) {
      setState(() {
        predictions = [];
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    Uri uri =
        Uri.https("maps.googleapis.com", "maps/api/place/autocomplete/json", {
      "input": query,
      "key": placesKey,
    });

    try {
      String? response = await fetchPlaces(uri);
      if (response != null) {
        PlaceAutoCompleteResponse result =
            PlaceAutoCompleteResponse.parseAutoCompleteResponse(response);
        if (result.predictions != null) {
          setState(() {
            predictions = result.predictions!;
          });
        }
      }
    } catch (e) {
      // Handle error appropriately
      print('Error fetching places: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void onListTileTap(AutoCompletePrediction prediction) {
    if (currentSearchField == 'pickup') {
      pickupController.text = prediction.description!;
      pickupFocusNode.unfocus();
      destinationFocusNode.requestFocus();
    } else if (currentSearchField == 'destination') {
      destinationController.text = prediction.description!;
      destinationFocusNode.unfocus();
      if (pickupController.text.isEmpty || destinationController.text.isEmpty) {
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmRideScreen(
            pickupAddress: pickupController.text,
            destinationAddress: destinationController.text,
          ),
        ),
      );
    }

    setState(() {
      predictions = [];
    });
  }

  Future<String?> fetchPlaces(Uri uri, {Map<String, String>? headers}) async {
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load places');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: const Text("Your route"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: pickupController,
              focusNode: pickupFocusNode,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.circle_outlined),
                suffixIcon:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.map)),
                hintText: "Search Pickup Location",
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 2,
                  ),
                ),
              ),
              onSubmitted: (_) {
                destinationFocusNode.requestFocus();
              },
              onChanged: (value) {
                placeAutoComplete(value);
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: destinationController,
              focusNode: destinationFocusNode,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.map)),
                hintText: "Search Destination Location",
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 2,
                  ),
                ),
              ),
              onSubmitted: (_) {
                if (pickupController.text.isEmpty ||
                    destinationController.text.isEmpty) {
                  return;
                }
                destinationFocusNode.unfocus();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmRideScreen(
                      pickupAddress: pickupController.text,
                      destinationAddress: destinationController.text,
                    ),
                  ),
                );
              },
              onChanged: (value) {
                placeAutoComplete(value);
              },
            ),
            const SizedBox(height: 20),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: predictions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            onListTileTap(predictions[index]);
                          },
                          title: Text(predictions[index].description!),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
