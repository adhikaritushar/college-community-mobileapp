import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/timetable/domain/entity/time_table_entity.dart';
import 'package:college_community/features/timetable/domain/repository/time_table_repository.dart';

class GetTimeTableUsecase extends UseCase<List<TimetableEntity>, void> {
  final TimeTableRepository repository;

  GetTimeTableUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, List<TimetableEntity>>> call(void parms) async {
    return repository.getTimeTable();
  }
}
