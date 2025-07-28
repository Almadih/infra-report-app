// lib/main.dart
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infra_report/models/auth_state.dart';
import 'package:infra_report/providers/connectivity_provider.dart';
import 'package:infra_report/repositories/report_repository.dart';
import 'package:infra_report/providers/auth_provider.dart';
import 'package:infra_report/services/notification_service.dart';
import 'package:infra_report/utils/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infra_report/app.dart'; // Import provider
import 'package:infra_report/screens/onboarding/onboarding_screen.dart';
import 'package:infra_report/utils/logger.dart';
import 'package:logging/logging.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  log.info("--- Handling a background message: ${message.messageId}");
  log.info("--- Message data: ${message.data}");
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

  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  final theme = await getTheme();
  // Set the background messaging handler

  runApp(
    ProviderScope(
      child: AppInitializer(
        theme: theme,
      ), // Use a ConsumerWidget to decide initial route
    ),
  );
}

class AppInitializer extends ConsumerStatefulWidget {
  final dynamic theme;

  const AppInitializer({super.key, required this.theme});
  @override
  ConsumerState<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends ConsumerState<AppInitializer> {
  init() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    ref.read(notificationServiceProvider).initialize(ref);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme;
    final authState = ref.watch(authProvider);
    // ref.listen<AsyncValue<AuthState>>(authProvider, (previous, next) {
    //   if (next.hasValue) {
    //     final authState = next.value!;
    //     if (authState is Authenticated) {
    //       ref.read(notificationServiceProvider).setupFcm();
    //     }
    //   }
    // });

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
              return MyApp(theme: theme);
            case Unauthenticated _:
              return OnboardingScreen(theme: theme);
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
