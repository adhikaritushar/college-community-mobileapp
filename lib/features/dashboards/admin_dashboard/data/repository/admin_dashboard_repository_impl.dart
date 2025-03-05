import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/admin_dashboard/data/datasource/remote_datasource/admin_dashboard_remote_datasource.dart';
import 'package:college_community/features/dashboards/admin_dashboard/domain/repository/admin_dashboard_repository.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/entity/faculty_user_entity.dart';
import 'package:dartz/dartz.dart';

class AdminDashboardRepositoryImpl extends AdminDashboardRepository {
  final AdminDashboardRemoteDatasource remoteDatasource;

  AdminDashboardRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<AppErrorHandler, List<FacultyUserEntity>>> adminGetDetail({required int employeeId}) async {
    final result = await remoteDatasource.adminGetDetails(employeeId: employeeId);

    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
