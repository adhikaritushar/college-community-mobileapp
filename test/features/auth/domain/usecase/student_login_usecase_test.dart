import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:college_community/features/auth/domain/repository/auth_repository.dart';
import 'package:college_community/features/auth/domain/usecase/student_login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late StudentLoginUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = StudentLoginUsecase(repository: mockAuthRepository);
  });

  var testParams = LoginParams(loginID: "student_user", password: "student123");

  var testResponseEntity = LoginResponseEntity(
    success: true,
    message: "Login successful",
    loginid: 12345,
    id: "student_id",
  );

  test('should return LoginResponseEntity on successful student login', () async {
    when(() => mockAuthRepository.studentLogin(testParams)).thenAnswer((_) async => right(testResponseEntity));

    final result = await usecase(testParams);

    expect(result, right(testResponseEntity));
    verify(() => mockAuthRepository.studentLogin(testParams)).called(1);
  });

  test('should return AppErrorHandler on student login failure', () async {
    var error = AppErrorHandler(message: "Login failed");
    when(() => mockAuthRepository.studentLogin(testParams)).thenAnswer((_) async => left(error));

    final result = await usecase(testParams);

    expect(result, left(error));
    verify(() => mockAuthRepository.studentLogin(testParams)).called(1);
  });
}
