import 'package:flutter/material.dart'; // Importing the Material Design library for UI components.
import 'package:image_picker/image_picker.dart'; // Importing the image_picker package for image selection functionality.
import 'package:provider/provider.dart'; // Importing the Provider package for state management.
import 'package:reusable_functions/providers/image_picker_provider.dart'; // Importing the custom ImagePickerProvider.

class ImagePickerWidget extends StatelessWidget {
  // StatelessWidget means this widget doesn’t have any internal state.
  const ImagePickerWidget({
    super.key,
  }); // Const constructor for immutability and optimization.

  @override
  Widget build(BuildContext context) {
    // The `build` method creates the UI.
    final imageProvider = Provider.of<ImagePickerProvider>(context);
    // Accessing ImagePickerProvider from the widget tree using Provider. This manages the selected image state.

    return Column(
      // Creating a vertical column layout for the widget's children.
      children: [
        // UI elements in the column.
        imageProvider.selectedImage !=
                null // Checking if an image is selected.
            ? Image.file(
              imageProvider
                  .selectedImage!, // If an image is selected, display it as a file.
              height: 200, // Setting the height of the image.
              fit:
                  BoxFit
                      .cover, // Ensures the image covers the defined area proportionately.
            )
            : const Icon(
              Icons.image,
              size: 200,
            ), // If no image is selected, display a placeholder icon.

        Row(
          // Creating a horizontal row layout for buttons.
          children: [
            ElevatedButton(
              onPressed: () => imageProvider.pickImage(ImageSource.camera),
              // Calls the provider method to pick an image using the camera.
              child: const Text('Take Photo'),
              // Button label as "Take Photo".
            ),
            const SizedBox(width: 10),
            // Adds spacing between the buttons.
            ElevatedButton(
              onPressed: () => imageProvider.pickImage(ImageSource.gallery),
              // Calls the provider method to pick an image from the gallery.
              child: const Text('Pick from Gallery'),
              // Button label as "Pick from Gallery".
            ),
          ],
        ),
      ],
    );
  }
}
