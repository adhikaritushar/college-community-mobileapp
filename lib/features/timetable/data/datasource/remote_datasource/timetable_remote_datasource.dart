import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/timetable/data/models/time_table_model.dart';
import 'package:college_community/features/timetable/domain/entity/request/post_timetable_params.dart';

abstract class TimetableRemoteDatasource {
  Future<Either<AppErrorHandler, List<TimetableModel>>> getTimeTable();
  Future<Either<AppErrorHandler, String>> postTimeTable({required PostTimetableParams params});
}

class TimetableRemoteDatasourceImpl implements TimetableRemoteDatasource {
  final GenericApiHandler apiHandler;

  TimetableRemoteDatasourceImpl({required this.apiHandler});

  @override
  Future<Either<AppErrorHandler, List<TimetableModel>>> getTimeTable() async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.GET,
        path: ApiEndpoint.getTimetableURL,
      );
      return response.fold(
        (l) => left(l),
        (r) => right(TimetableModel.listfromJson(r)),
      );
    } on DioException catch (e) {
      return Left(AppErrorHandler(message: e.message.toString()));
    } catch (e) {
      return Left(AppErrorHandler(message: e.toString()));
    }
  }

  @override
  Future<Either<AppErrorHandler, String>> postTimeTable({required PostTimetableParams params}) async {
    try {
      final response = await apiHandler.request(
        method: ApiMethod.POST,
        path: ApiEndpoint.postTimetableURL,
        options: Options(contentType: 'multipart/form-data'),
        data: FormData.fromMap(
          {
            "branch": params.branch,
            "semester": params.semester,
            "type": "timetable",
            'timetable': await MultipartFile.fromFile(params.timeTableFile.path.toString(), filename: params.timeTableFile.path),
          },
        ),
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
