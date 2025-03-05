import 'package:college_community/core/dependency_injection/dependecy_injection.dart';
import 'package:college_community/features/auth/data/datasource/remote_datasource/auth_remote_datasource.dart';
import 'package:college_community/features/auth/data/repository/auth_repository_impl.dart';
import 'package:college_community/features/auth/domain/repository/auth_repository.dart';
import 'package:college_community/features/auth/domain/usecase/admin_change_password_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/admin_login_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/faculty_change_password_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/faculty_login_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/student_change_password_usecase.dart';
import 'package:college_community/features/auth/domain/usecase/student_login_usecase.dart';
import 'package:college_community/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class AuthInjection {
  AuthInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDatasource: locator()));

    //usecase
    locator.registerLazySingleton<AdminLoginUsecase>(() => AdminLoginUsecase(repository: locator()));
    locator.registerLazySingleton<StudentLoginUsecase>(() => StudentLoginUsecase(repository: locator()));
    locator.registerLazySingleton<FacultyLoginUsecase>(() => FacultyLoginUsecase(repository: locator()));

    locator.registerLazySingleton<StudentChangePasswordUsecase>(() => StudentChangePasswordUsecase(repository: locator()));
    locator.registerLazySingleton<AdminChangePasswordUsecase>(() => AdminChangePasswordUsecase(repository: locator()));
    locator.registerLazySingleton<FacultyChangePasswordUsecase>(() => FacultyChangePasswordUsecase(repository: locator()));

    //cubit
    locator.registerFactory<AuthCubit>(() => AuthCubit(
          adminLoginUsecase: locator(),
          studentLoginUsecase: locator(),
          facultyLoginUsecase: locator(),
          adminChangePasswordUsecase: locator(),
          facultyChangePasswordUsecase: locator(),
          studentChangePasswordUsecase: locator(),
        ));
  }
}
