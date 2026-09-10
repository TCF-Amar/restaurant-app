import 'dart:developer' as dev;
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dev.log(
      '🌐 [REQUEST] => ${options.method} ${options.uri}\n'
      'Headers: ${options.headers}\n'
      'QueryParams: ${options.queryParameters}\n'
      'Body: ${options.data}',
      name: 'Dio.Request',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dev.log(
      '✅ [RESPONSE] <= ${response.statusCode} ${response.requestOptions.uri}\n'
      'Data: ${response.data}',
      name: 'Dio.Response',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    dev.log(
      '❌ [ERROR] <= ${err.response?.statusCode} ${err.requestOptions.uri}\n'
      'Type: ${err.type}\n'
      'Message: ${err.message}\n'
      'Data: ${err.response?.data}',
      name: 'Dio.Error',
    );
    super.onError(err, handler);
  }
}
