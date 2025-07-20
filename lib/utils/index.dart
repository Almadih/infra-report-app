import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:json_theme/json_theme.dart';

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

Future<ThemeData> getTheme() async {
  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  return theme;
}
