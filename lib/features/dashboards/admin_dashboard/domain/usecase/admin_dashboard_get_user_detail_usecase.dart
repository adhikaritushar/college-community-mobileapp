import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/dashboards/admin_dashboard/domain/repository/admin_dashboard_repository.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/entity/faculty_user_entity.dart';
import 'package:dartz/dartz.dart';

class AdminDashboardGetUserDetailUsecase extends UseCase<List<FacultyUserEntity>, int> {
  final AdminDashboardRepository repository;

  AdminDashboardGetUserDetailUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, List<FacultyUserEntity>>> call(int parms) async {
    return repository.adminGetDetail(employeeId: parms);
  }
}
