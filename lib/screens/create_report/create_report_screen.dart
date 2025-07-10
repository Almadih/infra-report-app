// lib/screens/create_report/create_report_screen.dart
// For XFile
import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/connectivity_provider.dart';
import 'package:flutter_application_1/providers/home_map_data_provider.dart';
import 'package:flutter_application_1/providers/location_provider.dart';
import 'package:flutter_application_1/repositories/report_repository.dart';
import 'package:flutter_application_1/utils/index.dart';
import 'package:flutter_application_1/widgets/success_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_application_1/models/report_model.dart'
    as app_models; // Alias to avoid conflict
import 'package:flutter_application_1/providers/damage_type_provider.dart';
import 'package:flutter_application_1/providers/severity_provider.dart';
import 'package:flutter_application_1/screens/create_report/map_location_selector_page.dart';
import 'package:flutter_application_1/screens/create_report/widgets/image_picker_input.dart';

// Helper to get location permission status
Future<bool> _requestLocationPermission() async {
  var status = await Permission.location.status;
  if (status.isDenied || status.isPermanentlyDenied) {
    status = await Permission.location.request();
  }
  return status.isGranted;
}

class CreateReportScreen extends ConsumerStatefulWidget {
  const CreateReportScreen({super.key});

  @override
  ConsumerState<CreateReportScreen> createState() => _CreateReportScreenState();
}

class _CreateReportScreenState extends ConsumerState<CreateReportScreen> {
  static const CameraPosition _kDefaultLocation = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 7,
  );
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ImagePickerInputState> _imagePickerKey =
      GlobalKey<ImagePickerInputState>();
  Completer<GoogleMapController> _controller = Completer();

  List<XFile> _selectedImages = [];
  LatLng? _selectedLocation;
  int? _selectedDamageTypeId;
  int? _selectedSeverityId;
  String _description = '';

  bool _isFetchingLocation = false;
  String? _locationError;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _setDefaultLocation();
  }

  Future<void> _setDefaultLocation() async {
    setState(() {
      _isFetchingLocation = true;
      _locationError = null;
    });

    try {
      final position = await ref.read(userLocationProvider.future);
      if (mounted) {
        setState(() {
          _selectedLocation = LatLng(position.latitude, position.longitude);
          _isFetchingLocation = false;
        });

        final GoogleMapController controller = await _controller.future;
        controller.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                _selectedLocation!.latitude,
                _selectedLocation!.longitude,
              ),
              zoom: 14,
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _locationError = "Could not get current location: ${e.toString()}";
          _isFetchingLocation = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(_locationError!)));
      }
    }
  }

  Future<void> _pickLocationFromMap() async {
    final LatLng? result = await Navigator.push<LatLng?>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MapLocationSelectorPage(initialPosition: _selectedLocation),
      ),
    );
    if (result != null && mounted) {
      setState(() {
        _selectedLocation = result;
        _locationError = null; // Clear error if location is now selected
      });

      final GoogleMapController controller = await _controller.future;
      controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              _selectedLocation!.latitude,
              _selectedLocation!.longitude,
            ),
            zoom: 14,
          ),
        ),
      );
    }
  }

  Widget _buildLocationPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Location*', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        if (_isFetchingLocation)
          const Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 8),
              Text("Fetching current location..."),
            ],
          ),
        if (_locationError != null)
          Text(
            _locationError!,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        if (!_isFetchingLocation && _selectedLocation != null)
          Text(
            'Lat: ${_selectedLocation!.latitude.toStringAsFixed(5)}, Lng: ${_selectedLocation!.longitude.toStringAsFixed(5)}',
          ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 100,

          child: GoogleMap(
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            zoomGesturesEnabled: false,
            myLocationEnabled: false,
            scrollGesturesEnabled: false,

            initialCameraPosition: _kDefaultLocation,
            markers: _selectedLocation != null
                ? {
                    Marker(
                      markerId: MarkerId('location'),
                      position: LatLng(
                        _selectedLocation!.latitude,
                        _selectedLocation!.longitude,
                      ),
                    ),
                  }
                : {},
            // myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            // The map controls (like zoom buttons, Google logo) will
            // typically be inset by default to avoid the status bar.
            // The map tiles themselves should render edge-to-edge.
            // You can adjust 'padding' if map controls overlap critical UI.
            // For example, to ensure map controls are not under the status bar:
            // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            // However, often this is handled well by default with edgeToEdge.
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          icon: const Icon(Icons.map),
          label: Text(
            _selectedLocation == null
                ? 'Select on Map'
                : 'Change Location on Map',
          ),
          onPressed: _pickLocationFromMap,
        ),
        Container(),
        if (_selectedLocation == null &&
            !_isFetchingLocation &&
            _locationError == null &&
            _formSubmittedOnce)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Please select a location.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDamageTypeSelector(List<app_models.DamageType> damageTypes) {
    // Map damage type names to icons
    final Map<String, IconData> damageTypeIcons = {
      "school": Icons.school,
      "school building": Icons.school,
      "road": Icons.directions_car,
      "road damage": Icons.directions_car,
      "building": Icons.business,
      "public building": Icons.business,
      "hospital": Icons.local_hospital,
      "hospital infrastructure": Icons.local_hospital,
      "power line": Icons.electrical_services,
      // Add more mappings as needed
    };

    IconData getIconForDamageType(String name) {
      for (var key in damageTypeIcons.keys) {
        if (name.toLowerCase().contains(key)) {
          return damageTypeIcons[key]!;
        }
      }
      return Icons.warning_amber_rounded; // Default icon
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Damage Type*',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 60,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: damageTypes.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final type = damageTypes[index];
              return ChoiceChip(
                avatar: Icon(
                  getIconForDamageType(type.name),
                  color: _selectedDamageTypeId == type.id
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                ),
                label: Text(type.name),
                selected: _selectedDamageTypeId == type.id,
                onSelected: (selected) {
                  setState(() {
                    _selectedDamageTypeId = selected ? type.id : null;
                  });
                },
                selectedColor: Theme.of(context).colorScheme.primary,
                labelStyle: TextStyle(
                  color: _selectedDamageTypeId == type.id
                      ? Theme.of(context).colorScheme.onPrimary
                      : null,
                ),
              );
            },
          ),
        ),
        if (_selectedDamageTypeId == null && _formSubmittedOnce)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Please select a damage type.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSeveritySelector(List<app_models.Severity> severities) {
    // Map severity names to colors
    Map<String, Color> severityColors = {
      "low": Colors.green.shade300,
      "medium": Colors.yellow.shade600,
      "high": Colors.orange.shade700,
      "critical": Colors.red.shade700,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Severity*', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: severities.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final severity = severities[index];
              bool isSelected = _selectedSeverityId == severity.id;
              return ChoiceChip(
                label: Text(severity.name),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    _selectedSeverityId = selected ? severity.id : null;
                  });
                },
                backgroundColor:
                    severityColors[severity.name.toLowerCase()]?.withOpacity(
                      0.2,
                    ) ??
                    Colors.grey.shade200,
                selectedColor:
                    severityColors[severity.name.toLowerCase()] ??
                    Theme.of(context).colorScheme.primary,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                side: isSelected
                    ? BorderSide.none
                    : BorderSide(color: Colors.grey.shade400),
              );
            },
          ),
        ),
        if (_selectedSeverityId == null && _formSubmittedOnce)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Please select a severity level.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  bool _formSubmittedOnce =
      false; // To show validation messages only after first attempt

  void _submitReport() async {
    setState(() {
      _formSubmittedOnce = true;
    });

    final repo = ref.read(reportRepositoryProvider);
    final isConnected = await ref.read(appConnectivityProvider.future);

    // Trigger image picker validation
    _imagePickerKey.currentState?.triggerValidation();

    if (_formKey.currentState!.validate()) {
      // Additional custom validations
      bool imagesValid = _selectedImages.isNotEmpty;
      bool locationValid = _selectedLocation != null;
      bool damageTypeValid = _selectedDamageTypeId != null;
      bool severityValid = _selectedSeverityId != null;

      if (!imagesValid ||
          !locationValid ||
          !damageTypeValid ||
          !severityValid) {
        // Force a rebuild to show custom validation messages if not already shown by formKey
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all required fields.')),
        );
        return;
      }

      _formKey.currentState!.save();
      // Implement actual report submission logic here
      print('Submitting Report:');
      print('Images: ${_selectedImages.map((e) => e.path).toList()}');
      print(
        'Location: ${_selectedLocation?.latitude}, ${_selectedLocation?.longitude}',
      );
      print('Damage Type ID: $_selectedDamageTypeId');
      print('Severity ID: $_selectedSeverityId');
      print('Description: $_description');

      List<Placemark> placeMarks = await placemarkFromCoordinates(
        _selectedLocation!.latitude,
        _selectedLocation!.longitude,
      );

      String address = "not available";
      String? city = "";

      if (placeMarks.isNotEmpty) {
        final placeMark = placeMarks.first;
        //street, city, region, postalCode, country
        city = placeMark.administrativeArea;

        address = formatAddress(placeMark);
      }

      setState(() {
        _isSubmitting = true;
      });

      try {
        if (isConnected) {
          // --- ONLINE SUBMISSION ---
          await repo.submitReport(
            images: _selectedImages.map((xfile) => File(xfile.path)).toList(),
            latitude: _selectedLocation!.latitude,
            longitude: _selectedLocation!.longitude,
            damageTypeId: _selectedDamageTypeId!,
            severityId: _selectedSeverityId!,
            description: _description,
            city: city,
            address: address,
          );

          if (mounted) {
            setState(() {
              _isSubmitting = false;
            });
            ref.invalidate(reportRepositoryProvider);
            ref.invalidate(homeMapDataProvider);
            await showSuccessDialog(
              context: context,
              title: 'Report Submitted!',
              message:
                  'Thank you for your contribution. Your report has been successfully submitted.',
              buttonText: 'Back to Home',
              onButtonPressed: () =>
                  Navigator.of(context).popUntil((r) => r.isFirst),
            );
          }
        } else {
          // --- OFFLINE SUBMISSION ---
          await repo.queueOfflineReport(
            imagePaths: _selectedImages.map((xfile) => xfile.path).toList(),
            latitude: _selectedLocation!.latitude,
            longitude: _selectedLocation!.longitude,
            damageTypeId: _selectedDamageTypeId!,
            severityId: _selectedSeverityId!,
            description: _description,
            city: city,
            address: address,
          );
          if (mounted) {
            setState(() {
              _isSubmitting = false;
            });
            await showSuccessDialog(
              context: context,
              title: 'Report Saved Offline',
              message:
                  'Your report is saved and will be uploaded automatically when you are back online.',
              buttonText: 'OK',
              onButtonPressed: () =>
                  Navigator.of(context).popUntil((r) => r.isFirst),
            );
          }
        }
        // Invalidate providers to refresh data on home/history screens
      } catch (e) {
        if (mounted) {
          print(e);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Submission Failed: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors in the form.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final damageTypesAsync = ref.watch(damageTypesProvider);
    final severitiesAsync = ref.watch(severitiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Create New Report')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ImagePickerInput(
                key: _imagePickerKey,
                onImagesSelected: (images) {
                  setState(() {
                    _selectedImages = images;
                  });
                },
                initialImages: _selectedImages,
              ),
              const SizedBox(height: 20),
              _buildLocationPicker(),
              const SizedBox(height: 20),
              damageTypesAsync.when(
                data: (types) => _buildDamageTypeSelector(types),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => Text('Error loading damage types: $e'),
              ),
              const SizedBox(height: 20),
              severitiesAsync.when(
                data: (severities) => _buildSeveritySelector(severities),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => Text('Error loading severities: $e'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Description (Optional)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Provide any additional details...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onSaved: (value) => _description = value ?? '',
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitReport,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: _isSubmitting
                    ? SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Submit Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
