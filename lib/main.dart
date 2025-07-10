// lib/main.dart
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/auth_state.dart';
import 'package:flutter_application_1/providers/connectivity_provider.dart';
import 'package:flutter_application_1/repositories/report_repository.dart';
import 'package:flutter_application_1/providers/auth_provider.dart';
import 'package:flutter_application_1/services/notification_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/app.dart'; // Import provider
import 'package:flutter_application_1/screens/onboarding/onboarding_screen.dart'; // Import onboarding screen

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("--- Handling a background message: ${message.messageId}");
  print("--- Message data: ${message.data}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  // Set the background messaging handler

  runApp(
    ProviderScope(
      child: AppInitializer(), // Use a ConsumerWidget to decide initial route
    ),
  );
}

class AppInitializer extends ConsumerStatefulWidget {
  const AppInitializer({super.key});
  @override
  ConsumerState<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends ConsumerState<AppInitializer> {
  init() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // Use the 'ref' from the ConsumerState to read providers.
    ref.read(notificationServiceProvider).initialize(ref);
    // Listen for connectivity changes to process the offline queue.
    // ref.listen<AsyncValue<bool>>(appConnectivityProvider, (previous, next) {
    //   final isOnline = next.value ?? false;
    //   final wasOnline = previous?.value ?? false;

    //   // Trigger queue processing when transitioning from offline to online.
    //   if (isOnline && !wasOnline) {
    //     ref.read(reportRepositoryProvider).processPendingQueue();
    //   }
    // });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    ref.listen<AsyncValue<bool>>(appConnectivityProvider, (previous, next) {
      final isOnline = next.value ?? false;
      final wasOnline = previous?.value ?? false;

      // Trigger queue processing when transitioning from offline to online.
      if (isOnline && !wasOnline) {
        ref.read(reportRepositoryProvider).processPendingQueue(ref);
      }
    });

    // This MaterialApp will be the root for either Onboarding or MyApp
    return MaterialApp(
      title: 'Report Map App',
      debugShowCheckedModeBanner: false, // Optional: remove debug banner
      home: authState.when(
        loading: () => const SplashScreen(),
        error: (err, stack) => ErrorScreen(error: err.toString(), stack: stack),
        data: (AuthState state) {
          // Check the type of the state
          switch (state) {
            case Authenticated _:
              return MyApp();
            case Unauthenticated _:
              return OnboardingScreen();
          }
          return null;
        },
      ),
    );
  }
}

// Helper widget for a simple Splash Screen
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

// Helper widget for a simple Error Screen
class ErrorScreen extends StatelessWidget {
  final String error;
  final StackTrace stack;
  const ErrorScreen({super.key, required this.error, required this.stack});
  @override
  Widget build(BuildContext context) {
    print(stack);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'An error occurred: $error\nPlease restart the app.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
