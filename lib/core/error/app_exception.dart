/// Base exception class for all application errors
abstract class AppException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic errorData;

  const AppException({
    required this.message,
    this.statusCode,
    this.errorData,
  });

  @override
  String toString() => '$runtimeType(message: $message, statusCode: $statusCode)';
}

/// Thrown when there is no internet or connection timed out
class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.statusCode,
    super.errorData,
  });
}

/// Thrown on 400 Bad Request
class BadRequestException extends AppException {
  const BadRequestException({
    required super.message,
    super.statusCode = 400,
    super.errorData,
  });
}

/// Thrown on 401 Unauthorized (e.g. token expired, invalid credentials)
class UnauthorizedException extends AppException {
  const UnauthorizedException({
    required super.message,
    super.statusCode = 401,
    super.errorData,
  });
}

/// Thrown on 403 Forbidden
class ForbiddenException extends AppException {
  const ForbiddenException({
    required super.message,
    super.statusCode = 403,
    super.errorData,
  });
}

/// Thrown on 404 Not Found
class NotFoundException extends AppException {
  const NotFoundException({
    required super.message,
    super.statusCode = 404,
    super.errorData,
  });
}

/// Thrown on 409 Conflict
class ConflictException extends AppException {
  const ConflictException({
    required super.message,
    super.statusCode = 409,
    super.errorData,
  });
}

/// Thrown on 5xx Internal Server Errors
class ServerException extends AppException {
  const ServerException({
    required super.message,
    super.statusCode = 500,
    super.errorData,
  });
}

/// Thrown on unexpected / unknown / parsing errors
class UnexpectedException extends AppException {
  const UnexpectedException({
    required super.message,
    super.statusCode,
    super.errorData,
  });
}
