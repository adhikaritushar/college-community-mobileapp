import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/branch/domain/entity/branch_entity.dart';

abstract class BranchRepository {
  Future<Either<AppErrorHandler, List<BranchEntity>>> getBranch();
  Future<Either<AppErrorHandler, String>> addBranch({required String branchName});
  Future<Either<AppErrorHandler, String>> deleteBranch({required String id});
}
