import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<AppErrorHandler, LoginResponseEntity>> adminLogin(LoginParams loginParams);
  Future<Either<AppErrorHandler, LoginResponseEntity>> studentLogin(LoginParams loginParams);
  Future<Either<AppErrorHandler, LoginResponseEntity>> facultyLogin(LoginParams loginParams);
  Future<Either<AppErrorHandler, String>> adminChangePassword(LoginParams loginParams);
  Future<Either<AppErrorHandler, String>> studentChangePassword(LoginParams loginParams);
  Future<Either<AppErrorHandler, String>> facultyChangePassword(LoginParams loginParams);
}
