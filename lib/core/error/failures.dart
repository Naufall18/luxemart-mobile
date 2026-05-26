import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base failure class for error handling
@freezed
class Failure with _$Failure {
  /// Server failure (5xx errors)
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;

  /// Network failure (no internet, timeout)
  const factory Failure.network({
    required String message,
  }) = NetworkFailure;

  /// Authentication failure (401, 403)
  const factory Failure.authentication({
    required String message,
  }) = AuthenticationFailure;

  /// Validation failure (400, invalid input)
  const factory Failure.validation({
    required String message,
    Map<String, List<String>>? errors,
  }) = ValidationFailure;

  /// Not found failure (404)
  const factory Failure.notFound({
    required String message,
  }) = NotFoundFailure;

  /// Cache failure (local storage error)
  const factory Failure.cache({
    required String message,
  }) = CacheFailure;

  /// Unknown failure
  const factory Failure.unknown({
    required String message,
  }) = UnknownFailure;
}
