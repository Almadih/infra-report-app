// lib/screens/report_details/widgets/report_flag_card.dart
import 'package:flutter/material.dart';
import 'package:infra_report/models/report_model.dart';
import 'package:infra_report/repositories/report_repository.dart';
import 'package:infra_report/screens/report_details/report_details_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ReportFlagCard extends ConsumerWidget {
  final ReportFlag flag;

  const ReportFlagCard({super.key, required this.flag});

  // Helper to get an appropriate icon and color for the flag type

  String _getFormattedFlagType() {
    return flag.type
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: theme.colorScheme.error,
                ),
                const SizedBox(width: 8),
                Text(
                  _getFormattedFlagType(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  DateFormat('MMM d, yyyy').format(flag.createdAt.toLocal()),
                  style: theme.textTheme.labelSmall?.copyWith(),
                ),
              ],
            ),
            if (flag.reason.isNotEmpty) ...[
              const SizedBox(height: 8),
              const SizedBox(height: 4),
              Text(flag.reason, style: theme.textTheme.bodyMedium),
            ],

            if (flag.type == 'duplicate' && flag.duplicatedReportId != null)
              Column(
                children: [
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: () async {
                      final loading = DialogRoute(
                        context: context,
                        builder: (_) =>
                            Center(child: CircularProgressIndicator()),
                      );

                      Navigator.of(context).push(loading);
                      final repo = ref.read(reportRepositoryProvider);
                      try {
                        final report = await repo.getReportById(
                          id: flag.duplicatedReportId!,
                        );

                        Navigator.of(
                          context,
                        ).pop(loading); // Dismiss loading dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ReportDetailsScreen(report: report),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Could not find report details.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text('View Duplicate'),
                  ),
                ],
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
