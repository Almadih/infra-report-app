// lib/services/app_cache_manager.dart
import 'package:dio/dio.dart';
import 'package:infra_report/services/image_cache_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:infra_report/utils/logger.dart';

/// This is the single, global instance of our custom cache manager.
/// By defining it as a top-level final variable, we ensure it's created only once.
class AppCacheManager extends CacheManager with ImageCacheManager {
  static const key =
      'authenticatedImageCache_v3'; // Bump version to clear old invalid caches

  static late final CacheManager instance;

  AppCacheManager(super.config);

  static void initialize(Dio dio) {
    instance = CacheManager(
      Config(
        key,
        repo: JsonCacheInfoRepository(databaseName: key),
        stalePeriod: const Duration(days: 30), // Let's cache for a long time
        maxNrOfCacheObjects: 200,
        fileService: DioFileService(dio), // Use our custom file service
      ),
    );
    log.info("[AppCacheManager] Initialized with key: $key");
  }
}
