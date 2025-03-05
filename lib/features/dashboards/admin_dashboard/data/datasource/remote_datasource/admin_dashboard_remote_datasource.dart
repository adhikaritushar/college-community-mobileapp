import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/data/models/faculty_user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AdminDashboardRemoteDatasource {
  Future<Either<AppErrorHandler, List<FacultyUserModel>>> adminGetDetails({required int employeeId});
}

class AdminDashboardRemoteDatasourceImpl implements AdminDashboardRemoteDatasource {
  final GenericApiHandler apiHandler;

  AdminDashboardRemoteDatasourceImpl({required this.apiHandler});

  @override
  Future<Either<AppErrorHandler, List<FacultyUserModel>>> adminGetDetails({required int employeeId}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.adminProfileURL,
        data: {"employeeId": employeeId},
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
