// lib/screens/profile/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/auth_state.dart';
import 'package:flutter_application_1/providers/auth_provider.dart';
import 'package:flutter_application_1/screens/notifications/edit_profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Future<void> _showLogoutConfirmation(
    BuildContext context,
    WidgetRef ref,
  ) async {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              // Call the logout method from the provider.
              // The AppInitializer will automatically handle navigation.
              ref.read(authProvider.notifier).logout();
              // No need to pop the dialog, as the whole screen will be replaced.
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the auth provider to get the current state
    final authState = ref.watch(authProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: authState.when(
        // We should always have data here since this screen is only shown when authenticated.
        // This .when() is for safety.
        data: (state) {
          if (state is Authenticated) {
            final user = state.user;
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // --- User Info Section ---
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      // In a real app, you would use AuthenticatedImage here for user.avatarUrl
                      child: Icon(Icons.person, size: 50),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user.name,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.name,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Divider(),

                // --- Menu Items Section ---
                ListTile(
                  leading: const Icon(Icons.edit_outlined),
                  title: const Text('Edit Profile'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    final authStateValue = ref.read(authProvider).value;
                    if (authStateValue is Authenticated) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                            currentUser: authStateValue.user,
                          ),
                        ),
                      );
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shield_outlined),
                  title: const Text('Security & Privacy'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    /* Navigate to Security Page */
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text('App Settings'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    /* Navigate to Settings Page */
                  },
                ),
                const Divider(),

                // --- Logout Button ---
                ListTile(
                  leading: Icon(Icons.logout, color: theme.colorScheme.error),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                  onTap: () => _showLogoutConfirmation(context, ref),
                ),
              ],
            );
          }
          // This case should ideally not be reached if routing is correct.
          return const Center(child: Text('Not authenticated.'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
