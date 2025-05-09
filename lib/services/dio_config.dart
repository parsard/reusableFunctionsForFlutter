import 'package:dio/dio.dart'; // Importing the Dio package for handling HTTP requests.
import 'package:reusable_functions/services/error_handler.dart';
// Importing a custom ErrorHandler class for centralized error-handling logic.

class DioConfig {
  // A utility class for configuring and creating a pre-configured Dio instance.

  static Dio createDio() {
    // A static method that builds and returns a configured Dio instance.
    Dio dio = Dio();
    // Create a new Dio instance which will be configured below.

    dio.options.baseUrl = 'https://api.example.com';
    // Set the base URL for all API requests. Replace `'https://api.example.com'` with your backend's URL.

    dio.options.connectTimeout = const Duration(seconds: 10);
    // Set the maximum allowed connection time for establishing connections. If the connection isn't established within 10 seconds, it times out.

    dio.options.receiveTimeout = const Duration(seconds: 10);
    // Set the maximum allowed time for receiving data from the server. If the response isn't received within 10 seconds, it times out.

    dio.options.headers = {
      'Content-Type': 'application/json',
      // Define the type of data being sent in requests. In this case, it's JSON.
      'Authorization': 'Bearer YOUR_API_KEY',
      // Authorization header for securing API requests. Replace `'YOUR_API_KEY'` with a dynamic token (e.g., fetched via secure storage or an authentication flow) if necessary.
    };

    // Add interceptors to monitor and handle requests, responses, and errors.
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request: ${options.method} ${options.uri}');
          // Log the HTTP method (e.g., GET, POST) and the URI of the outgoing request.
          return handler.next(options);
          // Pass the request to continue the normal flow to the network.
        },
        onResponse: (response, handler) {
          print('Response: ${response.statusCode}');
          // Log the response status code. For example, 200 for success or 404 for "not found."
          return handler.next(response);
          // Pass the response to continue the normal flow for the application.
        },
        onError: (DioException error, handler) {
          ErrorHandler.handleError(error, StackTrace.current);
          // Call the custom `ErrorHandler` to handle the error and optionally log it.
          return handler.next(error);
          // Pass the error onward to be handled by the app's retry mechanisms, if any.
        },
      ),
    );

    return dio;
    // Return the configured Dio instance to be used for making API calls.
  }
}
