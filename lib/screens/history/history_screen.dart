// lib/screens/history/history_screen.dart
import 'package:flutter/material.dart';
import 'package:infra_report/providers/my_reports_provider.dart';
import 'package:infra_report/repositories/report_repository.dart';
import 'package:infra_report/screens/history/widgets/report_card_skeleton.dart';
import 'package:infra_report/widgets/authenticated_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infra_report/models/report_model.dart' as app_report;
import 'package:infra_report/screens/report_details/report_details_screen.dart';
import 'package:infra_report/screens/history/widgets/severity_badge.dart';
import 'package:infra_report/screens/history/widgets/status_badge.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  // String _formatDateTime(DateTime dateTime) { // No longer needed here, moved to card
  //   return DateFormat('MMM d, yyyy - hh:mm a').format(dateTime.toLocal());
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsAsyncValue = ref.watch(myReportsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Report History'),
        actions: [
          FutureBuilder<int>(
            future: ref.read(reportRepositoryProvider).getPendingReportsCount(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(); // Show nothing while loading
              }
              if (snapshot.hasError) {
                return Container(); // Handle error case if needed
              }
              final count = snapshot.data ?? 0;
              return count == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Center(
                        child: Text(
                          '$count pending report(s)',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        // Key feature: onRefresh callback
        onRefresh: () async {
          ref.invalidate(myReportsProvider);
        },
        child: reportsAsyncValue.when(
          data: (reports) {
            if (reports.isEmpty) {
              // Wrap with ListView to make pull-to-refresh work even on empty screen
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
                          'No reports found in your history.\nPull down to refresh.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return ListView.builder(
              physics:
                  const AlwaysScrollableScrollPhysics(), // Good practice for RefreshIndicator
              padding: const EdgeInsets.all(8.0),
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                return ReportHistoryCard(report: report);
              },
            );
          },
          loading: () => ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // Disable scroll during shimmer
            padding: const EdgeInsets.all(8.0),
            itemCount: 5, // Display a few skeletons, adjust as needed
            itemBuilder: (context, index) {
              return const ReportHistoryCardSkeleton();
            },
          ),
          error: (error, stack) {
            // Wrap with ListView for pull-to-refresh on error screen
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 50,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Failed to load history: $error',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton.icon(
                              onPressed: () =>
                                  ref.invalidate(myReportsProvider),
                              icon: const Icon(Icons.refresh),
                              label: const Text('Try Again'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// ReportHistoryCard class remains the same
class ReportHistoryCard extends StatelessWidget {
  final app_report.Report report;

  const ReportHistoryCard({super.key, required this.report});

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MMM d, yyyy • hh:mm a').format(dateTime.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final app_report.ReportImage? firstImage = report.images.isNotEmpty
        ? report.images.first
        : null;
    final theme = Theme.of(context);

    return Card(
      elevation: 1.5,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReportDetailsScreen(report: report),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (firstImage != null)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: AuthenticatedImage(imageId: firstImage.id),
              )
            else
              Container(
                height: 150,
                color: Colors.grey[200],
                child: Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: Colors.grey[400],
                    size: 50,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    report.damageType.name,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: theme.colorScheme.secondary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          report.address.split('\n').first,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[700],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 16,
                        color: theme.colorScheme.secondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _formatDateTime(report.createdAt),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: [
                      SeverityBadge(severityName: report.severity.name),
                      StatusBadge(statusName: report.status.name),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
