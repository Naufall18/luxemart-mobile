import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

/// Authentication repository interface
/// Defines the contract for authentication operations
abstract class AuthRepository {
  /// Login with email and password
  /// Returns [User] on success or [Failure] on error
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  /// Register new user
  /// Returns [User] on success or [Failure] on error
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
    String? phoneNumber,
  });

  /// Logout current user
  /// Returns [Unit] on success or [Failure] on error
  Future<Either<Failure, Unit>> logout();

  /// Get current authenticated user
  /// Returns [User] on success or [Failure] on error
  Future<Either<Failure, User>> getCurrentUser();

  /// Check if user is authenticated
  /// Returns true if user is logged in
  Future<bool> isAuthenticated();

  /// Forgot password - send reset email
  /// Returns [Unit] on success or [Failure] on error
  Future<Either<Failure, Unit>> forgotPassword({
    required String email,
  });

  /// Reset password with token
  /// Returns [Unit] on success or [Failure] on error
  Future<Either<Failure, Unit>> resetPassword({
    required String token,
    required String newPassword,
  });

  /// Verify email with OTP
  /// Returns [Unit] on success or [Failure] on error
  Future<Either<Failure, Unit>> verifyEmail({
    required String otp,
  });

  /// Resend verification email
  /// Returns [Unit] on success or [Failure] on error
  Future<Either<Failure, Unit>> resendVerificationEmail();
}
