// lib/screens/history/widgets/severity_badge.dart
import 'package:flutter/material.dart';

class SeverityBadge extends StatelessWidget {
  final String severityName;

  const SeverityBadge({super.key, required this.severityName});

  Color _getBadgeColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'low':
        return Colors.green.shade400;
      case 'medium':
        return Colors.yellow.shade700;
      case 'high':
        return Colors.orange.shade600;
      case 'critical':
        return Colors.red.shade600;
      default:
        return Colors.grey.shade400;
    }
  }

  Color _getTextColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'low':
      case 'medium':
        return Colors.black87;
      case 'high':
      case 'critical':
        return Colors.white;
      default:
        return Colors.black87;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: _getBadgeColor(severityName),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        severityName.toUpperCase(),
        style: TextStyle(
          color: _getTextColor(severityName),
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
