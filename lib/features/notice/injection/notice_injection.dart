import 'package:college_community/core/dependency_injection/dependecy_injection.dart';
import 'package:college_community/features/notice/data/datasource/remote_datasourcce/notice_remote_datasource.dart';
import 'package:college_community/features/notice/data/repository/notice_repository_impl.dart';
import 'package:college_community/features/notice/domain/repository/notice_repository.dart';
import 'package:college_community/features/notice/domain/usecase/add_notice_usecase.dart';
import 'package:college_community/features/notice/domain/usecase/delete_notice_usecase.dart';
import 'package:college_community/features/notice/domain/usecase/get_notice_usecase.dart';
import 'package:college_community/features/notice/domain/usecase/update_notice_usecase.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';

class NoticeInjection {
  NoticeInjection._();

  static register() {
    //datasource
    locator.registerLazySingleton<NoticeRemoteDataSource>(() => NoticeRemoteDataSourceImpl(apiHandler: locator()));

    //repository
    locator.registerLazySingleton<NoticeRepository>(() => NoticeRepositoryImpl(remoteDataSource: locator()));

    //usecase
    locator.registerLazySingleton<AddNoticeUsecase>(() => AddNoticeUsecase(repository: locator()));
    locator.registerLazySingleton<UpdateNoticeUsecase>(() => UpdateNoticeUsecase(repository: locator()));
    locator.registerLazySingleton<DeleteNoticeUsecase>(() => DeleteNoticeUsecase(repository: locator()));
    locator.registerLazySingleton<GetNoticeUsecase>(() => GetNoticeUsecase(repository: locator()));

    //cubit
    locator.registerFactory<NoticeCubit>(() => NoticeCubit(
          getNoticeUsecase: locator(),
          addNoticeUsecase: locator(),
          deleteNoticeUsecase: locator(),
          updateNoticeUsecase: locator(),
        ));
  }
}
