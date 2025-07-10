// lib/screens/onboarding/onboarding_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/models/onboarding_item_model.dart';
import 'package:flutter_application_1/app.dart'; // To navigate to MyApp
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isAuthenticating = false; // Add state to manage loading

  // Define your onboarding content
  final List<OnboardingItem> _onboardingPages = [
    OnboardingItem(
      imagePath:
          'assets/onboarding/photo-11.png', // Replace with your actual image paths
      title: 'Welcome to ReportIt!',
      description: 'Easily report incidents and view them on a live map.',
    ),
    OnboardingItem(
      imagePath: 'assets/onboarding/photo-22.png',
      title: 'Stay Informed',
      description: 'Get real-time updates on reported issues in your area.',
    ),
    OnboardingItem(
      imagePath: 'assets/onboarding/photo-333.png',
      title: 'Make a Difference',
      description: 'Contribute to a safer and more responsive community.',
    ),
  ];

  void _getStarted() async {
    setState(() {
      _isAuthenticating = true;
    });

    try {
      // Call the login method from the Auth provider.
      // We don't need to navigate here. The AppInitializer will see the
      // auth state change and automatically switch the screen.
      await ref.read(authProvider.notifier).login();

      // If login is successful, the router will handle the navigation.
      // If it fails, the error will be caught below.
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Authentication Failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isAuthenticating = false;
        });

        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Future<void> _navigateToNextPage() async {
    if (_currentPage < _onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _getStarted();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    print(theme.colorScheme.primary);
    return ScaffoldGradientBackground(
      // backgroundColor: Colors.green, // Or a custom onboarding background
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xff0c9e5a), Color(0xff076c38), Color(0xff034222)],
      ),
      //"#0c9e5a", "#076c38", "#034222"
      body: SafeArea(
        // Ensures content is not under status bar / notch
        child: Column(
          children: [
            Expanded(
              flex: 3, // Give more space to PageView
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _onboardingPages.length,
                itemBuilder: (context, index) {
                  final item = _onboardingPages[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            item.imagePath,
                            fit: BoxFit.contain, // Adjust fit as needed
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            item.description,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ), // Space before indicators might be needed
                      ],
                    ),
                  );
                },
              ),
            ),
            // Page Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingPages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Action Button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: primarySwatch.shade500,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _navigateToNextPage,
                child: _isAuthenticating
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(
                        _currentPage == _onboardingPages.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),

            // Optional: Skip button for the first few pages
          ],
        ),
      ),
    );
  }
}
