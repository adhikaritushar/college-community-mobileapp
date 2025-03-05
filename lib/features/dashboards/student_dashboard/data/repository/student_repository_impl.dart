// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:dartz/dartz.dart';
// import 'package:college_community/core/errors_handler/error_handler.dart';
// import 'package:college_community/features/student_dashboard/data/datasource/local_datasource.dart/student_local_datasource.dart';
// import 'package:college_community/features/student_dashboard/data/datasource/remote_datasource/student_datasource.dart';
// import 'package:college_community/features/student_dashboard/domain/entity/note_entity.dart';
// import 'package:college_community/features/student_dashboard/domain/repository/student_dashboard_repository.dart';

// class StudentRepositoryImpl extends StudentRepository {
//   final StudentRemoteDatasource remoteDatasource;
//   final StudentLocalDatasource localDatasource;

//   StudentRepositoryImpl({
//     required this.remoteDatasource,
//     required this.localDatasource,
//   });

//   @override
//   Future<Either<AppErrorHandler, List<NoticeEntity>>> studentGetNotice() async {
//     final result = await remoteDatasource.studentGetNotice();
//     return result.fold(
//       (l) => left(l),
//       (r) async {
//         return right(r);
//       },
//     );
//   }
// }
