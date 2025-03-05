// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/timetable/data/datasource/remote_datasource/timetable_remote_datasource.dart';
import 'package:college_community/features/timetable/domain/entity/request/post_timetable_params.dart';
import 'package:college_community/features/timetable/domain/entity/time_table_entity.dart';
import 'package:college_community/features/timetable/domain/repository/time_table_repository.dart';

class TimetableRepositoryImpl extends TimeTableRepository {
  final TimetableRemoteDatasource remoteDatasource;

  TimetableRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<AppErrorHandler, List<TimetableEntity>>> getTimeTable() async {
    final result = await remoteDatasource.getTimeTable();
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> postTimeTable({required PostTimetableParams params}) async {
    final result = await remoteDatasource.postTimeTable(params: params);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
