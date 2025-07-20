// lib/providers/notification_provider.dart
import 'package:infra_report/models/notification_model.dart';
import 'package:infra_report/repositories/notifications_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_provider.g.dart';

@riverpod
Stream<List<AppNotification>> notifications(ref) {
  final notificationsRepository = ref.watch(notificationsRepositoryProvider);
  notificationsRepository.fetchNotifications();
  return notificationsRepository.watchNotifications();
}

@riverpod
int unreadNotificationsCount(ref) {
  // Watch the main notifications provider
  final AsyncValue<List<AppNotification>> notificationsAsync = ref.watch(
    notificationsProvider,
  );

  // When the data is available, calculate the count of unread items.
  // Otherwise, return 0.

  return notificationsAsync.maybeWhen(
    data: (notifications) {
      // Filter the list to find items where readAt is null and get the length.
      return notifications.where((n) => n.readAt == null).length;
    },
    orElse: () => 0, // In loading or error state, the count is 0.
  );
}
