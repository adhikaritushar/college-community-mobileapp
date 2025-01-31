import 'dart:io';

import 'package:college_community_main/core/error/failure.dart';
import 'package:college_community_main/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';


abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerStudent(AuthEntity student);

  Future<Either<Failure, String>> loginStudent(String username, String password);

  Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, AuthEntity>> getCurrentUser();
}


