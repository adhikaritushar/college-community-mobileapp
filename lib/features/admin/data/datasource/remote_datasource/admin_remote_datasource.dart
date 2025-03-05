import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/admin/data/model/response/admin_model.dart';
import 'package:college_community/features/admin/domain/entities/request/admin_add_detail_params.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AdminRemoteDatasource {
  Future<Either<AppErrorHandler, AdminModel>> adminAddDetail({required AdminAddDetailParams params});
  Future<Either<AppErrorHandler, String>> adminRegister({required LoginParams loginParams});
  Future<Either<AppErrorHandler, List<AdminModel>>> adminGetDetail({required String employeeID});
  Future<Either<AppErrorHandler, String>> adminUpdateDetail({required AdminAddDetailParams params});
}

class AdminRemoteDatasourceImpl implements AdminRemoteDatasource {
  final GenericApiHandler apiHandler;

  AdminRemoteDatasourceImpl({required this.apiHandler});
  @override
  Future<Either<AppErrorHandler, AdminModel>> adminAddDetail({required AdminAddDetailParams params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.adminAddDetailURL,
        options: Options(contentType: 'multipart/form-data'),
        data: FormData.fromMap({
          'employeeId': params.employeeId,
          'firstName': params.firstName,
          'middleName': params.middleName,
          'lastName': params.lastName,
          'email': params.email,
          'phoneNumber': params.phoneNumber,
          'gender': params.gender,
          'type': params.type,
          'profile': await MultipartFile.fromFile(params.profile?.path.toString() ?? "", filename: params.profile?.path),
        }),
      );

      return response.fold(
        (l) => left(l),
        (r) => right(AdminModel.fromMap(r['user'])),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, List<AdminModel>>> adminGetDetail({required String employeeID}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.adminGetDetailsURL,
        data: {"employeeId": employeeID},
      );
      return response.fold(
        (l) => left(l),
        (r) => right(AdminModel.listfromJson(r['user'])),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> adminRegister({required LoginParams loginParams}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.adminRegisterURL,
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
  Future<Either<AppErrorHandler, String>> adminUpdateDetail({required AdminAddDetailParams params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.PUT,
        path: "${ApiEndpoint.adminUpdateDetailsURL}/$id",
        options: Options(contentType: 'multipart/form-data'),
        data: FormData.fromMap({
          'employeeId': params.employeeId,
          if (params.firstName.isNotEmpty) 'firstName': params.firstName,
          if (params.middleName.isNotEmpty) 'middleName': params.middleName,
          if (params.lastName.isNotEmpty) 'lastName': params.lastName,
          if (params.email.isNotEmpty) 'email': params.email,
          if (params.phoneNumber.isNotEmpty) 'phoneNumber': params.phoneNumber,
          if (params.gender.isNotEmpty) 'gender': params.gender,
          if (params.profile?.path != null && params.profile!.path.isNotEmpty) ...{
            'type': params.type,
            'profile': await MultipartFile.fromFile(
              params.profile!.path,
              filename: params.profile!.path.split('/').last,
            ),
          }
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
