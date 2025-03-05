import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppErrorHandler, Type>> call(Params parms);
}
