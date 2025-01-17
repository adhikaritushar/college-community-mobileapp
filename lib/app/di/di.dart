import 'package:college_community_main/features/auth/data/data_source/student_local_datasource.dart';
import 'package:college_community_main/features/auth/data/repository/student_local_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:college_community_main/features/auth/data/repository/auth_repository.dart';
import 'package:college_community_main/features/auth/domain/use_case/login_use_case.dart';
import 'package:college_community_main/features/auth/domain/use_case/register_use_case.dart';
import 'package:college_community_main/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:college_community_main/features/auth/presentation/view_model/register/register_bloc.dart';
import 'package:college_community_main/features/onboarding/presentation/view_model/onboard_cubit.dart';
import 'package:college_community_main/features/splash/presentation/view_model/splashscreen_cubit.dart';
import 'package:college_community_main/features/dashboard/presentation/view/dashboard.dart';
import 'package:college_community_main/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:college_community_main/features/auth/data/repository/auth_local_repository.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  _initAuthDependencies();
  _initOnboardingDependencies();
  _initSplashDependencies();
}
// clean

_initAuthDependencies() {
  // Register Auth Repository and Use Cases
  getIt.registerLazySingleton<StudentLocalDataSource>(() => StudentLocalDataSource());
  getIt.registerLazySingleton<StudentLocalRepository>(
    () => StudentLocalRepository(StudentLocalDataSource: getIt<StudentLocalDataSource>()),
  );
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: getIt<AuthLocalRepository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepository: getIt<AuthLocalRepository>()),
  );

  // Register BLoCs
  getIt.registerFactory<LoginBloc>(() => LoginBloc(loginUseCase: getIt<LoginUseCase>()));
  getIt.registerFactory<RegisterBloc>(() => RegisterBloc(registerUseCase: getIt<RegisterUseCase>()));
}

_initOnboardingDependencies() {
  // Register Onboarding Cubit
  getIt.registerFactory<OnboardCubit>(() => OnboardCubit());
}

_initSplashDependencies() {
  // Register Splashscreen Cubit
  getIt.registerFactory<SplashscreenCubit>(() => SplashscreenCubit());
}
