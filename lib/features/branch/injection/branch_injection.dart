import 'package:college_community/core/dependency_injection/dependecy_injection.dart';
import 'package:college_community/features/branch/data/datasource/remote_datasource/branch_remote_datasource.dart';
import 'package:college_community/features/branch/data/repository/branch_repository_impl.dart';
import 'package:college_community/features/branch/domain/repository/branch_repository.dart';
import 'package:college_community/features/branch/domain/usecase/add_branch_usecase.dart';
import 'package:college_community/features/branch/domain/usecase/delete_branch_usecase.dart';
import 'package:college_community/features/branch/domain/usecase/get_branch_usecase.dart';
import 'package:college_community/features/branch/presentation/view_model/cubit/branch_cubit.dart';

class BranchInjection {
  BranchInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<BranchRemoteDatasource>(() => BranchRemoteDatasourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<BranchRepository>(() => BranchRepositoryImpl(remoteDatasource: locator()));

    //usecase
    locator.registerLazySingleton<GetBranchUsecase>(() => GetBranchUsecase(repository: locator()));
    locator.registerLazySingleton<AddBranchUsecase>(() => AddBranchUsecase(repository: locator()));
    locator.registerLazySingleton<DeleteBranchUsecase>(() => DeleteBranchUsecase(repository: locator()));

    //cubit
    locator.registerFactory<BranchCubit>(() => BranchCubit(
          getBranchUsecase: locator(),
          addBranchUsecase: locator(),
          deleteBranchUsecase: locator(),
        ));
  }
}
