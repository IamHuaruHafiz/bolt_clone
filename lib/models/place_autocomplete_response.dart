import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rydeme/models/auto_complete_prediction.dart';

class PlaceAutoCompleteResponse {
  final String? status;
  final List<AutoCompletePrediction>? predictions;

  PlaceAutoCompleteResponse({required this.status, required this.predictions});
  factory PlaceAutoCompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutoCompleteResponse(
      status: json['status'] as String?,
      predictions: json['predictions'] != null
          ? (json['predictions'] as List)
              .map((e) => AutoCompletePrediction.fromJson(e))
              .toList()
          : null,
    );
  }
  static PlaceAutoCompleteResponse parseAutoCompleteResponse(
      String responseBody) {
    final parsed = jsonDecode(responseBody).cast<String, dynamic>();
    return PlaceAutoCompleteResponse.fromJson(parsed);
  }
}
