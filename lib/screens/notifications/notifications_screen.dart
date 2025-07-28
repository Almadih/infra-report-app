// lib/screens/notifications/notifications_screen.dart
import 'package:flutter/material.dart';
import 'package:infra_report/models/notification_model.dart';
import 'package:infra_report/providers/api_service_provider.dart';
import 'package:infra_report/providers/notification_provider.dart';
import 'package:infra_report/repositories/report_repository.dart';
import 'package:infra_report/screens/report_details/report_details_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infra_report/services/api_service.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

Widget _getNotificationIcon(AppNotification notification, ThemeData theme) {
  final isRead = notification.readAt != null;
  final color = isRead ? Colors.grey.shade600 : theme.colorScheme.onPrimary;
  switch (notification.type) {
    case 'App\\Notifications\\ReportStatusNotification':
      return Icon(Icons.notifications_none, color: color);
    case 'App\\Notifications\\ReportFlagNotification':
      return Icon(Icons.flag, color: color);
    case 'App\\Notifications\\ReportUpdatesNotification':
      return Icon(Icons.campaign_outlined, color: color);
    default:
      return Icon(Icons.notifications_none, color: color);
  }
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  bool _isMarkingAsRead = false;

  Future<void> _markAllAsRead() async {
    setState(() {
      _isMarkingAsRead = true;
    });

    try {
      final apiService = ref.read(apiServiceProvider);
      await apiService.markAllNotificationsAsRead();
      ref.invalidate(notificationsProvider);
    } on ApiError catch (e) {
      if (mounted) {
        String message = e.message;
        if (e.type == ApiErrorType.offline) {
          message = "You are offline. Cannot mark notifications as read.";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      }
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
    if (notification.reportId == null) {
      return;
    }
    final loading = DialogRoute(
      context: context,
      builder: (_) => Center(child: CircularProgressIndicator()),
    );
    Navigator.of(context).push(loading);
    try {
      final repo = ref.read(reportRepositoryProvider);
      final report = await repo.getReportById(id: notification.reportId!);
      Navigator.of(context).pop(loading);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReportDetailsScreen(report: report),
        ),
      );
      await ref
          .read(apiServiceProvider)
          .markNotificationAsRead(notification.id);
      await _refreshNotifications();
    } on ApiError catch (e) {
      Navigator.of(context).pop();
      String message = e.message;
      if (e.type == ApiErrorType.offline) {
        message = "You are offline. Cannot load report details.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not find report details.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _refreshNotifications() async {
    ref.invalidate(notificationsProvider);
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
        onRefresh: _refreshNotifications,
        child: notificationsAsync.when(
          data: (notifications) {
            if (notifications.isEmpty) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics:
                        const AlwaysScrollableScrollPhysics(), // Ensures it's scrollable
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: const Center(
                        child: Text(
                          'No notifications.\nPull down to refresh.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                },
              );
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
                        : theme.colorScheme.primary,
                    child: _getNotificationIcon(notification, theme),
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
          error: (error, stack) {
            String message = "Failed to load notifications.";
            if (error is ApiError) {
              switch (error.type) {
                case ApiErrorType.offline:
                  message =
                      "You are offline. Please connect to the internet to see new notifications.";
                  break;
                case ApiErrorType.network:
                  message = "Network error. Please try again.";
                  break;
                case ApiErrorType.server:
                  message = "Server error. Please try again later.";
                  break;
                default:
                  message = error.message;
              }
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(message, textAlign: TextAlign.center),
              ),
            );
          },
        ),
      ),
    );
  }
}
