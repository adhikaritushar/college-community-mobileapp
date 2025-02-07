import 'package:college_community_main/core/error/failure.dart';
import 'package:college_community_main/features/auth/domain/use_case/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../batch/domain/use_case/token.mock.dart';
import '../repository_mock.dart';

void main() {
  late MockAuthRepository repository;
  late MockTokenSharedPrefs tokenSharedPrefs;
  late LoginUseCase usecase;

  setUp(() {
    repository = MockAuthRepository();
    tokenSharedPrefs = MockTokenSharedPrefs();
    usecase = LoginUseCase(repository, tokenSharedPrefs);
  });

  test(
      'should call the [AuthRepo.login] with correct username and password (Tushar, Tushar123)',
      () async {
    when(() => repository.loginStudent(any(), any()))
        .thenAnswer((invocation) async {
      final username = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      if (username == 'Tushar' && password == 'Tushar123') {
        return Future.value(const Right('token'));
      } else {
        return Future.value(
          const Left(ApiFailure(message: 'Invalid username or password')),
        );
      }
    });

    when(() => tokenSharedPrefs.saveToken(any()))
        .thenAnswer((_) async => Right(null));

    final result = await usecase(LoginParams(
      username: 'Tushar',
      password: 'Tushar123',
    ));

    expect(result, const Right('token'));

    verify(() => repository.loginStudent(any(), any())).called(1);
    verify(() => tokenSharedPrefs.saveToken(any())).called(1);

    verifyNoMoreInteractions(repository);
    verifyNoMoreInteractions(tokenSharedPrefs);
  });

  tearDown(() {
    reset(repository);
    reset(tokenSharedPrefs);
  });
}
