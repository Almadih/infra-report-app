// lib/screens/report_details/report_details_screen.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/models/report_model.dart' as app_models;
import 'package:flutter_application_1/screens/report_details/widgets/report_flag_card.dart';
import 'package:flutter_application_1/screens/report_details/widgets/report_owner_card.dart';
import 'package:flutter_application_1/screens/report_details/widgets/report_update_tile.dart';
import 'package:flutter_application_1/widgets/authenticated_image.dart';
import 'package:flutter_application_1/screens/history/widgets/severity_badge.dart';
import 'package:flutter_application_1/screens/report_details/widgets/fullscreen_image_viewer.dart';
import 'package:flutter_application_1/screens/report_details/widgets/status_stepper.dart';
import 'package:intl/intl.dart';

class ReportDetailsScreen extends StatefulWidget {
  final app_models.Report report;

  const ReportDetailsScreen({super.key, required this.report});

  @override
  State<ReportDetailsScreen> createState() => _ReportDetailsScreenState();
}

Widget _buildUserSection(BuildContext context, app_models.Report report) {
  final theme = Theme.of(context);

  if (report.user == null) {
    return const SizedBox.shrink();
  }

  return ReportOwnerCard(owner: report.user!);
}

// Create a new builder method for the updates section
Widget _buildUpdatesSection(BuildContext context, app_models.Report report) {
  final theme = Theme.of(context);

  // --- CONDITIONAL RENDERING ---
  // If there are no updates, return an empty widget to hide the section.
  if (report.updates.isEmpty) {
    return const SizedBox.shrink();
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),

      const Divider(),

      const SizedBox(height: 8),
      Text(
        'Report Updates',
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 16),
      // Use ListView.builder for performance with many updates
      ListView.builder(
        itemCount: report.updates.length,
        shrinkWrap: true, // Important inside a SingleChildScrollView
        physics: const NeverScrollableScrollPhysics(), // Let the parent scroll
        itemBuilder: (context, index) {
          final update = report.updates[index];
          return ReportUpdateTile(
            update: update,
            isFirst: index == 0,
            isLast: index == report.updates.length - 1,
          );
        },
      ),
    ],
  );
}

Widget _buildFlagsSection(BuildContext context, app_models.Report report) {
  final theme = Theme.of(context);
  print("flags section : ${report.flags.length}");
  // --- CONDITIONAL RENDERING ---
  // If there are no flags, return an empty widget to hide the section.
  if (report.flags.isEmpty) {
    return const SizedBox.shrink();
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),
      const Divider(),
      const SizedBox(height: 8),
      Row(
        children: [
          Icon(Icons.flag_circle, color: theme.colorScheme.error),
          const SizedBox(width: 8),
          Text(
            'Flags',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.error,
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      // Use ListView.builder for performance with many flags
      ListView.builder(
        itemCount: report.flags.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ReportFlagCard(flag: report.flags[index]);
        },
      ),
    ],
  );
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  int _currentImageIndex = 0;

  Widget _buildImageCarousel() {
    if (widget.report.images.isEmpty) {
      return Container(
        height: 250,
        color: Colors.grey[200],
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: Colors.grey[400],
            size: 60,
          ),
        ),
      );
    }

    final imageIds = widget.report.images.map((img) => img.id).toList();

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imageIds.length,
          itemBuilder: (context, index, realIndex) {
            final imageId = imageIds[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullscreenImageViewer(
                      imageIds: imageIds,
                      initialIndex: index,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: 'image_$imageId', // Match the tag in the viewer
                child: AuthenticatedImage(
                  imageId: imageId,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 250,
            autoPlay: imageIds.length > 1,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
        ),
        // Carousel Indicators
        if (imageIds.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageIds.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () =>
                    CarouselSliderController().animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(
                              _currentImageIndex == entry.key ? 0.9 : 0.4,
                            ),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(value, style: theme.textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final report = widget.report;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(report.damageType.name),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary.withOpacity(0.1),
                theme.scaffoldBackgroundColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageCarousel(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status Section
                  Text(
                    'Report Status',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  StatusStepper(currentStatus: report.status.name),

                  // Details Section
                  Text(
                    'Details',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildUserSection(context, report),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    context,
                    icon: Icons.location_on,
                    title: 'Location',
                    value: report.address,
                  ),
                  _buildDetailRow(
                    context,
                    icon: Icons.calendar_today,
                    title: 'Reported On',
                    value: DateFormat(
                      'EEEE, MMM d, yyyy  -  hh:mm a',
                    ).format(report.createdAt.toLocal()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: theme.colorScheme.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 16),
                        SeverityBadge(severityName: report.severity.name),
                      ],
                    ),
                  ),
                  if (report.description != null)
                    _buildDetailRow(
                      context,
                      icon: Icons.description,
                      title: 'Description',
                      value: report.description!,
                    ),
                  _buildUpdatesSection(context, report),
                  _buildFlagsSection(context, report),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
