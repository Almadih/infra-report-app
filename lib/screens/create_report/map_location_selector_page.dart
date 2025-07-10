// lib/screens/create_report/map_location_selector_page.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapLocationSelectorPage extends StatefulWidget {
  final LatLng? initialPosition;

  const MapLocationSelectorPage({super.key, this.initialPosition});

  @override
  State<MapLocationSelectorPage> createState() =>
      _MapLocationSelectorPageState();
}

class _MapLocationSelectorPageState extends State<MapLocationSelectorPage> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;
  Marker? _selectedMarker;

  static const CameraPosition _kDefaultLocation = CameraPosition(
    target: LatLng(30.0444, 31.2357), // Cairo
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    if (widget.initialPosition != null) {
      _selectedLocation = widget.initialPosition;
      _updateMarker(widget.initialPosition!);
    } else {
      _getCurrentLocationAndSetInitial();
    }
  }

  Future<void> _getCurrentLocationAndSetInitial() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final currentLatLng = LatLng(position.latitude, position.longitude);
      if (mounted) {
        setState(() {
          _selectedLocation = currentLatLng;
          _updateMarker(currentLatLng);
        });
        _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(currentLatLng, 15),
        );
      }
    } catch (e) {
      // Handle error or use default
      if (mounted) {
        setState(() {
          _selectedLocation = _kDefaultLocation.target;
          _updateMarker(_kDefaultLocation.target);
        });
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    if (_selectedLocation != null) {
      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_selectedLocation!, 15),
      );
    }
  }

  void _onTapMap(LatLng location) {
    setState(() {
      _selectedLocation = location;
      _updateMarker(location);
    });
  }

  void _updateMarker(LatLng location) {
    _selectedMarker = Marker(
      markerId: const MarkerId('selectedLocation'),
      position: location,
      infoWindow: const InfoWindow(title: 'Selected Location'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
        actions: [
          if (_selectedLocation != null)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                Navigator.pop(context, _selectedLocation);
              },
            ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: widget.initialPosition != null
                ? CameraPosition(target: widget.initialPosition!, zoom: 15)
                : _kDefaultLocation,
            onTap: _onTapMap,
            markers: _selectedMarker != null ? {_selectedMarker!} : {},
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          if (_selectedLocation == null && widget.initialPosition == null)
            const Center(
              child: CircularProgressIndicator(),
            ), // Show loading while fetching current location
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                ),
                label: const Text(
                  'Confirm Location',
                  style: TextStyle(color: Colors.white),
                ),

                onPressed: _selectedLocation == null
                    ? null
                    : () {
                        Navigator.pop(context, _selectedLocation);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
