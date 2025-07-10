// lib/screens/history/widgets/report_history_card_skeleton.dart
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ReportHistoryCardSkeleton extends StatelessWidget {
  const ReportHistoryCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Adjusted shimmer colors for better visibility, especially in dark mode
    final Color shimmerBaseColor = isDarkMode
        ? Colors.grey[800]!
        : Colors.grey[300]!;
    final Color shimmerHighlightColor = isDarkMode
        ? Colors.grey[700]!
        : Colors.grey[100]!;
    // The color of the placeholder shapes themselves
    final Color placeholderColor = isDarkMode
        ? Colors.grey[750]!
        : Colors.grey[200]!;

    return Card(
      // Keep the Card structure for consistent spacing and elevation with real cards
      elevation: 1.5,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      child: Shimmer.fromColors(
        baseColor: shimmerBaseColor,
        highlightColor: shimmerHighlightColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Placeholder
            Container(
              height: 150,
              width: double.infinity,
              color: placeholderColor, // THIS IS CRUCIAL FOR SHIMMER TO WORK ON
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Placeholder
                  Container(
                    width: double.infinity,
                    height: 24.0,
                    color: placeholderColor, // THIS IS CRUCIAL
                    margin: const EdgeInsets.only(bottom: 8.0),
                  ),
                  // Subtitle (Location) Placeholder
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 16.0,
                    color: placeholderColor, // THIS IS CRUCIAL
                    margin: const EdgeInsets.only(bottom: 6.0),
                  ),
                  // Subtitle (Time) Placeholder
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 14.0,
                    color: placeholderColor, // THIS IS CRUCIAL
                    margin: const EdgeInsets.only(bottom: 10.0),
                  ),
                  // Badges Placeholder
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                          color: placeholderColor, // THIS IS CRUCIAL
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 80,
                        height: 20,
                        decoration: BoxDecoration(
                          color: placeholderColor, // THIS IS CRUCIAL
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
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
