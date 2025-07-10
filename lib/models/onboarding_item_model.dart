// lib/models/onboarding_item_model.dart
class OnboardingItem {
  final String imagePath; // Path to image in assets
  final String title;
  final String description;

  OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
