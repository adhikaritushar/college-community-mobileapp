import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/marks/data/models/marks_model.dart';
import 'package:college_community/features/marks/domain/entity/request/add_marks_params.dart';

abstract class MarksRemoteDatasource {
  Future<Either<AppErrorHandler, List<MarksModel>>> getMarks({required int enrollmentNo});
  Future<Either<AppErrorHandler, String>> addMarks({required AddMarksParams params});
}

class MarksRemoteDatasourceImpl implements MarksRemoteDatasource {
  final GenericApiHandler apiHandler;

  MarksRemoteDatasourceImpl({required this.apiHandler});
  @override
  Future<Either<AppErrorHandler, List<MarksModel>>> getMarks({required int enrollmentNo}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.getmarksURL,
        data: {"enrollmentNo": enrollmentNo},
      );

      return response.fold(
        (l) => left(l),
        (r) {
          return right(MarksModel.listfromJson(r['Mark']));
        },
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> addMarks({required AddMarksParams params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.addmarksURL,
        data: {
          "enrollmentNo": params.enrollmentNo,
          if (params.isInternal == true) "internal": params.examType,
          if (params.isInternal == false) "external": params.examType,
        },
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
}
