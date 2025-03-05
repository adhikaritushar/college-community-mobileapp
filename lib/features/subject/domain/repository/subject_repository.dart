import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/subject/domain/entity/request/add_subject_parms.dart';
import 'package:college_community/features/subject/domain/entity/subject_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SubjectRepository {
  Future<Either<AppErrorHandler, List<SubjectEntity>>> getSubject();
  Future<Either<AppErrorHandler, String>> addSubject({required AddSubjectParms params});
  Future<Either<AppErrorHandler, String>> deleteSubject({required String id});
}
