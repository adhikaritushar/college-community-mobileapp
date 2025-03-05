import 'package:college_community/core/dependency_injection/dependecy_injection.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/data/datasource/remote_datasource/faculty_remote_datasource.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/data/repository/faculty_repository_impl.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/repository/faculty_dashboard_repository.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/domain/usecase/faculty_get_user_detail_usecase.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view_model/cubit/faculty_dashboard_cubit.dart';

class FacultyDashboardInjection {
  FacultyDashboardInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<FacultyRemoteDatasource>(() => FacultyRemoteDatasourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<FacultyDashboardRepository>(() => FacultyDashboardRepositoryImpl(remoteDatasource: locator()));

    //usecase
    locator.registerLazySingleton<FacultyGetUserDetailUsecase>(() => FacultyGetUserDetailUsecase(repository: locator()));

    //cubit
    locator.registerFactory<FacultyDashboardCubit>(() => FacultyDashboardCubit(
          facultyGetUserDetailUsecase: locator(),
        ));
  }
}
