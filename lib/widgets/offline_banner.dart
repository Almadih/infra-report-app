// lib/widgets/offline_banner.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/connectivity_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A banner that appears at the top of the screen when the device is offline.
///
/// It listens to the `appConnectivityProvider` and uses an `AnimatedContainer`
/// to smoothly slide in and out of view.
class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the connectivity provider to get the online/offline status.
    // We use `.value` to get the boolean value directly, defaulting to `true` (online)
    // if the provider is still loading, to avoid showing the banner on initial app start.
    final bool isOnline = ref.watch(appConnectivityProvider).value ?? true;
    final theme = Theme.of(context);

    // Calculate the height of the banner. It's 0 when online (hidden)
    // and a specific height when offline (visible).
    final double height = isOnline ? 0 : 24.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: height,
      width: double.infinity,
      color: theme
          .colorScheme
          .error, // Use the theme's error color for the background
      child: const Center(
        child: Text(
          'You are currently offline',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
