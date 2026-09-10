import 'dart:io';
import 'package:dio/dio.dart';
import 'package:project/core/error/app_exception.dart';

class ApiErrorHandler {
  /// Converts any dynamic error into a strongly-typed [AppException]
  static AppException handle(dynamic error) {
    if (error is DioException) {
      return _handleDioException(error);
    } else if (error is SocketException) {
      return const NetworkException(
        message: 'No internet connection. Please check your network.',
      );
    } else if (error is FormatException) {
      return const UnexpectedException(
        message: 'Data parsing error occurred. Invalid response format.',
      );
    } else if (error is AppException) {
      return error;
    } else {
      return UnexpectedException(
        message: error?.toString() ?? 'An unexpected error occurred.',
      );
    }
  }

  static AppException _handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const NetworkException(
          message: 'Connection timeout with the server. Please try again.',
        );

      case DioExceptionType.sendTimeout:
        return const NetworkException(
          message: 'Send timeout in connection. Please check your network.',
        );

      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          message: 'Receive timeout in connection. Server took too long to respond.',
        );

      case DioExceptionType.badCertificate:
        return const NetworkException(
          message: 'SSL certificate verification failed.',
        );

      case DioExceptionType.connectionError:
        return const NetworkException(
          message: 'Unable to connect to server. Please check your internet connection.',
        );

      case DioExceptionType.cancel:
        return const NetworkException(
          message: 'Request was cancelled.',
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);

      case DioExceptionType.unknown:
      default:
        if (error.error is SocketException) {
          return const NetworkException(
            message: 'No internet connection. Please verify your connection.',
          );
        }
        return UnexpectedException(
          message: error.message ?? 'An unknown network error occurred.',
        );
    }
  }

  static AppException _handleBadResponse(Response? response) {
    final statusCode = response?.statusCode ?? 500;
    final extractedMessage = _extractErrorMessage(response?.data);

    switch (statusCode) {
      case 400:
        return BadRequestException(
          message: extractedMessage ?? 'Bad request. Please verify your input.',
          statusCode: statusCode,
          errorData: response?.data,
        );

      case 401:
        return UnauthorizedException(
          message: extractedMessage ?? 'Unauthorized. Please login again.',
          statusCode: statusCode,
          errorData: response?.data,
        );

      case 403:
        return ForbiddenException(
          message: extractedMessage ?? 'Access forbidden. You do not have permission.',
          statusCode: statusCode,
          errorData: response?.data,
        );

      case 404:
        return NotFoundException(
          message: extractedMessage ?? 'The requested resource was not found.',
          statusCode: statusCode,
          errorData: response?.data,
        );

      case 409:
        return ConflictException(
          message: extractedMessage ?? 'Conflict occurred. Resource might already exist.',
          statusCode: statusCode,
          errorData: response?.data,
        );

      case 500:
      case 502:
      case 503:
      case 504:
        return ServerException(
          message: extractedMessage ?? 'Internal server error. Please try again later.',
          statusCode: statusCode,
          errorData: response?.data,
        );

      default:
        return UnexpectedException(
          message: extractedMessage ?? 'Received invalid status code: $statusCode',
          statusCode: statusCode,
          errorData: response?.data,
        );
    }
  }

  /// Extracts meaningful error message from various API response shapes:
  /// - {"message": "..."}
  /// - {"error": "..."}
  /// - {"errors": ["...", "..."]}
  /// - {"detail": "..."}
  static String? _extractErrorMessage(dynamic data) {
    if (data == null) return null;

    if (data is String && data.isNotEmpty) {
      return data;
    }

    if (data is Map<String, dynamic>) {
      if (data.containsKey('message') && data['message'] != null) {
        return data['message'].toString();
      }
      if (data.containsKey('error') && data['error'] != null) {
        return data['error'].toString();
      }
      if (data.containsKey('detail') && data['detail'] != null) {
        return data['detail'].toString();
      }
      if (data.containsKey('errors')) {
        final errors = data['errors'];
        if (errors is List && errors.isNotEmpty) {
          return errors.first.toString();
        } else if (errors is Map && errors.isNotEmpty) {
          final firstVal = errors.values.first;
          if (firstVal is List && firstVal.isNotEmpty) {
            return firstVal.first.toString();
          }
          return firstVal.toString();
        }
      }
    }

    return null;
  }
}
