// lib/widgets/sync_banner.dart
import 'package:flutter/material.dart';
import 'package:infra_report/providers/sync_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infra_report/models/sync_status.dart';

class SyncBanner extends ConsumerWidget {
  const SyncBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncStatus = ref.watch(syncProvider);
    final theme = Theme.of(context);

    Widget bannerContent;
    Color bannerColor;
    bool isVisible = true;

    switch (syncStatus.state) {
      case SyncState.syncing:
        bannerColor = Colors.blue.shade700;
        bannerContent = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Syncing ${syncStatus.syncedCount + 1} of ${syncStatus.totalToSync} reports...',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        );
        break;
      case SyncState.success:
        bannerColor = Colors.green.shade600;
        bannerContent = const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, color: Colors.white, size: 16),
            SizedBox(width: 8),
            Text(
              'Sync complete!',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        );
        break;
      case SyncState.error:
        bannerColor = theme.colorScheme.error;
        bannerContent = const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.white, size: 16),
            SizedBox(width: 8),
            Text(
              'Sync failed. Will retry later.',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        );
        break;
      case SyncState.idle:
      default:
        isVisible = false;
        bannerColor = Colors.transparent;
        bannerContent = const SizedBox.shrink();
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isVisible ? 24 : 0,
      color: bannerColor,
      child: Center(child: bannerContent),
    );
  }
}
