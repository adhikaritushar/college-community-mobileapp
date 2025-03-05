import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/entity/faculty_user_entity.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/repository/faculty_dashboard_repository.dart';

class FacultyGetUserDetailUsecase extends UseCase<List<FacultyUserEntity>, int> {
  final FacultyDashboardRepository repository;

  FacultyGetUserDetailUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, List<FacultyUserEntity>>> call(int parms) async {
    return repository.facultyGetDetail(enrollmentNo: parms);
  }
}
