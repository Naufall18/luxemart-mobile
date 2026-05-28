import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../storage/secure_storage.dart';
import '../../constants/app_constants.dart';
import '../../utils/logger.dart';

/// Interceptor to add authentication token and handle token refresh
class AuthInterceptor extends Interceptor {
  final Ref _ref;
  bool _isRefreshing = false;

  AuthInterceptor(this._ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final storage = _ref.read(secureStorageProvider);
    final token = await storage.read(AppConstants.accessTokenKey);

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;

      try {
        final storage = _ref.read(secureStorageProvider);
        final currentToken = await storage.read(AppConstants.accessTokenKey);

        if (currentToken == null) {
          _isRefreshing = false;
          handler.next(err);
          return;
        }

        // Attempt token refresh
        final dio = Dio(BaseOptions(
          baseUrl: AppConstants.baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $currentToken',
          },
        ));

        final response = await dio.post('/refresh-token');

        if (response.statusCode == 200) {
          final newToken = response.data['data']['token'] as String;
          await storage.write(AppConstants.accessTokenKey, newToken);

          // Retry original request with new token
          final retryOptions = err.requestOptions;
          retryOptions.headers['Authorization'] = 'Bearer $newToken';

          final retryResponse = await dio.fetch(retryOptions);
          _isRefreshing = false;
          handler.resolve(retryResponse);
          return;
        }
      } catch (e) {
        Logger.error('Token refresh failed', tag: 'AuthInterceptor', error: e);
        // Clear tokens on refresh failure → force re-login
        final storage = _ref.read(secureStorageProvider);
        await storage.delete(AppConstants.accessTokenKey);
        await storage.delete(AppConstants.refreshTokenKey);
      }

      _isRefreshing = false;
    }

    handler.next(err);
  }
}
