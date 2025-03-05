import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/marks/domain/entity/marks_entity.dart';
import 'package:college_community/features/marks/domain/entity/request/add_marks_params.dart';

abstract class MarksRepository {
  Future<Either<AppErrorHandler, List<MarksEntity>>> getMarks({required int enrollmentNo});
  Future<Either<AppErrorHandler, String>> addMarks({required AddMarksParams params});
}
