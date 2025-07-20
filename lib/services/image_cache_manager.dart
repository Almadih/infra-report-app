// lib/services/image_cache_manager.dart
import 'package:dio/dio.dart' as dio;
import 'package:infra_report/config/api_config.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:infra_report/utils/logger.dart';

/// Custom implementation of a FileService to fetch images using a Dio client.
/// This allows us to use an authenticated client for fetching protected images.
class DioFileService extends FileService {
  final dio.Dio _dio;

  DioFileService(this._dio);

  @override
  Future<FileServiceResponse> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      // The `url` passed here is the full URL we use as a cache key.
      // We should extract just the path for the Dio request, as Dio already has the base URL.
      // Example url: "https://api.example.com/v1/api/images/123"
      // We extract: "/api/images/123"
      final uri = Uri.parse(url);
      final apiPath = uri.path; // This gives "/v1/api/images/123" or similar
      _dio.options = dio.BaseOptions(
        baseUrl: ApiConfig.baseUrl.replaceAll("/api", ""),
      );
      final response = await _dio.get(
        apiPath,
        options: dio.Options(responseType: dio.ResponseType.bytes),
      );

      log.info(
        "[DioFileService] Successfully fetched ${response.data.length} bytes for $apiPath",
      );

      final streamedResponse = http.StreamedResponse(
        // Create a stream from the response bytes
        Stream.value(response.data as List<int>),
        response.statusCode!,
        // Pass along headers if needed, especially content-length
        contentLength: response.data.length,
        request: http.Request('GET', uri),
        headers: {
          // Convert Dio's Headers map to a Map<String, String>
          // Example: 'content-type' header is important for the cache manager
          for (var entry in response.headers.map.entries)
            entry.key: entry.value.join(','),
        },
      );

      return HttpGetResponse(streamedResponse);
    } on dio.DioException catch (e) {
      log.warning("[DioFileService] DioException occurred: ${e.message}");
      final streamedResponse = http.StreamedResponse(
        const Stream.empty(),
        e.response?.statusCode ?? 500,
      );
      // The HttpGetResponse constructor expects the exception in the `exception` parameter.
      return HttpGetResponse(streamedResponse);
    }
  }
}

/// A custom CacheManager that uses our DioFileService.
///
/// By removing the factory/singleton pattern and just using the constructor,
/// we rely on the flutter_cache_manager's internal handling. The unique `key` in the
/// Config ensures that we always access the same cache directory on disk.
class AuthenticatedCacheManager extends CacheManager {
  static const key = 'authenticatedImageCache_v3';

  AuthenticatedCacheManager({required dio.Dio dio})
    : super(
        Config(
          key, // The unique key for this cache instance.
          stalePeriod: const Duration(days: 30), // Let's cache for longer.
          repo: JsonCacheInfoRepository(databaseName: key),

          maxNrOfCacheObjects: 200,
          fileService: DioFileService(dio), // Use our custom file service.
        ),
      );
}
