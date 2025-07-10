// lib/models/home_map_data.dart
import 'package:flutter_application_1/models/report_model.dart';
import 'package:geolocator/geolocator.dart';

class HomeMapData {
  final List<Report> reports;
  final Position userPosition;

  HomeMapData({required this.reports, required this.userPosition});
}
