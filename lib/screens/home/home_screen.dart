// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for AnnotatedRegion
import 'package:infra_report/config/google_map_style.dart';
import 'package:infra_report/providers/home_map_data_provider.dart';
import 'package:infra_report/providers/location_provider.dart';
import 'package:infra_report/repositories/report_repository.dart';
import 'package:infra_report/screens/create_report/create_report_screen.dart';
import 'package:infra_report/screens/home/widgets/map_report_card.dart';
import 'package:infra_report/utils/exceptions.dart';
import 'package:infra_report/utils/location_dialog_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:infra_report/models/report_model.dart' as app_models;
import 'package:infra_report/utils/logger.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _isCentering = false;
  app_models.Report? _selectedReport;
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _centerOnUserAndRefresh() async {
    setState(() {
      _isCentering = true;
    });

    try {
      // Invalidate to force a fresh location read.
      ref.invalidate(userLocationProvider);
      // Explicitly trigger a refresh of reports for the new location.
      ref.invalidate(reportRepositoryProvider);
    } finally {
      if (mounted) {
        setState(() {
          _isCentering = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(homeMapDataProvider, (previous, next) {
      // Check if the new state is an error state
      if (next is AsyncError) {
        final error = next.error;
        // Check if the error is one of our custom location exceptions
        if (error is LocationException) {
          // Use a post-frame callback to ensure the dialog is shown after the build is complete.
          WidgetsBinding.instance.addPostFrameCallback((_) {
            LocationDialogHelper.showLocationErrorDialog(context, error);
          });
        }
      }
    });

    final homeMapAsyncValue = ref.watch(homeMapDataProvider);
    // Decide status bar icon brightness.
    // If your map style is predominantly light, use dark icons.
    // If your map style can be dark, you might want Brightness.light for icons.
    const statusBarIconBrightnessForMap = Brightness.light;
    // For iOS, statusBarBrightness is the conceptual "theme" of the status bar.
    // Brightness.light means the status bar background is light (so icons should be dark).
    // Brightness.dark means the status bar background is dark (so icons should be light).
    const statusBarBrightnessForMap =
        statusBarIconBrightnessForMap == Brightness.dark
        ? Brightness.light
        : Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // statusBarColor is transparent globally, no need to set here
        statusBarIconBrightness: statusBarIconBrightnessForMap,
        statusBarBrightness: statusBarBrightnessForMap, // For iOS
      ),
      child: Scaffold(
        // No AppBar, so the body will extend to the top of the screen.
        // The GoogleMap widget itself should handle its content positioning
        // relative to the (now translucent) status bar area.
        floatingActionButton: _selectedReport != null
            ? null
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton.small(
                    onPressed: _isCentering ? null : _centerOnUserAndRefresh,
                    heroTag: 'recenter_fab',
                    tooltip: 'Center on my location',
                    child: _isCentering
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.refresh),
                  ),
                  const SizedBox(height: 16),
                  FloatingActionButton.small(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateReportScreen(),
                        ),
                      );
                    },
                    heroTag: 'create_report_fab',
                    tooltip: 'Create Report',
                    child: const Icon(Icons.add_location_alt_outlined),
                  ),
                ],
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        body: homeMapAsyncValue.when(
          data: (homeMapData) {
            final reports = homeMapData.reports;
            final userLocation = homeMapData.userPosition;
            final int selectedIndex = _selectedReport == null
                ? -1
                : homeMapData.reports.indexWhere(
                    (r) => r.id == _selectedReport!.id,
                  );
            final markers = reports.map((report) {
              final isSelected = report.id == _selectedReport?.id;
              return Marker(
                markerId: MarkerId(report.id),
                position: LatLng(
                  report.location.coordinates[1],
                  report.location.coordinates[0],
                ),
                infoWindow: InfoWindow(title: report.damageType.name),
                // Change icon color and size when selected
                icon: isSelected
                    ? BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueAzure,
                      )
                    : _getMarkerIcon(report.severity.name),
                zIndexInt: isSelected
                    ? 1
                    : 0, // Bring selected marker to the front
                onTap: () {
                  setState(() {
                    _selectedReport = report;
                  });
                  // Animate camera to the selected marker
                  _mapController?.animateCamera(
                    CameraUpdate.newLatLng(
                      LatLng(
                        report.location.coordinates[1],
                        report.location.coordinates[0],
                      ),
                    ),
                  );
                },
              );
            }).toSet();

            LatLng? centerPosition;
            final center = homeMapData.center;
            if (center != null) {
              centerPosition = LatLng(
                center.coordinates[1],
                center.coordinates[0],
              );
            }
            final initialCameraPosition = CameraPosition(
              target:
                  centerPosition ??
                  LatLng(userLocation.latitude, userLocation.longitude),
              zoom: 10,
            );

            return Stack(
              children: [
                GoogleMap(
                  style: mapDarkStyle,
                  initialCameraPosition: initialCameraPosition,
                  markers: markers,
                  onTap: (LatLng location) {
                    setState(() {
                      _selectedReport = null;
                    });
                  },
                  // myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  mapToolbarEnabled: true,

                  padding: EdgeInsets.only(top: 40.0),
                  // The map controls (like zoom buttons, Google logo) will
                  // typically be inset by default to avoid the status bar.
                  // The map tiles themselves should render edge-to-edge.
                  // You can adjust 'padding' if map controls overlap critical UI.
                  // For example, to ensure map controls are not under the status bar:
                  // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  // However, often this is handled well by default with edgeToEdge.
                  onMapCreated: (GoogleMapController controller) {
                    // You can store the controller if needed
                    _mapController = controller;
                  },
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  bottom: _selectedReport != null
                      ? 0
                      : -250, // Move it off-screen when hidden
                  left: 0,
                  right: 0,
                  child: _selectedReport != null
                      ? MapReportCard(
                          report:
                              _selectedReport!, // Provide a dummy report when hidden
                          hasNext:
                              selectedIndex != -1 &&
                              selectedIndex < reports.length - 1,
                          hasPrevious: selectedIndex > 0,
                          onNext: () {
                            if (selectedIndex < reports.length - 1) {
                              final nextReport = reports[selectedIndex + 1];
                              setState(() {
                                _selectedReport = nextReport;
                              });
                              _mapController?.animateCamera(
                                CameraUpdate.newLatLng(
                                  LatLng(
                                    nextReport.location.coordinates[1],
                                    nextReport.location.coordinates[0],
                                  ),
                                ),
                              );
                            }
                          },
                          onPrevious: () {
                            if (selectedIndex > 0) {
                              final prevReport = reports[selectedIndex - 1];
                              setState(() {
                                _selectedReport = prevReport;
                              });
                              _mapController?.animateCamera(
                                CameraUpdate.newLatLng(
                                  LatLng(
                                    prevReport.location.coordinates[1],
                                    prevReport.location.coordinates[0],
                                  ),
                                ),
                              );
                            }
                          },
                        )
                      : const SizedBox(),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) {
            log.severe(error);
            // The UI in case of error can now be simpler, as the dialog handles the details.
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_off,
                      color: Colors.grey.shade600,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Could not load map data.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Please resolve the location issue prompted and try again.',
                      style: TextStyle(color: Colors.grey.shade700),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        _centerOnUserAndRefresh();
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  BitmapDescriptor _getMarkerIcon(String severityName) {
    switch (severityName.toLowerCase()) {
      case 'critical':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
      case 'high':
        return BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        );
      case 'moderate':
        return BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueYellow,
        );
      case 'low':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
      default:
        return BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        );
    }
  }
}
