// lib/screens/home/widgets/map_report_card.dart
import 'package:flutter/material.dart';
import 'package:infra_report/models/report_model.dart' as app_models;
import 'package:infra_report/screens/history/widgets/status_badge.dart';
import 'package:infra_report/screens/report_details/report_details_screen.dart';
import 'package:infra_report/widgets/authenticated_image.dart';
import 'package:intl/intl.dart';

class MapReportCard extends StatelessWidget {
  final app_models.Report report;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final bool hasNext;
  final bool hasPrevious;

  const MapReportCard({
    super.key,
    required this.report,
    required this.onNext,
    required this.onPrevious,
    required this.hasNext,
    required this.hasPrevious,
  });

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MMM d, yyyy').format(dateTime.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final int? firstImageId = report.images.isNotEmpty
        ? report.images.first.id
        : null;

    return Card(
      margin: const EdgeInsets.all(12.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 8,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Take up minimum vertical space
        children: [
          // Image and navigation row
          SizedBox(
            height: 150,
            child: Row(
              children: [
                // Image part
                Expanded(
                  flex: 3,
                  child: firstImageId != null
                      ? AuthenticatedImage(
                          imageId: firstImageId,
                          fit: BoxFit.cover,
                          height: 150,
                        )
                      : Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              color: Colors.grey[400],
                              size: 50,
                            ),
                          ),
                        ),
                ),
                // Details and actions part
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          report.damageType.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          report.address.split('\n').first,
                          style: theme.textTheme.bodySmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Reported on ${_formatDateTime(report.createdAt)}',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ReportDetailsScreen(report: report),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.onPrimary,
                            ),
                            child: const Text('View Details'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom navigation bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: hasPrevious ? onPrevious : null,
                icon: const Icon(Icons.arrow_back_ios_new),
                tooltip: 'Previous Report',
              ),
              Flexible(child: StatusBadge(statusName: report.status.name)),
              IconButton(
                onPressed: hasNext ? onNext : null,
                icon: const Icon(Icons.arrow_forward_ios),
                tooltip: 'Next Report',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
