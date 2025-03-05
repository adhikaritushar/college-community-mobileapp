import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/branch/domain/entity/branch_entity.dart';
import 'package:college_community/features/branch/domain/repository/branch_repository.dart';

class GetBranchUsecase extends UseCase<List<BranchEntity>, void> {
  final BranchRepository repository;

  GetBranchUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, List<BranchEntity>>> call(void parms) async {
    return repository.getBranch();
  }
}
