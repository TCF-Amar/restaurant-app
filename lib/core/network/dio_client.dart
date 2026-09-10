import 'package:dio/dio.dart';
import 'package:project/core/error/error_handler.dart';
import 'package:project/core/network/api_endpoints.dart';
import 'package:project/core/network/interceptors/auth_interceptor.dart';
import 'package:project/core/network/interceptors/error_interceptor.dart';
import 'package:project/core/network/interceptors/logging_interceptor.dart';

class DioClient {
  late final Dio _dio;

  DioClient({
    Dio? dio,
    String? baseUrl,
    TokenProvider? tokenProvider,
    UnauthorizedCallback? onUnauthorized,
    List<Interceptor>? customInterceptors,
  }) {
    _dio = dio ??
        Dio(
          BaseOptions(
            baseUrl: baseUrl ?? ApiEndpoints.baseUrl,
            connectTimeout: ApiEndpoints.connectTimeout,
            receiveTimeout: ApiEndpoints.receiveTimeout,
            sendTimeout: ApiEndpoints.sendTimeout,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            responseType: ResponseType.json,
          ),
        );

    // Register interceptors in order
    _dio.interceptors.addAll([
      AuthInterceptor(
        tokenProvider: tokenProvider,
        onUnauthorized: onUnauthorized,
      ),
      ErrorInterceptor(),
      LoggingInterceptor(),
      ...?customInterceptors,
    ]);
  }

  /// Direct access to underlying Dio instance
  Dio get dio => _dio;

  /// Helper to execute API requests with centralized error handling
  Future<Response<T>> _safeApiCall<T>(Future<Response<T>> Function() apiCall) async {
    try {
      return await apiCall();
    } catch (e) {
      throw ApiErrorHandler.handle(e);
    }
  }

  /// GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _safeApiCall(
      () => _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  /// POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _safeApiCall(
      () => _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  /// PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _safeApiCall(
      () => _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  /// PATCH request
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _safeApiCall(
      () => _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  /// DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _safeApiCall(
      () => _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  /// Multipart / File Upload request
  Future<Response<T>> uploadFile<T>(
    String path, {
    required FormData formData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    final uploadOptions = options ?? Options();
    uploadOptions.headers = {
      ...?uploadOptions.headers,
      'Content-Type': 'multipart/form-data',
    };

    return _safeApiCall(
      () => _dio.post<T>(
        path,
        data: formData,
        queryParameters: queryParameters,
        options: uploadOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }
}
