import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/admin/domain/entities/request/admin_add_detail_params.dart';
import 'package:college_community/features/admin/domain/repository/admin_repository.dart';
import 'package:dartz/dartz.dart';

class AdminUpdateDetailsUsecase extends UseCase<String, AdminAddDetailParams> {
  final AdminRepository repository;

  AdminUpdateDetailsUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(AdminAddDetailParams parms) async {
    return repository.adminUpdateDetail(params: parms);
  }
}
