import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/domain/entity/student_entity.dart';
import 'package:dartz/dartz.dart';

abstract class StudentRepository {
  Future<Either<AppErrorHandler, List<StudentEntity>>> studentGetDetail({required StudentGetDetilsParams params});
  Future<Either<AppErrorHandler, StudentEntity>> studentAddDetail({required StudentAddDetailParams params});
  Future<Either<AppErrorHandler, String>> registerStudent({required LoginParams params});
  Future<Either<AppErrorHandler, String>> updateStudent({required StudentAddDetailParams params});
}
