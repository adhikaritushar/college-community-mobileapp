import 'package:college_community/core/dependency_injection/dependecy_injection.dart';
import 'package:college_community/features/subject/data/datasource/remote_datasource/subject_remote_datasource.dart';
import 'package:college_community/features/subject/data/repository/student_repository_impl.dart';
import 'package:college_community/features/subject/domain/repository/subject_repository.dart';
import 'package:college_community/features/subject/domain/usecase/add_subject_usecase.dart';
import 'package:college_community/features/subject/domain/usecase/delete_subject_usecase.dart';
import 'package:college_community/features/subject/domain/usecase/get_subject_usecase.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';

class SubjectInjection {
  SubjectInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<SubjectRemoteDatasource>(() => SubjectRemoteDatasourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<SubjectRepository>(() => SubjectRepositoryImpl(
          remoteDatasource: locator(),
        ));

    //usecase
    locator.registerLazySingleton<GetSubjectUsecase>(() => GetSubjectUsecase(repository: locator()));
    locator.registerLazySingleton<AddSubjectUsecase>(() => AddSubjectUsecase(repository: locator()));
    locator.registerLazySingleton<DeleteSubjectUsecase>(() => DeleteSubjectUsecase(repository: locator()));

    //cubit
    locator.registerFactory<SubjectCubit>(() => SubjectCubit(
          getSubjectUsecase: locator(),
          addSubjectUsecase: locator(),
          deleteSubjectUsecase: locator(),
        ));
  }
}
