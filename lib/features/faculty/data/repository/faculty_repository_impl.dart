// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/faculty/data/datasource/remote_datasource/faculty_remote_datasource.dart';
import 'package:college_community/features/faculty/domain/entity/faculty_entity.dart';
import 'package:college_community/features/faculty/domain/entity/reqeust/faculty_add_update_params.dart';
import 'package:college_community/features/faculty/domain/repository/faculty_repository.dart';
import 'package:dartz/dartz.dart';

class FacultyRepositoryImpl extends FacultyRepository {
  final FacultyRemoteDatasource remoteDatasource;

  FacultyRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<AppErrorHandler, FacultyEntity>> addfacultyDetail({required FacultyAddUpdateParams params}) async {
    final result = await remoteDatasource.addfacultyDetail(params: params);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, List<FacultyEntity>>> getFaculty({required String employeeId}) async {
    final result = await remoteDatasource.getFaculty(employeeId: employeeId);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> registerfaculty({required LoginParams params}) async {
    final result = await remoteDatasource.registerfaculty(params: params);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> updatefaculty({required FacultyAddUpdateParams params}) async {
    final result = await remoteDatasource.updatefaculty(params: params);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
