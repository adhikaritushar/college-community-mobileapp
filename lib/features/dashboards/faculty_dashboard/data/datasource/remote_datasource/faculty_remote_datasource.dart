import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/data/models/faculty_user_model.dart';

abstract class FacultyRemoteDatasource {
  Future<Either<AppErrorHandler, List<FacultyUserModel>>> facultyGetDetails({required int enrollmentNo});
}

class FacultyRemoteDatasourceImpl implements FacultyRemoteDatasource {
  final GenericApiHandler apiHandler;

  FacultyRemoteDatasourceImpl({required this.apiHandler});

  @override
  Future<Either<AppErrorHandler, List<FacultyUserModel>>> facultyGetDetails({required int enrollmentNo}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.facultyGetDetailsURL,
        data: {"employeeId": enrollmentNo},
      );
      return response.fold(
        (l) => left(l),
        (r) => right(FacultyUserModel.listfromJson(r['user'])),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }
}
