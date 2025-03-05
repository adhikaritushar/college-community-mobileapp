import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/admin/data/datasource/remote_datasource/admin_remote_datasource.dart';
import 'package:college_community/features/admin/domain/entities/request/admin_add_detail_params.dart';
import 'package:college_community/features/admin/domain/entities/response/admin_entity.dart';
import 'package:college_community/features/admin/domain/repository/admin_repository.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:dartz/dartz.dart';

class AdminRepositoryImpl extends AdminRepository {
  final AdminRemoteDatasource remoteDatasource;

  AdminRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<AppErrorHandler, AdminEntity>> adminAddDetail({required AdminAddDetailParams params}) async {
    final result = await remoteDatasource.adminAddDetail(params: params);

    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, List<AdminEntity>>> adminGetDetail({required String employeeID}) async {
    final result = await remoteDatasource.adminGetDetail(employeeID: employeeID);

    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> adminRegister({required LoginParams loginParams}) async {
    final result = await remoteDatasource.adminRegister(loginParams: loginParams);

    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> adminUpdateDetail({required AdminAddDetailParams params}) async {
    final result = await remoteDatasource.adminUpdateDetail(params: params);

    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
