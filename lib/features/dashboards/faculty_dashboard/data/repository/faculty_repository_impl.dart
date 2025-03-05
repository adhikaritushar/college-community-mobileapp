// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/data/datasource/remote_datasource/faculty_remote_datasource.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/entity/faculty_user_entity.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/repository/faculty_dashboard_repository.dart';

class FacultyDashboardRepositoryImpl extends FacultyDashboardRepository {
  final FacultyRemoteDatasource remoteDatasource;

  FacultyDashboardRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<AppErrorHandler, List<FacultyUserEntity>>> facultyGetDetail({required int enrollmentNo}) async {
    final result = await remoteDatasource.facultyGetDetails(enrollmentNo: enrollmentNo);

    return result.fold(
      (l) => left(l),
      (r) async {
        return right(r.map((e) => e).toList());
      },
    );
  }
}
