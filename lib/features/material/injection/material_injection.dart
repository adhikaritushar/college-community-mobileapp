import 'package:college_community/features/material/data/datasource/remote_datasource/material_remote_datasource.dart';
import 'package:college_community/features/material/data/repository/material_repsoitory_impl.dart';
import 'package:college_community/features/material/domain/repository/material_repository.dart';
import 'package:college_community/features/material/domain/usecase/add_material_usecase.dart';
import 'package:college_community/features/material/domain/usecase/get_material_usecase.dart';
import 'package:college_community/features/material/presentation/view_model.dart/cubit/material_cubit.dart';

import '../../../core/dependency_injection/dependecy_injection.dart';

class MaterialInjection {
  MaterialInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<MaterialRemoteDatasource>(() => MaterialRemoteDatasourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<MaterialRepository>(() => MaterialRepsoitoryImpl(
          remoteDatasource: locator(),
        ));

    //usecase
    locator.registerLazySingleton<GetMaterialUsecase>(() => GetMaterialUsecase(repository: locator()));
    locator.registerLazySingleton<AddMaterialUsecase>(() => AddMaterialUsecase(repository: locator()));

    //cubit
    locator.registerFactory<MaterialsCubit>(() => MaterialsCubit(
          getMaterialUsecase: locator(),
          addMaterialUsecase: locator(),
        ));
  }
}
