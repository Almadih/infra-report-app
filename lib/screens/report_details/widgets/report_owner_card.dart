// lib/screens/report_details/widgets/report_owner_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/report_model.dart';
import 'package:intl/intl.dart';

class ReportOwnerCard extends StatelessWidget {
  final ReportUser owner;

  const ReportOwnerCard({super.key, required this.owner});

  // Helper to determine reputation color
  Color _getReputationColor(int reputation) {
    if (reputation < 100) return Colors.grey.shade600;
    if (reputation < 500) return Colors.blue.shade600;
    if (reputation < 2000) return Colors.green.shade600;
    return Colors.amber.shade700;
  }

  // Helper to get a reputation title
  String _getReputationTitle(int reputation) {
    if (reputation < 100) return 'Newcomer';
    if (reputation < 500) return 'Contributor';
    if (reputation < 2000) return 'Trusted Contributor';
    return 'Veteran Reporter';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final reputationColor = _getReputationColor(owner.reputation);
    final numberFormatter = NumberFormat.compact();

    return Card(
      color: theme.colorScheme.surface,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          children: [
            // Avatar

            // In a real app, you would use AuthenticatedImage for owner.avatarUrl
            Icon(Icons.person, size: 20, color: theme.colorScheme.primary),

            const SizedBox(width: 12),
            // Name and Reputation Title
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    owner.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _getReputationTitle(owner.reputation),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: reputationColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Reputation Score
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  numberFormatter.format(owner.reputation), // e.g., "1.2K"
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: reputationColor,
                  ),
                ),
                Text('Reputation', style: theme.textTheme.labelSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
