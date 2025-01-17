import 'package:college_community_main/app/usecase/usecase.dart';
import 'package:college_community_main/core/error/failure.dart';
import 'package:college_community_main/features/auth/domain/entity/student_entity.dart';
import 'package:college_community_main/features/auth/domain/repository/student_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginStudentParams extends Equatable {
  final String username;
  final String password;

  const LoginStudentParams({required this.username, required this.password});

  @override
  List<Object?> get props => [username];
}

class LoginStudentUsecase
    implements UsecaseWithParams<StudentEntity?, LoginStudentParams> {
  final IStudentRepository _studentRepository;

  LoginStudentUsecase({required IStudentRepository studentRepository})
      : _studentRepository = studentRepository;
  @override
  Future<Either<Failure, StudentEntity?>> call(
      LoginStudentParams params) async {
    return await _studentRepository.login(params.username, params.password);
  }
}
