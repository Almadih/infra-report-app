// lib/services/notification_service.dart
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:infra_report/models/auth_state.dart';
import 'package:infra_report/providers/api_service_provider.dart';
import 'package:infra_report/providers/auth_provider.dart';
import 'package:infra_report/providers/navigator_key_provider.dart';
import 'package:infra_report/providers/notification_provider.dart';
import 'package:infra_report/screens/report_details/report_details_screen.dart';
import 'package:infra_report/services/api_service.dart';
import 'package:infra_report/services/secure_storage_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infra_report/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_service.g.dart';

class NotificationService {
  final SecureStorageService _storageService;
  final ApiService _apiService;
  final _container = ProviderContainer();
  WidgetRef? _ref;

  NotificationService(this._storageService, this._apiService);

  Future<void> initialize(WidgetRef ref) async {
    // FCM Integration
    log.info("initializing notification service");
    _ref = ref;
    setupFlutterNotifications();
    await Firebase.initializeApp();
    await setupFcm();
  }

  // --- FCM METHODS ---
  Future<void> setupFcm() async {
    final authState = await _ref?.read(authProvider.future);
    if (authState == null || authState is Unauthenticated) {
      return;
    }

    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken == null) {
      return;
    }
    log.info("FCM Token: $fcmToken");

    final token = await _storageService.read(SecureStorageService.tokenKey);

    final storeFcmToken = await _storageService.read(
      SecureStorageService.fcmTokenKey,
    );

    log.info("storeFcmToken $storeFcmToken");

    if (storeFcmToken == null || (fcmToken != storeFcmToken && token != null)) {
      await _apiService.saveFcmToken(fcmToken);
      await _storageService.write(SecureStorageService.fcmTokenKey, fcmToken);
    } else {
      log.info("fcm token already saved");
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((refreshedToken) {
      log.info("FCM token refreshed. Resetting sync status and re-syncing...");
      // When the token refreshes, we must reset the sync status and re-sync.
      _storageService.delete(SecureStorageService.fcmTokenKey).then((_) {
        setupFcm(); // Re-run the setup logic with the new token.
      });
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log.info("--- Got a message whilst in the foreground!");

      _ref?.invalidate(notificationsProvider);
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        // Display the FCM notification using our local notification service
      }
    });

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true, // Required to display a heads up notification
          badge: true,
          sound: true,
        );

    RemoteMessage? initialMessage = await FirebaseMessaging.instance
        .getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
  }

  Future<void> _handleNotificationTap(RemoteMessage message) async {
    log.info('FCM Notification tapped, forwarding payload: ${message.data}');
    final reportId = message.data['report_id'] as String?;
    if (reportId == null) {
      // No action for notifications without a reportId
      return;
    }

    // --- NAVIGATION LOGIC ---
    // This part is left "un functional" as requested, but the logic is here.
    // To make it functional, you need a method in your repository to fetch a single report.
    log.info("fcm Tapped notification for report ID: $reportId ");

    _ref?.invalidate(notificationsProvider);

    // --- PSEUDO-CODE FOR FUNCTIONAL IMPLEMENTATION ---
    final loading = DialogRoute(
      context: navigatorKey.currentContext!,
      builder: (_) => Center(child: CircularProgressIndicator()),
    );

    navigatorKey.currentState?.push(loading);
    try {
      final apiService = _container.read(apiServiceProvider);
      // You would need to implement getReportById in your repository
      final report = await apiService.fetchReportById(id: reportId);
      log.info("fcm fetched report $report");
      navigatorKey.currentState?.pop(loading);

      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => ReportDetailsScreen(report: report),
        ),
      );
    } catch (e) {
      navigatorKey.currentState?.pop(loading);

      log.warning("can't fetch report");
    }
  }

  void setupFlutterNotifications() {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'Used for important notifications.',
      importance: Importance.high,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }
}

// Riverpod provider for our service
@riverpod
NotificationService notificationService(ref) {
  final apiService = ref.watch(apiServiceProvider);
  final storageService = ref.watch(secureStorageServiceProvider);
  return NotificationService(storageService, apiService);
}
