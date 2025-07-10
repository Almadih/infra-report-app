// lib/utils/exceptions.dart

/// Base class for location-related failures.
class LocationException implements Exception {
  final String message;
  LocationException(this.message);
}

/// Thrown when the device's location services are turned off.
class LocationServiceDisabledException extends LocationException {
  LocationServiceDisabledException() : super('Location services are disabled.');
}

/// Thrown when the user has denied the app location permissions.
class LocationPermissionDeniedException extends LocationException {
  LocationPermissionDeniedException()
    : super('Location permissions are denied.');
}

/// Thrown when location permissions are permanently denied.
class LocationPermissionDeniedForeverException extends LocationException {
  LocationPermissionDeniedForeverException()
    : super('Location permissions are permanently denied.');
}
