import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/timetable/domain/entity/request/post_timetable_params.dart';
import 'package:college_community/features/timetable/domain/entity/time_table_entity.dart';

abstract class TimeTableRepository {
  Future<Either<AppErrorHandler, String>> postTimeTable({required PostTimetableParams params});
  Future<Either<AppErrorHandler, List<TimetableEntity>>> getTimeTable();
}
