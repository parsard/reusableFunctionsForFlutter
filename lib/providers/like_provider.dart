import 'package:flutter/material.dart'; // Importing the Material Design library for base Flutter classes.

class LikeProvider extends ChangeNotifier {
  // A provider class extending ChangeNotifier, allowing widgets to listen to changes and rebuild accordingly.

  final Map<String, bool> _likedBooks = {};
  // A private map to store the "liked" state for each book.
  // The key is the bookId, and the value is a boolean indicating whether the book is liked.

  // Function to toggle "like" state
  void toggleLike(String bookId) {
    _likedBooks[bookId] = !(_likedBooks[bookId] ?? false);
    // If the book is not yet in the map (`null`), default the value to `false`.
    // Then invert the current value to toggle.

    notifyListeners();
    // Notify all listeners (widgets using the provider) about the state change, so they can rebuild their UI.
  }

  // Function to check "liked" state
  bool isLiked(String bookId) {
    return _likedBooks[bookId] ?? false;
    // Return the value for the bookId from the map.
    // If it's not in the map (`null`), default to `false` (not liked).
  }
}
