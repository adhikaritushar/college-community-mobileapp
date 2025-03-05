// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/subject/data/datasource/remote_datasource/subject_remote_datasource.dart';
import 'package:college_community/features/subject/domain/entity/request/add_subject_parms.dart';
import 'package:college_community/features/subject/domain/entity/subject_entity.dart';
import 'package:college_community/features/subject/domain/repository/subject_repository.dart';
import 'package:dartz/dartz.dart';

class SubjectRepositoryImpl extends SubjectRepository {
  final SubjectRemoteDatasource remoteDatasource;

  SubjectRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<AppErrorHandler, List<SubjectEntity>>> getSubject() async {
    final result = await remoteDatasource.getSubject();

    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> addSubject({required AddSubjectParms params}) async {
    final result = await remoteDatasource.addSubject(params: params);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }

  @override
  Future<Either<AppErrorHandler, String>> deleteSubject({required String id}) async {
    final result = await remoteDatasource.deleteSubject(id: id);
    return result.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
