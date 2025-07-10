import 'package:geocoding/geocoding.dart';

String formatAddress(Placemark placeMark) {
  return [
    '${placeMark.subThoroughfare ?? ''} ${placeMark.thoroughfare ?? ''}'.trim(),
    placeMark.subLocality,
    placeMark.locality,
    placeMark.subAdministrativeArea,
    placeMark.administrativeArea,
    placeMark.postalCode,
    placeMark.country,
  ].where((part) => part != null && part.trim().isNotEmpty).join(' ');
}
