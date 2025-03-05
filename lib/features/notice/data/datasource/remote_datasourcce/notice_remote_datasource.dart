import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/notice/data/models/notice_model.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';

abstract class NoticeRemoteDataSource {
  Future<Either<AppErrorHandler, List<NoticeModel>>> getNotice();
  Future<Either<AppErrorHandler, String>> addNotice({required NoticeAddUpdateParams params});
  Future<Either<AppErrorHandler, String>> updateNotice({required NoticeAddUpdateParams params});
  Future<Either<AppErrorHandler, String>> deleteNotice({required String id});
}

class NoticeRemoteDataSourceImpl implements NoticeRemoteDataSource {
  final GenericApiHandler apiHandler;

  NoticeRemoteDataSourceImpl({required this.apiHandler});

  @override
  Future<Either<AppErrorHandler, List<NoticeModel>>> getNotice() async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.GET,
        path: ApiEndpoint.getNoticeURL,
      );
      return response.fold(
        (l) => left(l),
        (r) => right(NoticeModel.listfromJson(r['notice'])),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> addNotice({required NoticeAddUpdateParams params}) async {
    try {
      final response = await apiHandler.request(method: ApiMethod.POST, path: ApiEndpoint.addNoticeURL, data: {
        "description": params.description,
        "link": params.link,
        "title": params.title,
        "type": params.type,
      });
      return response.fold(
        (l) => left(l),
        (r) => right(r['message']),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> deleteNotice({required String id}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.DELETE,
        path: "${ApiEndpoint.deleteNoticeURL}/$id",
      );
      return response.fold(
        (l) => left(l),
        (r) => right(r['message']),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> updateNotice({required NoticeAddUpdateParams params}) async {
    try {
      final response = await apiHandler.request(method: ApiMethod.PUT, path: "${ApiEndpoint.updateNoticeURL}/${params.id}", data: {
        "description": params.description,
        "link": params.link,
        "title": params.title,
        "type": params.type,
      });
      return response.fold(
        (l) => left(l),
        (r) => right(r['message']),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }
}
