import 'package:college_community/core/dependency_injection/dependecy_injection.dart';
import 'package:college_community/features/timetable/data/datasource/remote_datasource/timetable_remote_datasource.dart';
import 'package:college_community/features/timetable/data/repository/timetable_repository_impl.dart';
import 'package:college_community/features/timetable/domain/repository/time_table_repository.dart';
import 'package:college_community/features/timetable/domain/usecase/get_timetable_usecase.dart';
import 'package:college_community/features/timetable/domain/usecase/post_timetable_usecase.dart';
import 'package:college_community/features/timetable/presentation/view_model/cubit/timetable_cubit.dart';

class TimetableInjection {
  TimetableInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<TimetableRemoteDatasource>(() => TimetableRemoteDatasourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<TimeTableRepository>(() => TimetableRepositoryImpl(
          remoteDatasource: locator(),
        ));

    //usecase
    locator.registerLazySingleton<GetTimeTableUsecase>(() => GetTimeTableUsecase(repository: locator()));
    locator.registerLazySingleton<PostTimetableUsecase>(() => PostTimetableUsecase(repository: locator()));

    //cubit
    locator.registerFactory<TimetableCubit>(() => TimetableCubit(
          getTimeTableUsecase: locator(),
          postTimetableUsecase: locator(),
        ));
  }
}
