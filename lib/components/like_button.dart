import 'package:flutter/material.dart'; // Importing Material Design UI components.
import 'package:provider/provider.dart'; // Importing the Provider package for state management.
import 'package:reusable_functions/providers/like_provider.dart'; // Importing the LikeProvider for managing like functionality.

class LikeButton extends StatelessWidget {
  // A stateless widget that represents the "like" button.
  final String bookId;
  // A required field that uniquely identifies a book. This is passed when creating the widget.

  const LikeButton({super.key, required this.bookId});
  // Constructor to initialize the widget with a unique bookId.

  @override
  Widget build(BuildContext context) {
    // The `build` method defines the UI structure of the widget.

    final likeProvider = Provider.of<LikeProvider>(context);
    // Accessing the instance of `LikeProvider` from the widget tree to fetch and modify the like state for the given book.

    return IconButton(
      // A Flutter button widget that displays an icon and triggers an action when clicked.
      icon: Icon(
        // The icon to display on the button.
        likeProvider.isLiked(bookId)
            ? Icons
                .favorite // If the book is liked, show the "favorite" (heart-filled) icon.
            : Icons
                .favorite_border, // If not liked, show the "favorite_border" (heart-outline) icon.
        color:
            likeProvider.isLiked(bookId)
                ? Colors
                    .red // Color the icon red when liked.
                : Colors.grey, // Otherwise, color it grey.
      ),
      onPressed: () {
        // Action triggered when the button is clicked.
        likeProvider.toggleLike(bookId);
        // Call the `toggleLike` method from the `LikeProvider` to toggle the "like" state.
      },
    );
  }
}
