import 'dart:developer';

import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/faculty/data/models/faculty_model.dart';
import 'package:college_community/features/faculty/domain/entity/reqeust/faculty_add_update_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class FacultyRemoteDatasource {
  Future<Either<AppErrorHandler, List<FacultyModel>>> getFaculty({required String employeeId});
  Future<Either<AppErrorHandler, FacultyModel>> addfacultyDetail({required FacultyAddUpdateParams params});
  Future<Either<AppErrorHandler, String>> registerfaculty({required LoginParams params});
  Future<Either<AppErrorHandler, String>> updatefaculty({required FacultyAddUpdateParams params});
}

class FacultyRemoteDatasourceImpl implements FacultyRemoteDatasource {
  final GenericApiHandler apiHandler;

  FacultyRemoteDatasourceImpl({required this.apiHandler});

  @override
  Future<Either<AppErrorHandler, FacultyModel>> addfacultyDetail({required FacultyAddUpdateParams params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.addFacultyURL,
        options: Options(contentType: 'multipart/form-data'),
        data: FormData.fromMap({
          "employeeId": params.employeeId,
          "firstName": params.firstName,
          "middleName": params.middleName,
          "lastName": params.lastName,
          "email": params.email,
          "phoneNumber": params.phoneNumber,
          "department": params.department,
          "experience": params.experience,
          "gender": params.gender,
          "type": "profile",
          "post": params.post,
          if (params.profile != null) 'profile': params.profile != null ? await MultipartFile.fromFile(params.profile!.path, filename: params.profile!.path.split('/').last) : null,
        }),
      );
      log("message ::$response");
      return response.fold(
        (l) => left(l),
        (r) => right(FacultyModel.fromMap(r['user'])),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, List<FacultyModel>>> getFaculty({required String employeeId}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.getFacultyURL,
        data: {"employeeId": employeeId},
      );
      return response.fold(
        (l) => left(l),
        (r) => right(FacultyModel.listfromJson(r['user'])),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> registerfaculty({required LoginParams params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.registerFacultyURL,
        data: {
          "loginid": params.loginID,
          "password": params.password,
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
  Future<Either<AppErrorHandler, String>> updatefaculty({required FacultyAddUpdateParams params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.PUT,
        path: "${ApiEndpoint.updateFacultyURL}/${params.id}",
        options: Options(contentType: 'multipart/form-data'),
        data: FormData.fromMap({
          "employeeId": params.employeeId,
          "firstName": params.firstName,
          "middleName": params.middleName,
          "lastName": params.lastName,
          "email": params.email,
          "phoneNumber": params.phoneNumber,
          "department": params.department,
          "experience": params.experience,
          "gender": params.gender,
          "type": "profile",
          "post": params.post,
          if (params.profile != null) 'profile': params.profile != null ? await MultipartFile.fromFile(params.profile!.path, filename: params.profile!.path.split('/').last) : null,
        }),
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
