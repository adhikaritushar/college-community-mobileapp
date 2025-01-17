import 'package:college_community_main/core/error/failure.dart';
import 'package:college_community_main/features/auth/domain/entity/student_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class IStudentRepository {
  Future<Either<Failure, void>> createStudent(StudentEntity studentEntity);
  Future<Either<Failure, List<StudentEntity>>> getAllStudents();
  Future<Either<Failure, void>> deleteStudent(int id);
  Future<Either<Failure, StudentEntity?>> login(
      String username, String password);
}
