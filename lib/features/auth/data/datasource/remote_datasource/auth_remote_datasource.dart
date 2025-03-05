import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/auth/data/model/response/login_response_model.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDatasource {
  Future<Either<AppErrorHandler, LoginResponseModel>> adminLogin(LoginParams params);
  Future<Either<AppErrorHandler, LoginResponseModel>> studentLogin(LoginParams params);
  Future<Either<AppErrorHandler, LoginResponseModel>> facultyLogin(LoginParams params);
  Future<Either<AppErrorHandler, String>> adminChangePassword(LoginParams loginParams);
  Future<Either<AppErrorHandler, String>> studentChangePassword(LoginParams loginParams);
  Future<Either<AppErrorHandler, String>> facultyChangePassword(LoginParams loginParams);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final GenericApiHandler apiHandler;

  AuthRemoteDatasourceImpl({required this.apiHandler});
  @override
  Future<Either<AppErrorHandler, LoginResponseModel>> adminLogin(LoginParams params) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.adminLoginURL,
        data: {
          "loginid": params.loginID,
          "password": params.password,
        },
      );
      return response.fold(
        (l) => left(l),
        (r) => right(LoginResponseModel.fromMap(r)),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, LoginResponseModel>> facultyLogin(LoginParams params) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.facultyLoginURL,
        data: {
          "loginid": params.loginID,
          "password": params.password,
        },
      );
      return response.fold(
        (l) => left(l),
        (r) => right(LoginResponseModel.fromMap(r)),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, LoginResponseModel>> studentLogin(LoginParams params) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.studentLoginURL,
        data: {
          "loginid": params.loginID,
          "password": params.password,
        },
      );
      return response.fold((l) => left(l), (r) => right(LoginResponseModel.fromMap(r)));
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }
  //* =================================================================================================

  @override
  Future<Either<AppErrorHandler, String>> adminChangePassword(LoginParams loginParams) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.PUT,
        path: "${ApiEndpoint.adminChangePasswordURL}/${loginParams.id}",
        data: {
          "loginid": loginParams.loginID,
          "password": loginParams.password,
        },
      );
      return response.fold(
        (l) => left(l),
        (r) => right(r['message']),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> facultyChangePassword(LoginParams loginParams) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.PUT,
        path: "${ApiEndpoint.facultyChangePasswordURL}/${loginParams.id}",
        data: {
          "loginid": loginParams.loginID,
          "password": loginParams.password,
        },
      );
      return response.fold(
        (l) => left(l),
        (r) => right(r['message']),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> studentChangePassword(LoginParams loginParams) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.PUT,
        path: "${ApiEndpoint.studentChangePasswordURL}/${loginParams.id}",
        data: {
          "loginid": loginParams.loginID,
          "password": loginParams.password,
        },
      );
      return response.fold(
        (l) => left(l),
        (r) => right(r['message']),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }
}
