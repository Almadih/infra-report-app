// lib/screens/profile/edit_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:infra_report/models/user_model.dart';
import 'package:infra_report/providers/auth_provider.dart';
import 'package:infra_report/providers/profile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  final User currentUser;
  const EditProfileScreen({super.key, required this.currentUser});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late bool _isPublic;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize the form fields with the current user's data
    _nameController = TextEditingController(text: widget.currentUser.name);
    _isPublic = widget.currentUser.isPublic;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    // Validate the form
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Call the provider's method to update the profile
      await ref
          .read(authProvider.notifier)
          .updateProfile(name: _nameController.text, isPublic: _isPublic);

      if (mounted) {
        ref.invalidate(profileProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(); // Go back to the profile screen
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update profile: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Public Information", style: theme.textTheme.titleMedium),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              Text("Privacy Settings", style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              SwitchListTile(
                title: const Text('Public Profile'),
                subtitle: Text(
                  _isPublic
                      ? 'Other users can see your name on reports.'
                      : 'Your name will be hidden on reports.',
                ),
                value: _isPublic,
                onChanged: (newValue) {
                  setState(() {
                    _isPublic = newValue;
                  });
                },
                secondary: Icon(
                  _isPublic
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: _isLoading ? null : _saveProfile,
                  child: _isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
