import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/notice/domain/entities/notice_entity.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';

abstract class NoticeRepository {
  Future<Either<AppErrorHandler, List<NoticeEntity>>> getNotice();
  Future<Either<AppErrorHandler, String>> addNotice({required NoticeAddUpdateParams params});
  Future<Either<AppErrorHandler, String>> updateNotice({required NoticeAddUpdateParams params});
  Future<Either<AppErrorHandler, String>> deleteNotice({required String id});
}
