import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/entity/faculty_user_entity.dart';

abstract class FacultyDashboardRepository {
  Future<Either<AppErrorHandler, List<FacultyUserEntity>>> facultyGetDetail({required int enrollmentNo});
}
