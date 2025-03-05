import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/marks/domain/entity/marks_entity.dart';
import 'package:college_community/features/marks/domain/repository/marks_repository.dart';

class GetMarksUsecase extends UseCase<List<MarksEntity>, int> {
  final MarksRepository repository;

  GetMarksUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, List<MarksEntity>>> call(int parms) async {
    return await repository.getMarks(enrollmentNo: parms);
  }
}
