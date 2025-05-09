import 'dart:io'; // Importing the Dart IO library for file handling.
import 'package:flutter/widgets.dart'; // Importing Flutter's basic widgets library.
import 'package:image_picker/image_picker.dart'; // Importing the image_picker package for image selection.

class ImagePickerProvider extends ChangeNotifier {
  // A provider class extending ChangeNotifier to manage and notify changes in state.

  final _picker = ImagePicker();
  // Creating an instance of the ImagePicker class from the image_picker package. This handles image selection.

  File? _selectedImage;
  // Private variable to hold the selected image file. Nullable because no image may be selected yet.

  File? get selectedImage => _selectedImage;
  // Getter method to access the selected image file.

  Future<void> pickImage(ImageSource source) async {
    // Asynchronous method to pick an image from either the camera or gallery.
    try {
      final XFile? image = await _picker.pickImage(source: source);
      // Using image_picker's pickImage method to choose an image source (camera or gallery).
      // Returns an XFile object which represents the picked file.

      if (image != null) {
        // If an image is successfully picked:
        _selectedImage = File(image.path);
        // Convert the XFile path into a Dart File object and store it in the _selectedImage variable.

        notifyListeners();
        // Notify all listeners (widgets using the provider) that the state (selected image) has changed.
      }
    } catch (e) {
      // If an error occurs while picking the image:
      print('Error picking image: $e');
      // Print the error to the console for debugging.
    }
  }

  void clearImage() {
    // Method to clear the selected image.
    _selectedImage = null;
    // Set the _selectedImage variable to null to signify no image is selected.

    notifyListeners();
    // Notify all listeners that the state has been updated.
  }
}
