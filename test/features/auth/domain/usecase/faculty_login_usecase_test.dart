import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/auth/domain/entities/request/login_params.dart';
import 'package:college_community/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:college_community/features/auth/domain/repository/auth_repository.dart';
import 'package:college_community/features/auth/domain/usecase/faculty_login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late FacultyLoginUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = FacultyLoginUsecase(repository: mockAuthRepository);
  });

  var testParams = LoginParams(loginID: "faculty_user", password: "faculty123");

  var testResponseEntity = LoginResponseEntity(
    success: true,
    message: "Login successful",
    loginid: 98765,
    id: "faculty_id",
  );

  test('should return LoginResponseEntity on successful faculty login', () async {
    when(() => mockAuthRepository.facultyLogin(testParams)).thenAnswer((_) async => right(testResponseEntity));

    final result = await usecase(testParams);

    expect(result, right(testResponseEntity));
    verify(() => mockAuthRepository.facultyLogin(testParams)).called(1);
  });

  test('should return AppErrorHandler on faculty login failure', () async {
    var error = AppErrorHandler(message: "Login failed");
    when(() => mockAuthRepository.facultyLogin(testParams)).thenAnswer((_) async => left(error));

    final result = await usecase(testParams);

    expect(result, left(error));
    verify(() => mockAuthRepository.facultyLogin(testParams)).called(1);
  });
}
