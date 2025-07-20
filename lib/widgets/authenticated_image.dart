// lib/widgets/authenticated_image.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infra_report/providers/image_cache_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticatedImage extends ConsumerStatefulWidget {
  final int imageId;
  final BoxFit fit;
  final double? width;
  final double? height;

  const AuthenticatedImage({
    super.key,
    required this.imageId,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  @override
  ConsumerState<AuthenticatedImage> createState() => _AuthenticatedImageState();
}

class _AuthenticatedImageState extends ConsumerState<AuthenticatedImage> {
  // We use a key to force the widget to rebuild on retry.
  Key _imageKey = UniqueKey();

  void _retry() {
    // By changing the key, we force Flutter to create a new instance of
    // CachedNetworkImage, which triggers a new fetch attempt.
    setState(() {
      _imageKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch our custom cache manager provider
    final imagesCacheManager = ref.watch(imageCacheManagerProvider);
    // This URL serves as the unique key for the cache.
    // Our custom DioFileService will parse this URL to get the actual API path.
    final String imageUrl = '/image/${widget.imageId}';
    return CachedNetworkImage(
      key: _imageKey,
      // The unique URL for the cache key
      imageUrl: imageUrl,

      // *** THIS IS THE CORRECT AND ONLY REQUIRED PARAMETER ***
      // Provide the custom cache manager.
      cacheManager: imagesCacheManager,

      // Use imageBuilder to have full control over the final Image widget display.
      imageBuilder: (context, imageProvider) => Image(
        image: imageProvider,
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
      ),

      // Placeholder to show while the image is loading.
      placeholder: (context, url) => Container(
        color: Colors.grey[300],
        child: const Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
        ),
      ),

      // Widget to display if fetching or decoding fails.
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.broken_image, color: Colors.grey, size: 40),
            const SizedBox(height: 8),
            TextButton(onPressed: _retry, child: const Text('Retry')),
          ],
        ),
      ),
      width: widget.width,
      height: widget.height,
    );
  }
}
