import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:college_community/features/auth/data/datasource/remote_datasource/auth_remote_datasource.dart';
import 'package:college_community/features/auth/data/model/response/login_response_model.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:college_community/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<AppErrorHandler, LoginResponseEntity>> adminLogin(LoginParams loginParams) async {
    final result = await remoteDatasource.adminLogin(loginParams);

    return result.fold(
      (l) => left(l),
      (r) async {
        await AuthLocalService.setAuthLocalServie(loginRes: r);
        return right(r.toEntity());
      },
    );
  }

  @override
  Future<Either<AppErrorHandler, LoginResponseEntity>> studentLogin(LoginParams loginParams) async {
    final result = await remoteDatasource.studentLogin(loginParams);

    return result.fold(
      (l) => left(l),
      (r) async {
        await AuthLocalService.setAuthLocalServie(loginRes: r);

        return right(r.toEntity());
      },
    );
  }

  @override
  Future<Either<AppErrorHandler, LoginResponseEntity>> facultyLogin(LoginParams loginParams) async {
    final result = await remoteDatasource.facultyLogin(loginParams);

    return result.fold(
      (l) => left(l),
      (r) async {
        await AuthLocalService.setAuthLocalServie(loginRes: r);
        return right(r.toEntity());
      },
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> adminChangePassword(LoginParams loginParams) async {
    final result = await remoteDatasource.adminChangePassword(loginParams);

    return result.fold(
      (l) => left(l),
      (r) async {
        return right(r);
      },
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> facultyChangePassword(LoginParams loginParams) async {
    final result = await remoteDatasource.facultyChangePassword(loginParams);

    return result.fold(
      (l) => left(l),
      (r) async {
        return right(r);
      },
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> studentChangePassword(LoginParams loginParams) async {
    final result = await remoteDatasource.studentChangePassword(loginParams);

    return result.fold(
      (l) => left(l),
      (r) async {
        return right(r);
      },
    );
  }
}
