import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/marks/data/marks_datasource/remote_datasource/marks_remote_datasource.dart';
import 'package:college_community/features/marks/domain/entity/marks_entity.dart';
import 'package:college_community/features/marks/domain/entity/request/add_marks_params.dart';
import 'package:college_community/features/marks/domain/repository/marks_repository.dart';

class MarksRepsoitoryImpl extends MarksRepository {
  final MarksRemoteDatasource remoteDatasource;

  MarksRepsoitoryImpl({required this.remoteDatasource});

  @override
  Future<Either<AppErrorHandler, String>> addMarks({required AddMarksParams params}) async {
    final result = await remoteDatasource.addMarks(params: params);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, List<MarksEntity>>> getMarks({required int enrollmentNo}) async {
    final result = await remoteDatasource.getMarks(enrollmentNo: enrollmentNo);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
