// lib/providers/location_provider.dart
import 'package:flutter_application_1/utils/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geolocator/geolocator.dart'
    hide LocationServiceDisabledException;
// Import our custom exceptions

part 'location_provider.g.dart';

@riverpod
Future<Position> userLocation(ref) async {
  // 1. Check if location services are enabled on the device.
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw LocationServiceDisabledException();
  }

  // 2. Check and request location permissions.
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw LocationPermissionDeniedException();
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw LocationPermissionDeniedForeverException();
  }

  // 3. When we reach here, permissions are granted. Get the current location.
  try {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  } catch (e) {
    // Catch any other potential errors from geolocator
    throw LocationException("Could not determine location. Please try again.");
  }
}
