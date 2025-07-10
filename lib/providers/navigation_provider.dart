// lib/providers/navigation_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

@riverpod
class BottomNavIndex extends _$BottomNavIndex {
  @override
  int build() => 0; // Initial tab index

  void setIndex(int index) {
    state = index;
  }
}
