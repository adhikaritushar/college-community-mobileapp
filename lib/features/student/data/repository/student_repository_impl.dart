// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/student/data/datasource/remote_datasource/student_remote_datasource.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/domain/entity/student_entity.dart';
import 'package:college_community/features/student/domain/repository/student_repository.dart';
import 'package:dartz/dartz.dart';

class StudentRepositoryImpl extends StudentRepository {
  final StudentRemoteDatasource remoteDatasource;

  StudentRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<AppErrorHandler, List<StudentEntity>>> studentGetDetail({required StudentGetDetilsParams params}) async {
    final result = await remoteDatasource.studentGetDetails(params: params);

    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, StudentEntity>> studentAddDetail({required StudentAddDetailParams params}) async {
    final result = await remoteDatasource.studentAddDetail(params: params);

    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> registerStudent({required LoginParams params}) async {
    final result = await remoteDatasource.registerStudent(params: params);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> updateStudent({required StudentAddDetailParams params}) async {
    final result = await remoteDatasource.updateStudent(params: params);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
