// lib/screens/history/widgets/severity_badge.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SeverityBadge extends StatelessWidget {
  final String severityName;

  const SeverityBadge({super.key, required this.severityName});

  Color _getColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'high':
        return Colors.red;
      case 'critical':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getColor(severityName).withValues(alpha: .1),
        border: Border.all(color: _getColor(severityName), width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        toBeginningOfSentenceCase(severityName),
        style: TextStyle(
          color: _getColor(severityName),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
