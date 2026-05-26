import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../storage/secure_storage.dart';
import '../../constants/app_constants.dart';

/// Interceptor to add authentication token to requests
class AuthInterceptor extends Interceptor {
  final Ref _ref;

  AuthInterceptor(this._ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get token from secure storage
    final storage = _ref.read(secureStorageProvider);
    final token = await storage.read(AppConstants.accessTokenKey);

    // Add token to headers if available
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized - token expired
    if (err.response?.statusCode == 401) {
      // TODO: Implement token refresh logic
      // For now, just clear the token
      final storage = _ref.read(secureStorageProvider);
      await storage.delete(AppConstants.accessTokenKey);
    }

    handler.next(err);
  }
}
