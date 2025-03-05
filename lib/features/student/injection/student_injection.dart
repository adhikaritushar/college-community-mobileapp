import 'package:college_community/features/student/data/datasource/remote_datasource/student_remote_datasource.dart';
import 'package:college_community/features/student/data/repository/student_repository_impl.dart';
import 'package:college_community/features/student/domain/repository/student_repository.dart';
import 'package:college_community/features/student/domain/usecase/register_student_usecase.dart';
import 'package:college_community/features/student/domain/usecase/student_add_detail_usecase.dart';
import 'package:college_community/features/student/domain/usecase/student_get_detail_usecase.dart';
import 'package:college_community/features/student/domain/usecase/update_student_usecase.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';

import '../../../core/dependency_injection/dependecy_injection.dart';

class StudentInjection {
  StudentInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<StudentRemoteDatasource>(() => StudentRemoteDatasourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<StudentRepository>(() => StudentRepositoryImpl(
          remoteDatasource: locator(),
        ));

    //usecase
    locator.registerLazySingleton<StudentGetDetailUsecase>(() => StudentGetDetailUsecase(repository: locator()));
    locator.registerLazySingleton<StudentAddDetailUsecase>(() => StudentAddDetailUsecase(repository: locator()));
    locator.registerLazySingleton<RegisterStudentUsecase>(() => RegisterStudentUsecase(repository: locator()));
    locator.registerLazySingleton<UpdateStudentUsecase>(() => UpdateStudentUsecase(repository: locator()));

    //cubit
    locator.registerFactory<StudentCubit>(() => StudentCubit(
          studentAddDetailUsecase: locator(),
          registerStudentUsecase: locator(),
          studentGetDetailUsecase: locator(),
          updateStudentUsecase: locator(),
        ));
  }
}
