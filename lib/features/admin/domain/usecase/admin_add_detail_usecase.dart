import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/admin/domain/entities/request/admin_add_detail_params.dart';
import 'package:college_community/features/admin/domain/entities/response/admin_entity.dart';
import 'package:college_community/features/admin/domain/repository/admin_repository.dart';
import 'package:dartz/dartz.dart';

class AdminAddDetailUsecase extends UseCase<AdminEntity, AdminAddDetailParams> {
  final AdminRepository repository;

  AdminAddDetailUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, AdminEntity>> call(AdminAddDetailParams parms) async {
    return repository.adminAddDetail(params: parms);
  }
}
