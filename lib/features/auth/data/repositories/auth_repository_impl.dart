import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

/// Provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  return AuthRepositoryImpl(remoteDataSource, secureStorage);
});

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final SecureStorage _secureStorage;

  AuthRepositoryImpl(this._remoteDataSource, this._secureStorage);

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.login(
        email: email,
        password: password,
      );

      // Save tokens
      await _secureStorage.write(
        AppConstants.accessTokenKey,
        response.accessToken,
      );
      if (response.refreshToken != null) {
        await _secureStorage.write(
          AppConstants.refreshTokenKey,
          response.refreshToken!,
        );
      }

      Logger.info('Login successful, tokens saved', tag: 'AuthRepository');
      return Right(response.user.toEntity());
    } on DioException catch (e) {
      Logger.error('Login failed', tag: 'AuthRepository', error: e);
      return Left(_handleDioException(e));
    } catch (e) {
      Logger.error('Unexpected error during login', tag: 'AuthRepository', error: e);
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
    String? phoneNumber,
  }) async {
    try {
      final response = await _remoteDataSource.register(
        email: email,
        password: password,
        name: name,
        phoneNumber: phoneNumber,
      );

      // Save tokens
      await _secureStorage.write(
        AppConstants.accessTokenKey,
        response.accessToken,
      );
      if (response.refreshToken != null) {
        await _secureStorage.write(
          AppConstants.refreshTokenKey,
          response.refreshToken!,
        );
      }

      Logger.info('Registration successful, tokens saved', tag: 'AuthRepository');
      return Right(response.user.toEntity());
    } on DioException catch (e) {
      Logger.error('Registration failed', tag: 'AuthRepository', error: e);
      return Left(_handleDioException(e));
    } catch (e) {
      Logger.error('Unexpected error during registration', tag: 'AuthRepository', error: e);
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _remoteDataSource.logout();
      await _secureStorage.deleteAll();

      Logger.info('Logout successful, tokens cleared', tag: 'AuthRepository');
      return const Right(unit);
    } on DioException catch (e) {
      Logger.error('Logout failed', tag: 'AuthRepository', error: e);
      // Clear tokens even if API call fails
      await _secureStorage.deleteAll();
      return Left(_handleDioException(e));
    } catch (e) {
      Logger.error('Unexpected error during logout', tag: 'AuthRepository', error: e);
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final userModel = await _remoteDataSource.getCurrentUser();
      return Right(userModel.toEntity());
    } on DioException catch (e) {
      Logger.error('Get current user failed', tag: 'AuthRepository', error: e);
      return Left(_handleDioException(e));
    } catch (e) {
      Logger.error('Unexpected error getting current user', tag: 'AuthRepository', error: e);
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      final token = await _secureStorage.read(AppConstants.accessTokenKey);
      return token != null && token.isNotEmpty;
    } catch (e) {
      Logger.error('Error checking authentication', tag: 'AuthRepository', error: e);
      return false;
    }
  }

  @override
  Future<Either<Failure, Unit>> forgotPassword({required String email}) async {
    try {
      await _remoteDataSource.forgotPassword(email: email);
      return const Right(unit);
    } on DioException catch (e) {
      Logger.error('Forgot password failed', tag: 'AuthRepository', error: e);
      return Left(_handleDioException(e));
    } catch (e) {
      Logger.error('Unexpected error during forgot password', tag: 'AuthRepository', error: e);
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      await _remoteDataSource.resetPassword(
        token: token,
        newPassword: newPassword,
      );
      return const Right(unit);
    } on DioException catch (e) {
      Logger.error('Reset password failed', tag: 'AuthRepository', error: e);
      return Left(_handleDioException(e));
    } catch (e) {
      Logger.error('Unexpected error during reset password', tag: 'AuthRepository', error: e);
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyEmail({required String otp}) async {
    try {
      await _remoteDataSource.verifyEmail(otp: otp);
      return const Right(unit);
    } on DioException catch (e) {
      Logger.error('Verify email failed', tag: 'AuthRepository', error: e);
      return Left(_handleDioException(e));
    } catch (e) {
      Logger.error('Unexpected error during verify email', tag: 'AuthRepository', error: e);
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> resendVerificationEmail() async {
    try {
      await _remoteDataSource.resendVerificationEmail();
      return const Right(unit);
    } on DioException catch (e) {
      Logger.error('Resend verification failed', tag: 'AuthRepository', error: e);
      return Left(_handleDioException(e));
    } catch (e) {
      Logger.error('Unexpected error during resend verification', tag: 'AuthRepository', error: e);
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  /// Handle Dio exceptions and convert to Failure
  Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure.network(message: 'Connection timeout');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data['message'] ?? 'Unknown error';
        
        if (statusCode == 401 || statusCode == 403) {
          return Failure.authentication(message: message);
        } else if (statusCode == 404) {
          return Failure.notFound(message: message);
        } else if (statusCode == 400) {
          return Failure.validation(
            message: message,
            errors: e.response?.data['errors'],
          );
        } else if (statusCode != null && statusCode >= 500) {
          return Failure.server(message: message, statusCode: statusCode);
        }
        return Failure.unknown(message: message);
      case DioExceptionType.cancel:
        return const Failure.unknown(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        return const Failure.network(message: 'No internet connection');
      default:
        return Failure.unknown(message: e.message ?? 'Unknown error');
    }
  }
}
