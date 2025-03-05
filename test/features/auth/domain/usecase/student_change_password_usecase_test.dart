import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/auth/domain/repository/auth_repository.dart';
import 'package:college_community/features/auth/domain/usecase/student_change_password_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock the AuthRepository
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late StudentChangePasswordUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = StudentChangePasswordUsecase(repository: mockAuthRepository);
  });

  final tLoginParams = LoginParams(loginID: 'student@example.com', password: 'newpassword123');

  test(
    'should call studentChangePassword on the repository and return success',
    () async {
      // Arrange
      when(mockAuthRepository.studentChangePassword(tLoginParams)).thenAnswer((_) async => const Right("Password changed successfully"));

      // Act
      final result = await usecase(tLoginParams);

      // Assert
      expect(result, const Right("Password changed successfully"));
      verify(mockAuthRepository.studentChangePassword(tLoginParams));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test(
    'should return an AppErrorHandler when the repository call fails',
    () async {
      // Arrange
      final tError = AppErrorHandler(message: 'Failed to change password');
      when(mockAuthRepository.studentChangePassword(tLoginParams)).thenAnswer((_) async => Left(tError));

      // Act
      final result = await usecase(tLoginParams);

      // Assert
      expect(result, Left(tError));
      verify(mockAuthRepository.studentChangePassword(tLoginParams));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
