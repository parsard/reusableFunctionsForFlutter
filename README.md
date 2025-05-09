# Dio & Secure Storage Utilities

This repository showcases utility functions for making HTTP requests and handling errors using Dio and securely storing sensitive data with Flutter Secure Storage. These utilities are modular, making them reusable and easily integrated into any Flutter application.

---

## ✨ Features

- **Error Handling**: Centralized error logging and user-friendly error messages using custom utility functions (`ErrorHandler`).
- **Secure Storage**: Securely store, retrieve, and delete key-value data (e.g., tokens) using the encrypted Flutter Secure Storage API.
- **HTTP API Integration**: Pre-configured Dio client for handling API requests with interceptors for request logging and global error catching.

---

## 📦 Prerequisites

### Required Flutter Packages

Before using the provided utility functions, you need to install the following packages in your Flutter project:

### Dio
Package for handling HTTP requests with advanced configuration features like interceptors, timeouts, and global error handling.

```bash
flutter pub add dio
