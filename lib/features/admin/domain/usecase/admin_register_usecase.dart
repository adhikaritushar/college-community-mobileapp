import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/usecase/usecase.dart';
import 'package:college_community/features/admin/domain/repository/admin_repository.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:dartz/dartz.dart';

class AdminRegisterUsecase extends UseCase<String, LoginParams> {
  final AdminRepository repository;

  AdminRegisterUsecase({required this.repository});
  @override
  Future<Either<AppErrorHandler, String>> call(LoginParams parms) async {
    return repository.adminRegister(loginParams: parms);
  }
}
