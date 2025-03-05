import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/entity/faculty_user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AdminDashboardRepository {
  Future<Either<AppErrorHandler, List<FacultyUserEntity>>> adminGetDetail({required int employeeId});
}
