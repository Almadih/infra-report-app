// lib/providers/map_controller_provider.dart
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_controller_provider.g.dart';

@Riverpod(
  keepAlive: true,
) // Keep alive as long as the map is potentially visible
class MapScreenController extends _$MapScreenController {
  GoogleMapController? _controller;

  @override
  GoogleMapController? build() {
    // The initial state is null until the map is created
    return _controller;
  }

  void setController(GoogleMapController controller) {
    if (_controller == null) {
      // Set only once
      _controller = controller;
      // Don't call notifyListeners or setState here directly for this type of provider.
      // The state is the controller itself. We update the internal _controller
      // and the next time 'ref.watch(mapScreenControllerProvider)' is called,
      // it will get the updated controller.
      // Forcing a rebuild of listeners can be done by reassigning state:
      state = _controller;
    }
  }

  // Optional: Method to animate camera or other controller actions
  void animateCamera(CameraUpdate cameraUpdate) {
    _controller?.animateCamera(cameraUpdate);
  }
}
