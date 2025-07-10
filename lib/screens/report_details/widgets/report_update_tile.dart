// lib/screens/report_details/widgets/report_update_tile.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/report_model.dart';
import 'package:intl/intl.dart';

class ReportUpdateTile extends StatelessWidget {
  final ReportUpdate update;
  final bool isFirst;
  final bool isLast;

  const ReportUpdateTile({
    super.key,
    required this.update,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- The Timeline Column (Line and Circle) ---
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top part of the line (invisible for the first item)
              Container(
                width: 2,
                height: 12,
                color: isFirst ? Colors.transparent : Colors.grey.shade300,
              ),
              // The circle
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.colorScheme.primary,
                ),
              ),
              // Bottom part of the line (extends to fill space)
              Expanded(
                child: Container(
                  width: 2,
                  color: isLast ? Colors.transparent : Colors.grey.shade300,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // --- The Content Column ---
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat(
                      'MMM d, yyyy  -  hh:mm a',
                    ).format(update.createdAt.toLocal()),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(update.text, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
