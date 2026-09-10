import 'package:project/core/error/app_exception.dart';

/// Base class representing domain-level failures (used in BLoC / Repository layers)
abstract class AppFailure {
  final String message;
  final int? code;

  const AppFailure({
    required this.message,
    this.code,
  });

  @override
  String toString() => '$runtimeType(message: $message, code: $code)';

  /// Factory helper to convert any [AppException] into an [AppFailure]
  factory AppFailure.fromException(AppException exception) {
    if (exception is NetworkException) {
      return NetworkFailure(message: exception.message, code: exception.statusCode);
    } else if (exception is UnauthorizedException) {
      return UnauthorizedFailure(message: exception.message, code: exception.statusCode);
    } else if (exception is BadRequestException) {
      return BadRequestFailure(message: exception.message, code: exception.statusCode);
    } else if (exception is ForbiddenException) {
      return ForbiddenFailure(message: exception.message, code: exception.statusCode);
    } else if (exception is NotFoundException) {
      return NotFoundFailure(message: exception.message, code: exception.statusCode);
    } else if (exception is ConflictException) {
      return ConflictFailure(message: exception.message, code: exception.statusCode);
    } else if (exception is ServerException) {
      return ServerFailure(message: exception.message, code: exception.statusCode);
    } else {
      return UnexpectedFailure(message: exception.message, code: exception.statusCode);
    }
  }
}

class NetworkFailure extends AppFailure {
  const NetworkFailure({required super.message, super.code});
}

class UnauthorizedFailure extends AppFailure {
  const UnauthorizedFailure({required super.message, super.code});
}

class BadRequestFailure extends AppFailure {
  const BadRequestFailure({required super.message, super.code});
}

class ForbiddenFailure extends AppFailure {
  const ForbiddenFailure({required super.message, super.code});
}

class NotFoundFailure extends AppFailure {
  const NotFoundFailure({required super.message, super.code});
}

class ConflictFailure extends AppFailure {
  const ConflictFailure({required super.message, super.code});
}

class ServerFailure extends AppFailure {
  const ServerFailure({required super.message, super.code});
}

class UnexpectedFailure extends AppFailure {
  const UnexpectedFailure({required super.message, super.code});
}
