import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/subject/data/models/student_subject_model.dart';
import 'package:college_community/features/subject/domain/entity/request/add_subject_parms.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class SubjectRemoteDatasource {
  Future<Either<AppErrorHandler, List<SubjectModel>>> getSubject();
  Future<Either<AppErrorHandler, String>> addSubject({required AddSubjectParms params});
  Future<Either<AppErrorHandler, String>> deleteSubject({required String id});
}

class SubjectRemoteDatasourceImpl implements SubjectRemoteDatasource {
  final GenericApiHandler apiHandler;

  SubjectRemoteDatasourceImpl({required this.apiHandler});

  @override
  Future<Either<AppErrorHandler, List<SubjectModel>>> getSubject() async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.GET,
        path: ApiEndpoint.getSubjectURL,
      );
      return response.fold(
        (l) => left(l),
        (r) => right(SubjectModel.listfromJson(r['subject'])),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> addSubject({required AddSubjectParms params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.addSubjectURL,
        data: {
          "code": params.code,
          "name": params.name,
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
  Future<Either<AppErrorHandler, String>> deleteSubject({required String id}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.DELETE,
        path: "${ApiEndpoint.deleteSubjectURL}/$id",
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
