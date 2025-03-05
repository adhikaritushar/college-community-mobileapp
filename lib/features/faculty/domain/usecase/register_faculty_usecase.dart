import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/faculty/domain/repository/faculty_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterFacultyUsecase extends UseCase<String, LoginParams> {
  final FacultyRepository repository;

  RegisterFacultyUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(LoginParams parms) async {
    return repository.registerfaculty(params: parms);
  }
}
