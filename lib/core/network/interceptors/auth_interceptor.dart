import 'package:dio/dio.dart';

typedef TokenProvider = Future<String?> Function();
typedef UnauthorizedCallback = void Function();

class AuthInterceptor extends Interceptor {
  final TokenProvider? tokenProvider;
  final UnauthorizedCallback? onUnauthorized;

  AuthInterceptor({
    this.tokenProvider,
    this.onUnauthorized,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Check if authorization header is already present or explicitly skipped
    final requiresAuth = options.extra['requiresAuth'] ?? true;

    if (requiresAuth && !options.headers.containsKey('Authorization')) {
      final token = await tokenProvider?.call();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Trigger unauthorized callback (e.g. navigate to login, logout user)
      onUnauthorized?.call();
    }
    return handler.next(err);
  }
}
