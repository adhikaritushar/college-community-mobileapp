import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/admin/domain/entities/request/admin_add_detail_params.dart';
import 'package:college_community/features/admin/domain/entities/response/admin_entity.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:dartz/dartz.dart';

abstract class AdminRepository {
  Future<Either<AppErrorHandler, AdminEntity>> adminAddDetail({required AdminAddDetailParams params});
  Future<Either<AppErrorHandler, String>> adminRegister({required LoginParams loginParams});
  Future<Either<AppErrorHandler, List<AdminEntity>>> adminGetDetail({required String employeeID});
  Future<Either<AppErrorHandler, String>> adminUpdateDetail({required AdminAddDetailParams params});
}
