// lib/screens/history/widgets/status_badge.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatusBadge extends StatelessWidget {
  final String statusName;

  const StatusBadge({super.key, required this.statusName});

  Color _getColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange; // Pending
      case 'under_review':
        return Colors.grey; // Under Review
      case 'verified':
        return Colors.blue; // Verified
      case 'resolved':
        return Colors.green; // Resolved
      default:
        return Colors.grey; // Default
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getColor(statusName).withValues(alpha: .1),
        border: Border.all(color: _getColor(statusName), width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        toBeginningOfSentenceCase(statusName.replaceAll('_', ' ')),
        style: TextStyle(
          color: _getColor(statusName),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
