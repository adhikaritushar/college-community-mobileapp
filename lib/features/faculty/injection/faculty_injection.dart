import 'package:college_community/features/faculty/data/datasource/remote_datasource/faculty_remote_datasource.dart';
import 'package:college_community/features/faculty/data/repository/faculty_repository_impl.dart';
import 'package:college_community/features/faculty/domain/repository/faculty_repository.dart';
import 'package:college_community/features/faculty/domain/usecase/faculty_add_detail_usecase.dart';
import 'package:college_community/features/faculty/domain/usecase/faculty_get_usecase.dart';
import 'package:college_community/features/faculty/domain/usecase/register_faculty_usecase.dart';
import 'package:college_community/features/faculty/domain/usecase/update_faculty_usecase.dart';
import 'package:college_community/features/faculty/presentation/view_model/cubit/faculty_cubit.dart';

import '../../../core/dependency_injection/dependecy_injection.dart';

class FacultyInjection {
  FacultyInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<FacultyRemoteDatasource>(() => FacultyRemoteDatasourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<FacultyRepository>(() => FacultyRepositoryImpl(
          remoteDatasource: locator(),
        ));

    //usecase
    locator.registerLazySingleton<FacultyAddDetailUsecase>(() => FacultyAddDetailUsecase(repository: locator()));
    locator.registerLazySingleton<FacultyGetUsecase>(() => FacultyGetUsecase(repository: locator()));
    locator.registerLazySingleton<RegisterFacultyUsecase>(() => RegisterFacultyUsecase(repository: locator()));
    locator.registerLazySingleton<UpdateFacultyUsecase>(() => UpdateFacultyUsecase(repository: locator()));

    //cubit
    locator.registerFactory<FacultyCubit>(() => FacultyCubit(
          facultyAddDetailUsecase: locator(),
          facultyGetUsecase: locator(),
          registerFacultyUsecase: locator(),
          updateFacultyUsecase: locator(),
        ));
  }
}
