import 'package:infra_report/database/database.dart';
import 'package:infra_report/models/notification_model.dart';
import 'package:infra_report/providers/api_service_provider.dart';
import 'package:infra_report/providers/connectivity_provider.dart';
import 'package:infra_report/providers/database_provider.dart';
import 'package:infra_report/services/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_repository.g.dart';

@riverpod
NotificationsRepository notificationsRepository(ref) {
  return NotificationsRepository(
    ref.watch(apiServiceProvider),
    ref.watch(appDatabaseProvider),
    ref.watch(appConnectivityProvider).value ?? false,
  );
}

class NotificationsRepository {
  final ApiService _apiService;
  final AppDatabase _db;
  final bool _isOnline;

  NotificationsRepository(this._apiService, this._db, this._isOnline);

  Stream<List<AppNotification>> watchNotifications() {
    return _db.watchNotifications();
  }

  Future<void> fetchNotifications() async {
    if (_isOnline) {
      final apiNotifications = await _apiService.fetchNotifications();
      await _db.cacheApiNotifications(apiNotifications);
    } else {
      throw Exception("Cannot refresh while offline.");
    }
  }

  Future<void> cacheApiNotifications(
    List<AppNotification> apiNotifications,
  ) async {
    await _db.cacheApiNotifications(apiNotifications);
  }
}
