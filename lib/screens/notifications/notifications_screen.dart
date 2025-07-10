// lib/screens/notifications/notifications_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/notification_model.dart';
import 'package:flutter_application_1/providers/api_service_provider.dart';
import 'package:flutter_application_1/providers/notification_provider.dart';
import 'package:flutter_application_1/providers/report_provider.dart';
import 'package:flutter_application_1/repositories/report_repository.dart';
import 'package:flutter_application_1/screens/report_details/report_details_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  bool _isMarkingAsRead = false;

  Future<void> _markAllAsRead() async {
    setState(() {
      _isMarkingAsRead = true;
    });

    try {
      // Get the ApiService instance from its provider
      final apiService = ref.read(apiServiceProvider);
      // Call the API method
      await apiService.markAllNotificationsAsRead();

      // After the API call succeeds, invalidate the notifications provider
      // to refetch the data from the server. This will update the UI
      // and the unread count badge automatically.
      ref.invalidate(notificationsProvider);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isMarkingAsRead = false;
        });
      }
    }
  }

  // Helper to format time (e.g., "5m ago", "2h ago", "1d ago")
  String _timeAgo(DateTime dateTime) {
    final duration = DateTime.now().difference(dateTime);
    if (duration.inDays > 0) {
      return '${duration.inDays}d ago';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ago';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  Future<void> _handleNotificationTap(
    BuildContext context,
    WidgetRef ref,
    AppNotification notification,
  ) async {
    print(notification);
    if (notification.reportId == null) {
      // No action for notifications without a reportId
      return;
    }

    // --- NAVIGATION LOGIC ---
    // This part is left "unfunctional" as requested, but the logic is here.
    // To make it functional, you need a method in your repository to fetch a single report.
    print("Tapped notification for report ID: ${notification.reportId}");

    // --- PSEUDO-CODE FOR FUNCTIONAL IMPLEMENTATION ---

    final loading = DialogRoute(
      context: context,
      builder: (_) => Center(child: CircularProgressIndicator()),
    );

    Navigator.of(context).push(loading);

    try {
      final repo = ref.read(reportRepositoryProvider);
      // You would need to implement getReportById in your repository
      final report = await repo.getReportById(id: notification.reportId!);
      Navigator.of(context).pop(loading); // Dismiss loading dialog
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReportDetailsScreen(report: report),
        ),
      );
    } catch (e) {
      Navigator.of(context).pop(); // Dismiss loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not find report details.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final notificationsAsync = ref.watch(notificationsProvider);
    final theme = Theme.of(context);
    final unreadCount = ref.watch(unreadNotificationsCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          // Only show the button if there are unread notifications and it's not currently loading
          if (unreadCount > 0)
            _isMarkingAsRead
                ? const Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : TextButton.icon(
                    onPressed: _markAllAsRead,
                    icon: const Icon(Icons.drafts_outlined),
                    label: const Text('Mark All Read'),
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.onSurface,
                    ),
                  ),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () => ref.refresh(notificationsProvider.future),
        child: notificationsAsync.when(
          data: (notifications) {
            if (notifications.isEmpty) {
              return const Center(child: Text('You have no notifications.'));
            }
            return ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final isRead = notification.readAt != null;

                return ListTile(
                  onTap: () =>
                      _handleNotificationTap(context, ref, notification),
                  leading: CircleAvatar(
                    backgroundColor: isRead
                        ? Colors.grey.shade300
                        : theme.colorScheme.primaryContainer,
                    child: Icon(
                      notification.type ==
                              'App\\Notifications\\ReportStatusNotification'
                          ? Icons.notifications_none
                          : Icons.campaign_outlined,
                      color: isRead
                          ? Colors.grey.shade600
                          : theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  title: Text(
                    notification.title,
                    style: TextStyle(
                      fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(notification.body),
                  trailing: Text(
                    _timeAgo(notification.createdAt),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Failed to load notifications: $error'),
            ),
          ),
        ),
      ),
    );
  }
}
