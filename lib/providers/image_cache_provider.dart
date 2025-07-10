// lib/providers/image_cache_provider.dart
import 'package:flutter_application_1/providers/dio_provider.dart';
import 'package:flutter_application_1/services/image_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_cache_provider.g.dart';

// This provider will create a new instance, but the underlying cache on disk
// is persistent because the 'key' in the Config is constant.
@Riverpod(keepAlive: true)
AuthenticatedCacheManager imageCacheManager(ref) {
  final dio = ref.watch(dioProvider);
  return AuthenticatedCacheManager(dio: dio);
}
