// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationsHash() => r'ec6afbcf8de60c020abaa82056e86de812662852';

/// See also [notifications].
@ProviderFor(notifications)
final notificationsProvider =
    AutoDisposeStreamProvider<List<AppNotification>>.internal(
      notifications,
      name: r'notificationsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$notificationsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NotificationsRef = AutoDisposeStreamProviderRef<List<AppNotification>>;
String _$unreadNotificationsCountHash() =>
    r'4494ff216de7275ece285b2b2af68e7d99ac4d46';

/// See also [unreadNotificationsCount].
@ProviderFor(unreadNotificationsCount)
final unreadNotificationsCountProvider = AutoDisposeProvider<int>.internal(
  unreadNotificationsCount,
  name: r'unreadNotificationsCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$unreadNotificationsCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UnreadNotificationsCountRef = AutoDisposeProviderRef<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
