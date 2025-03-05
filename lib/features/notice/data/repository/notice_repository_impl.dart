import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/notice/data/datasource/remote_datasourcce/notice_remote_datasource.dart';
import 'package:college_community/features/notice/domain/entities/notice_entity.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';
import 'package:college_community/features/notice/domain/repository/notice_repository.dart';

class NoticeRepositoryImpl extends NoticeRepository {
  final NoticeRemoteDataSource remoteDataSource;

  NoticeRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<AppErrorHandler, String>> addNotice({required NoticeAddUpdateParams params}) async {
    final result = await remoteDataSource.addNotice(params: params);
    return result.fold(
      (l) => left(l),
      (r) async {
        return right(r);
      },
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> deleteNotice({required String id}) async {
    final result = await remoteDataSource.deleteNotice(id: id);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, List<NoticeEntity>>> getNotice() async {
    final result = await remoteDataSource.getNotice();
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> updateNotice({required NoticeAddUpdateParams params}) async {
    final result = await remoteDataSource.updateNotice(params: params);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
