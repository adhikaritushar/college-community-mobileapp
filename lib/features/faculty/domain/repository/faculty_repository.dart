import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/faculty/domain/entity/faculty_entity.dart';
import 'package:college_community/features/faculty/domain/entity/reqeust/faculty_add_update_params.dart';
import 'package:dartz/dartz.dart';

abstract class FacultyRepository {
  Future<Either<AppErrorHandler, List<FacultyEntity>>> getFaculty({required String employeeId});
  Future<Either<AppErrorHandler, FacultyEntity>> addfacultyDetail({required FacultyAddUpdateParams params});
  Future<Either<AppErrorHandler, String>> registerfaculty({required LoginParams params});
  Future<Either<AppErrorHandler, String>> updatefaculty({required FacultyAddUpdateParams params});
}
