import 'package:dartz/dartz.dart';
import '../error/failures.dart';

/// Base use case interface
/// All use cases should implement this interface
abstract class UseCase<Type, Params> {
  /// Execute the use case
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case with no parameters
abstract class NoParamsUseCase<Type> {
  /// Execute the use case
  Future<Either<Failure, Type>> call();
}

/// No parameters class
class NoParams {
  const NoParams();
}
