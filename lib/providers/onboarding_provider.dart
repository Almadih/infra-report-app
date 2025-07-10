// lib/providers/onboarding_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_provider.g.dart';

// For now, this is in-memory. Replace with SharedPreferences for persistence.
@Riverpod(keepAlive: true)
class OnboardingCompleted extends _$OnboardingCompleted {
  @override
  bool build() {
    // In a real app, load this from SharedPreferences
    return false; // Default to false (onboarding not completed)
  }

  void completeOnboarding() {
    state = true;
    // In a real app, save this to SharedPreferences
  }

  void resetOnboarding() {
    // For testing purposes
    state = false;
  }
}
