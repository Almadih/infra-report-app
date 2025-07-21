// lib/models/home_map_data.dart
import 'package:infra_report/models/report_model.dart';
import 'package:geolocator/geolocator.dart';

class HomeMapData {
  final List<Report> reports;
  final Position userPosition;
  final ReportLocation? center;

  HomeMapData({required this.reports, required this.userPosition, this.center});
}
