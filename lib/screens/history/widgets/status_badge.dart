// lib/screens/history/widgets/status_badge.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatusBadge extends StatelessWidget {
  final String statusName;

  const StatusBadge({super.key, required this.statusName});

  Color _getBadgeColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.yellow.shade300;
      case 'verified':
        return Colors.blue.shade300;
      case 'under_review': // Handle potential variations
        return Colors.red.shade300;
      case 'resolved':
        return Colors.green.shade500;
      default:
        return Colors.grey.shade400;
    }
  }

  Color _getTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
      case 'verified':
      case 'under_review':
      case 'resolved':
        return Colors.white; // Light text for darker badges
      default:
        return Colors.black87;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: _getBadgeColor(statusName),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        toBeginningOfSentenceCase(statusName.replaceAll("_", " ")),
        style: TextStyle(
          color: _getTextColor(statusName),
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
