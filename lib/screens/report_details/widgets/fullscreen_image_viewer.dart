// lib/screens/report_details/widgets/fullscreen_image_viewer.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/authenticated_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullscreenImageViewer extends StatelessWidget {
  final List<int> imageIds;
  final int initialIndex;

  const FullscreenImageViewer({
    super.key,
    required this.imageIds,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: initialIndex);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // Make back button white
      ),
      body: PhotoViewGallery.builder(
        pageController: pageController,
        itemCount: imageIds.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions.customChild(
            // Use our AuthenticatedImage inside a PhotoView
            child: PhotoView.customChild(
              // Use a key to help flutter differentiate when rebuilding
              key: ValueKey('photo_view_$index'),
              // This child will be the one that is zoomable/pannable
              // We need to build the child with our AuthenticatedImage
              // but PhotoView doesn't directly support a builder.
              // A common workaround is to use a custom child which is an AuthenticatedImage.
              // However, for best performance with PhotoView, we need an ImageProvider.
              // Let's adapt the AuthenticatedImage to provide one.
              // FOR NOW: Let's use a simpler, direct approach. PhotoView can take a child.
              // We will make our AuthenticatedImage the child.
              child: AuthenticatedImage(
                imageId: imageIds[index],
                fit: BoxFit.contain, // Important for photo view
              ),
            ),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2.0,
            heroAttributes: PhotoViewHeroAttributes(
              tag: 'image_${imageIds[index]}',
            ),
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        loadingBuilder: (context, event) => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ),
    );
  }
}
