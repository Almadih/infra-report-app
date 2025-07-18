// lib/app.dart
import 'package:flutter/material.dart';
import 'package:infra_report/providers/navigator_key_provider.dart';
import 'package:infra_report/providers/notification_provider.dart';
import 'package:infra_report/screens/notifications/notifications_screen.dart';
import 'package:infra_report/widgets/offline_banner.dart';
import 'package:infra_report/widgets/sync_banner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infra_report/providers/navigation_provider.dart';
import 'package:infra_report/screens/home/home_screen.dart';
import 'package:infra_report/screens/history/history_screen.dart';
import 'package:infra_report/screens/profile/profile_screen.dart';

class MyApp extends ConsumerWidget {
  final ThemeData theme;
  const MyApp({super.key, required this.theme});

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HistoryScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);
    final unreadCount = ref.watch(unreadNotificationsCountProvider);

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Report Map App',
      theme: theme,
      home: Scaffold(
        // The body will now be one of the _widgetOptions directly.
        // extendBody: true allows the body (e.g., HomeScreen's map)
        // to draw behind the BottomNavigationBar if it's transparent/translucent.
        extendBody: false,
        body: Column(
          children: [
            SyncBanner(),
            Expanded(child: _widgetOptions.elementAt(selectedIndex)),
            OfflineBanner(),
          ],
        ), // Removed Center widget
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // For a more integrated look with edgeToEdge, you might want to
          // make the BottomNavigationBar's background transparent or nearly so.
          // This depends on your design preference.
          // backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.9), // Example M3 style
          // elevation: 0, // Remove shadow if background is transparent
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              // The icon for the notification tab
              icon: Badge(
                // The label is the text inside the badge
                label: Text(unreadCount.toString()),
                // Hide the badge if the count is 0
                isLabelVisible: unreadCount > 0,
                // The child of the badge is our original icon
                child: const Icon(Icons.notifications_outlined),
              ),
              // The active icon should also have a badge
              activeIcon: Badge(
                label: Text(unreadCount.toString()),
                isLabelVisible: unreadCount > 0,
                child: const Icon(Icons.notifications),
              ),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            ref.read(bottomNavIndexProvider.notifier).setIndex(index);
          },
        ),
      ),
    );
  }
}
