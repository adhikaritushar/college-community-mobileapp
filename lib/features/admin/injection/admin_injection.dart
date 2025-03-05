import 'package:college_community/core/dependency_injection/dependecy_injection.dart';
import 'package:college_community/features/admin/data/datasource/remote_datasource/admin_remote_datasource.dart';
import 'package:college_community/features/admin/data/repository/admin_repository_impl.dart';
import 'package:college_community/features/admin/domain/repository/admin_repository.dart';
import 'package:college_community/features/admin/domain/usecase/admin_add_detail_usecase.dart';
import 'package:college_community/features/admin/domain/usecase/admin_get_detail_usecase.dart';
import 'package:college_community/features/admin/domain/usecase/admin_register_usecase.dart';
import 'package:college_community/features/admin/domain/usecase/admin_update_details_usecase.dart';
import 'package:college_community/features/admin/presentation/view_model.dart/cubit/admin_cubit.dart';

class AdminInjection {
  AdminInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<AdminRemoteDatasource>(() => AdminRemoteDatasourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<AdminRepository>(() => AdminRepositoryImpl(remoteDatasource: locator()));

    //usecase
    locator.registerLazySingleton<AdminAddDetailUsecase>(() => AdminAddDetailUsecase(repository: locator()));
    locator.registerLazySingleton<AdminGetDetailUsecase>(() => AdminGetDetailUsecase(repository: locator()));
    locator.registerLazySingleton<AdminRegisterUsecase>(() => AdminRegisterUsecase(repository: locator()));
    locator.registerLazySingleton<AdminUpdateDetailsUsecase>(() => AdminUpdateDetailsUsecase(repository: locator()));

    //cubit
    locator.registerFactory<AdminCubit>(() => AdminCubit(
          adminAddDetailUsecase: locator(),
          adminGetDetailUsecase: locator(),
          adminRegisterUsecase: locator(),
          adminUpdateDetailsUsecase: locator(),
        ));
  }
}
