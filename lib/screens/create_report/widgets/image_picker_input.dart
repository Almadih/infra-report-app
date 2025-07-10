// lib/screens/create_report/widgets/image_picker_input.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImagePickerInput extends StatefulWidget {
  final Function(List<XFile>) onImagesSelected;
  final List<XFile> initialImages;

  const ImagePickerInput({
    // Make key nullable if you are not always passing it
    // Or make it required if you always pass it.
    // For this scenario, if ImagePickerInputState needs to be accessed via GlobalKey,
    // the key should be passed from the parent.
    super.key,
    required this.onImagesSelected,
    this.initialImages = const [],
  });

  @override
  // Change _ImagePickerInputState to ImagePickerInputState
  ImagePickerInputState createState() => ImagePickerInputState();
}

// Make the State class public
class ImagePickerInputState extends State<ImagePickerInput> {
  late List<XFile> _selectedImages;
  final ImagePicker _picker = ImagePicker();
  bool _showValidationMessage = false; // Moved here from build method scope

  @override
  void initState() {
    super.initState();
    _selectedImages = List.from(widget.initialImages);
  }

  Future<void> _pickImages() async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultiImage(
        imageQuality: 70,
      );
      // No need to check pickedFiles.isNotEmpty if pickMultiImage can return empty list
      // pickMultiImage returns an empty list if no images are selected, not null.
      setState(() {
        _selectedImages.addAll(pickedFiles);
      });
      widget.onImagesSelected(_selectedImages);
    } catch (e) {
      debugPrint("Error picking images: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking images: ${e.toString()}')),
        );
      }
    }
  }

  void _removeImage(XFile image) {
    setState(() {
      _selectedImages.remove(image);
    });
    widget.onImagesSelected(_selectedImages);
  }

  // Public method to trigger validation display
  void triggerValidation() {
    if (_selectedImages.isEmpty) {
      setState(() {
        _showValidationMessage = true;
      });
    } else {
      setState(() {
        _showValidationMessage = false;
      });
    }
  }

  bool get hasSelectedImages => _selectedImages.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: _pickImages,
          child: FractionallySizedBox(
            widthFactor: 1,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Text(
                      "Add photos",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (_selectedImages.isNotEmpty)
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: MasonryGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: _selectedImages.length,
              itemBuilder: (context, index) {
                final image = _selectedImages[index];
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.file(
                      File(image.path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 100,
                    ),
                    IconButton(
                      icon: const CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: Icon(Icons.close, color: Colors.white, size: 18),
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => _removeImage(image),
                    ),
                  ],
                );
              },
            ),
          )
        else
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('No images selected.'),
          ),
        if (_showValidationMessage &&
            _selectedImages.isEmpty) // Check both flags
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Please select at least one image.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
