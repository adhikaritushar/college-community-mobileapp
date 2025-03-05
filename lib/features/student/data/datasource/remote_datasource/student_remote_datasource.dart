import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/student/data/models/student_model.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class StudentRemoteDatasource {
  Future<Either<AppErrorHandler, List<StudentModel>>> studentGetDetails({required StudentGetDetilsParams params});
  Future<Either<AppErrorHandler, StudentModel>> studentAddDetail({required StudentAddDetailParams params});
  Future<Either<AppErrorHandler, String>> updateStudent({required StudentAddDetailParams params});
  Future<Either<AppErrorHandler, String>> registerStudent({required LoginParams params});
}

class StudentRemoteDatasourceImpl implements StudentRemoteDatasource {
  final GenericApiHandler apiHandler;

  StudentRemoteDatasourceImpl({required this.apiHandler});

  @override
  Future<Either<AppErrorHandler, List<StudentModel>>> studentGetDetails({required StudentGetDetilsParams params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.getStudentDetailsURL,
        data: {
          if (params.enrollmentNo != null) "enrollmentNo": params.enrollmentNo,
          if (params.baranch != null) "branch": params.baranch,
          if (params.semester != null) "semester": params.semester,
        },
      );
      return response.fold(
        (l) => left(l),
        (r) => right(StudentModel.listfromJson(r['user'])),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, StudentModel>> studentAddDetail({required StudentAddDetailParams params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.addStudentDetailsURL,
        options: Options(contentType: 'multipart/form-data'),
        data: FormData.fromMap({
          "enrollmentNo": params.enrollmentNo,
          "firstName": params.firstName,
          "middleName": params.middleName,
          "lastName": params.lastName,
          "email": params.email,
          "phoneNumber": params.phoneNumber,
          "semester": params.semester,
          "branch": params.branch,
          "gender": params.gender,
          "type": "profile",
          'profile': params.profile != null ? await MultipartFile.fromFile(params.profile!.path, filename: params.profile!.path.split('/').last) : null,
        }),
      );
      return response.fold(
        (l) => left(l),
        (r) => right(StudentModel.fromMap(r['user'])),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> registerStudent({required LoginParams params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.studentRegisterURL,
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
  Future<Either<AppErrorHandler, String>> updateStudent({required StudentAddDetailParams params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.PUT,
        path: "${ApiEndpoint.updateStudentURL}/${params.id}",
        options: Options(contentType: 'multipart/form-data'),
        data: FormData.fromMap({
          "enrollmentNo": params.enrollmentNo,
          "firstName": params.firstName,
          "middleName": params.middleName,
          "lastName": params.lastName,
          "email": params.email,
          "phoneNumber": params.phoneNumber,
          "semester": params.semester,
          "branch": params.branch,
          "gender": params.gender,
          "type": "profile",
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
