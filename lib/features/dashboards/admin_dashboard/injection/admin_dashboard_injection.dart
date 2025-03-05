import 'package:college_community/core/dependency_injection/dependecy_injection.dart';
import 'package:college_community/features/dashboards/admin_dashboard/data/datasource/remote_datasource/admin_dashboard_remote_datasource.dart';
import 'package:college_community/features/dashboards/admin_dashboard/data/repository/admin_dashboard_repository_impl.dart';
import 'package:college_community/features/dashboards/admin_dashboard/domain/repository/admin_dashboard_repository.dart';
import 'package:college_community/features/dashboards/admin_dashboard/domain/usecase/admin_dashboard_get_user_detail_usecase.dart';
import 'package:college_community/features/dashboards/admin_dashboard/presentation/view_model/cubit/admin_dashboard_cubit.dart';

class AdminDashboardInjection {
  AdminDashboardInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<AdminDashboardRemoteDatasource>(() => AdminDashboardRemoteDatasourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<AdminDashboardRepository>(() => AdminDashboardRepositoryImpl(remoteDatasource: locator()));

    //usecase
    locator.registerLazySingleton<AdminDashboardGetUserDetailUsecase>(() => AdminDashboardGetUserDetailUsecase(repository: locator()));

    //cubit
    locator.registerFactory<AdminDashboardCubit>(() => AdminDashboardCubit(
          adminDashboardGetUserDetailUsecase: locator(),
        ));
  }
}
