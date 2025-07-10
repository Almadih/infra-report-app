// lib/providers/connectivity_provider.dart
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

/// A Riverpod provider that tracks and exposes the app's online status.
///
/// It performs an initial check and then listens to a stream for real-time updates.
///
/// - `keepAlive: true`: Ensures the provider is not disposed when no longer listened to,
///   so the stream subscription stays active throughout the app's lifecycle.
///
/// Returns an `AsyncValue<bool>`:
/// - `AsyncData(true)`: The device is online.
/// - `AsyncData(false)`: The device is offline.
/// - `AsyncLoading()`: The initial connectivity check is in progress.
@Riverpod(keepAlive: true)
class AppConnectivity extends _$AppConnectivity {
  // We keep the subscription as a member variable to cancel it when the provider is disposed.
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  /// The `build` method is the core of the provider.
  /// It's responsible for creating the initial state.
  @override
  Future<bool> build() async {
    // Listen to the stream of connectivity changes.
    // When a change occurs, the `_handleConnectivityChange` method will be called
    // to update the provider's state.
    _subscription = Connectivity().onConnectivityChanged.listen(
      _handleConnectivityChange,
    );

    // Ensure the stream subscription is cancelled when the provider is disposed.
    // This prevents memory leaks.
    ref.onDispose(() {
      _subscription?.cancel();
    });

    // Perform an initial check of the connectivity status and return it.
    // Riverpod will automatically handle the Future and expose the state as
    // AsyncLoading, and then AsyncData or AsyncError.
    final initialResults = await Connectivity().checkConnectivity();
    return _isConnected(initialResults);
  }

  /// This method is called by the stream listener whenever a connectivity change is detected.
  void _handleConnectivityChange(List<ConnectivityResult> results) {
    // We update the state of the provider with the new connectivity status.
    // Riverpod automatically notifies any widgets listening to this provider.
    state = AsyncData(_isConnected(results));
  }

  /// A helper method to determine if the device is connected based on the
  /// results from the connectivity_plus package.
  bool _isConnected(List<ConnectivityResult> results) {
    // According to the connectivity_plus documentation, the `none` result is
    // returned exclusively. If the list contains `ConnectivityResult.none`,
    // the device is offline. Any other result (or combination of results)
    // means there is at least one active connection.
    return !results.contains(ConnectivityResult.none);
  }
}
