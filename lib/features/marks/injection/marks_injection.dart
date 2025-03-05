import 'package:college_community/features/marks/data/marks_datasource/remote_datasource/marks_remote_datasource.dart';
import 'package:college_community/features/marks/data/repository/marks_repsoitory_impl.dart';
import 'package:college_community/features/marks/domain/repository/marks_repository.dart';
import 'package:college_community/features/marks/domain/usecase/add_marks_usecase.dart';
import 'package:college_community/features/marks/domain/usecase/get_marks_usecase.dart';
import 'package:college_community/features/marks/presentation/view_model.dart/cubit/marks_cubit.dart';

import '../../../core/dependency_injection/dependecy_injection.dart';

class MarksInjection {
  MarksInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<MarksRemoteDatasource>(() => MarksRemoteDatasourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<MarksRepository>(() => MarksRepsoitoryImpl(
          remoteDatasource: locator(),
        ));

    //usecase
    locator.registerLazySingleton<GetMarksUsecase>(() => GetMarksUsecase(repository: locator()));
    locator.registerLazySingleton<AddMarksUsecase>(() => AddMarksUsecase(repository: locator()));

    //cubit
    locator.registerFactory<MarksCubit>(() => MarksCubit(
          getMarksUsecase: locator(),
          addMarksUsecase: locator(),
        ));
  }
}
