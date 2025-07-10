// lib/screens/report_details/widgets/status_stepper.dart
import 'package:flutter/material.dart';

class StatusStepper extends StatelessWidget {
  final String currentStatus;
  final List<String> allStatuses;

  const StatusStepper({
    super.key,
    required this.currentStatus,
    // Define the fixed order of statuses
    this.allStatuses = const [
      'pending',
      'under_review',
      'verified',
      'resolved',
    ],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final int currentIndex = allStatuses.indexOf(
      currentStatus.toLowerCase().replaceAll(' ', '_'),
    );

    if (currentIndex == -1) {
      // Fallback if status is unknown
      return Center(child: Text('Status: $currentStatus'));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Row(
        children: List.generate(allStatuses.length, (index) {
          final isCompleted = index <= currentIndex;
          final isCurrent = index == currentIndex;
          final status = allStatuses[index];

          return Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // --- The line and circle part ---
                Row(
                  children: [
                    // Line before the circle (except for the first item)
                    Expanded(
                      child: index == 0
                          ? const SizedBox.shrink()
                          : Container(
                              height: 3,
                              color: isCompleted
                                  ? theme.colorScheme.primary
                                  : Colors.grey.shade300,
                            ),
                    ),
                    // The circle
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCompleted
                            ? theme.colorScheme.primary
                            : Colors.grey.shade300,
                        border: isCurrent
                            ? Border.all(
                                color: theme.colorScheme.primaryContainer,
                                width: 4,
                              )
                            : null,
                      ),
                      child: isCompleted && !isCurrent
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            )
                          : null,
                    ),
                    // Line after the circle (except for the last item)
                    Expanded(
                      child: index == allStatuses.length - 1
                          ? const SizedBox.shrink()
                          : Container(
                              height: 3,
                              color: index < currentIndex
                                  ? theme.colorScheme.primary
                                  : Colors.grey.shade300,
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // --- The text label ---
                Text(
                  status
                      .replaceAll('_', ' ')
                      .split(' ')
                      .map(
                        (word) =>
                            '${word[0].toUpperCase()}${word.substring(1)}',
                      )
                      .join(' '),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    color: isCompleted
                        ? theme.colorScheme.onSurface
                        : Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
