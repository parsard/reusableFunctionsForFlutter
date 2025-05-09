import 'package:dio/dio.dart';

class ErrorHandler {
  static void handleError(dynamic error, StackTrace stackTrace) {
    // Log the error (use a real logging solution in production)
    print('Error: $error');
    print('StackTrace: $stackTrace');
  }

  static String getFriendlyErrorMessage(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection Timeout. Please try again.';
        case DioExceptionType.receiveTimeout:
          return 'Response Timeout. Please try again.';
        case DioExceptionType.unknown:
          return 'Unexpected Error. Please check your connection.';
        case DioExceptionType.badResponse:
          return 'Server Error: ${error.response?.statusCode}';
        default:
          return 'An unexpected error occurred.';
      }
    }
    return 'An error occurred. Please try again.';
  }
}
