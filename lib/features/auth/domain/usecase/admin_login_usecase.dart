import 'package:dartz/dartz.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:college_community/features/auth/domain/repository/auth_repository.dart';

class AdminLoginUsecase extends UseCase<LoginResponseEntity, LoginParams> {
  final AuthRepository repository;

  AdminLoginUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, LoginResponseEntity>> call(LoginParams parms) async {
    return repository.adminLogin(parms);
  }
}
