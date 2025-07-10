// lib/models/sync_status.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_status.freezed.dart';

enum SyncState { idle, syncing, success, error }

@freezed
sealed class SyncStatus with _$SyncStatus {
  const factory SyncStatus({
    @Default(SyncState.idle) SyncState state,
    @Default(0) int totalToSync,
    @Default(0) int syncedCount,
  }) = _SyncStatus;
}
