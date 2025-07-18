// lib/providers/sync_provider.dart
import 'dart:async';
import 'package:infra_report/models/sync_status.dart';
import 'package:infra_report/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_provider.g.dart';

@Riverpod(keepAlive: true)
class Sync extends _$Sync {
  StreamSubscription? _subscription;

  @override
  SyncStatus build() {
    final db = ref.watch(appDatabaseProvider);

    // Listen to changes in the pending reports table
    _subscription = db.select(db.pendingReports).watch().listen((pending) {
      final currentlySyncing = state.state == SyncState.syncing;
      // If a sync isn't active, just update the total count
      if (!currentlySyncing) {
        state = state.copyWith(totalToSync: pending.length);
      }
    });

    ref.onDispose(() => _subscription?.cancel());

    // Return the initial idle state
    return const SyncStatus();
  }

  void startSync(int total) {
    state = SyncStatus(
      state: SyncState.syncing,
      totalToSync: total,
      syncedCount: 0,
    );
  }

  void reportSuccess() {
    final currentTotal = state.totalToSync;
    final newSyncedCount = state.syncedCount + 1;

    if (newSyncedCount >= currentTotal) {
      // All items are synced
      finishSync();
    } else {
      // More items to sync
      state = state.copyWith(syncedCount: newSyncedCount);
    }
  }

  void reportError() {
    // We could add more specific error handling, but for now, just end the sync
    state = state.copyWith(state: SyncState.error);
    // After a short delay, return to idle
    Future.delayed(const Duration(seconds: 4), () {
      if (state.state == SyncState.error) {
        state = state.copyWith(state: SyncState.idle);
      }
    });
  }

  void finishSync() {
    state = state.copyWith(
      state: SyncState.success,
      syncedCount: state.totalToSync,
    );
    // After a short delay, return to idle
    Future.delayed(const Duration(seconds: 3), () {
      if (state.state == SyncState.success) {
        state = const SyncStatus(
          state: SyncState.idle,
          totalToSync: 0,
          syncedCount: 0,
        );
      }
    });
  }
}
