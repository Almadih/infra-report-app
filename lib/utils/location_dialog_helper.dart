// lib/utils/location_dialog_helper.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/exceptions.dart';
import 'package:geolocator/geolocator.dart'
    hide LocationServiceDisabledException;
import 'package:permission_handler/permission_handler.dart'; // For opening app settings

class LocationDialogHelper {
  static void showLocationErrorDialog(BuildContext context, Object error) {
    String title = 'Location Error';
    String content = 'An unknown error occurred. Please try again.';
    String buttonText = 'OK';
    VoidCallback? onButtonPressed = () => Navigator.of(context).pop();
    print(error);

    if (error is LocationServiceDisabledException) {
      title = 'Location Services Disabled';
      content = 'Please enable location services on your device to continue.';
      buttonText = 'Open Settings';
      onButtonPressed = () {
        Geolocator.openLocationSettings();
        Navigator.of(context).pop();
      };
    } else if (error is LocationPermissionDeniedException) {
      // This case is often handled by the requestPermission prompt itself,
      // but we can show it if the user dismisses the native prompt.
      title = 'Location Permission Denied';
      content =
          'This app needs location permissions to function. Please grant permission when prompted.';
      // No special action, just inform the user.
    } else if (error is LocationPermissionDeniedForeverException) {
      title = 'Location Permission Required';
      content =
          'You have permanently denied location permissions for this app. Please go to your device settings to enable them.';
      buttonText = 'Open App Settings';
      onButtonPressed = () {
        openAppSettings(); // From permission_handler package
        Navigator.of(context).pop();
      };
    } else {
      // Generic fallback
      content = error.toString();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(onPressed: onButtonPressed, child: Text(buttonText)),
        ],
      ),
    );
  }
}
