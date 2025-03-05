import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/timetable/domain/entity/request/post_timetable_params.dart';
import 'package:college_community/features/timetable/domain/repository/time_table_repository.dart';

class PostTimetableUsecase extends UseCase<String, PostTimetableParams> {
  final TimeTableRepository repository;

  PostTimetableUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(PostTimetableParams parms) async {
    return repository.postTimeTable(params: parms);
  }
}
