import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/branch/data/datasource/remote_datasource/branch_remote_datasource.dart';
import 'package:college_community/features/branch/domain/entity/branch_entity.dart';
import 'package:college_community/features/branch/domain/repository/branch_repository.dart';
import 'package:dartz/dartz.dart';

class BranchRepositoryImpl extends BranchRepository {
  final BranchRemoteDatasource remoteDatasource;

  BranchRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<AppErrorHandler, List<BranchEntity>>> getBranch() async {
    final result = await remoteDatasource.getBranch();

    return result.fold(
      (l) => left(l),
      (r) => right(r.map((e) => e).toList()),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> addBranch({required String branchName}) async {
    final result = await remoteDatasource.addBranch(branchName: branchName);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> deleteBranch({required String id}) async {
    final result = await remoteDatasource.deleteBranch(id: id);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
