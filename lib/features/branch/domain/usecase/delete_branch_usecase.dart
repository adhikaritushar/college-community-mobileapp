import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/branch/domain/repository/branch_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteBranchUsecase extends UseCase<String, String> {
  final BranchRepository repository;

  DeleteBranchUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(String parms) async {
    return repository.deleteBranch(id: parms);
  }
}
