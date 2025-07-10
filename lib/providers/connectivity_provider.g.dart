// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appConnectivityHash() => r'26ae9cb13f00f25e6cc42caa02e4f2b721468696';

/// A Riverpod provider that tracks and exposes the app's online status.
///
/// It performs an initial check and then listens to a stream for real-time updates.
///
/// - `keepAlive: true`: Ensures the provider is not disposed when no longer listened to,
///   so the stream subscription stays active throughout the app's lifecycle.
///
/// Returns an `AsyncValue<bool>`:
/// - `AsyncData(true)`: The device is online.
/// - `AsyncData(false)`: The device is offline.
/// - `AsyncLoading()`: The initial connectivity check is in progress.
///
/// Copied from [AppConnectivity].
@ProviderFor(AppConnectivity)
final appConnectivityProvider =
    AsyncNotifierProvider<AppConnectivity, bool>.internal(
      AppConnectivity.new,
      name: r'appConnectivityProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appConnectivityHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppConnectivity = AsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
