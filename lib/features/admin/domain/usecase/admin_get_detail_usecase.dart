import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/admin/domain/entities/response/admin_entity.dart';
import 'package:college_community/features/admin/domain/repository/admin_repository.dart';
import 'package:dartz/dartz.dart';

class AdminGetDetailUsecase extends UseCase<List<AdminEntity>, String> {
  final AdminRepository repository;

  AdminGetDetailUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, List<AdminEntity>>> call(String parms) async {
    return repository.adminGetDetail(employeeID: parms);
  }
}
