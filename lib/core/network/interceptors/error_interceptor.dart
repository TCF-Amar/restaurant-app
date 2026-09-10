import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // You can perform global error handling tasks here,
    // like tracking errors in Crashlytics, Sentry, etc.
    super.onError(err, handler);
  }
}
