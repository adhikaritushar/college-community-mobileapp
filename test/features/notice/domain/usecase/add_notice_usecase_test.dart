import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';
import 'package:college_community/features/notice/domain/repository/notice_repository.dart';
import 'package:college_community/features/notice/domain/usecase/add_notice_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockNoticeRepository extends Mock implements NoticeRepository {}

void main() {
  late AddNoticeUsecase usecase;
  late MockNoticeRepository mockRepository;

  setUp(() {
    mockRepository = MockNoticeRepository();
    usecase = AddNoticeUsecase(repository: mockRepository);
  });

  final params = NoticeAddUpdateParams(
    description: 'Test description',
    link: 'testlink.com',
    title: 'Test Title',
    type: 'info',
  );

  test('should return success message when adding notice is successful', () async {
    // Arrange
    when(mockRepository.addNotice(params: params)).thenAnswer(
      (_) async => const Right('Notice added successfully'),
    );

    // Act
    final result = await usecase(params);

    // Assert
    expect(result.isRight(), true);
    result.fold(
      (l) => fail('Expected Right, but got Left'),
      (r) {
        expect(r, 'Notice added successfully');
      },
    );
  });

  test('should return error message when adding notice fails', () async {
    // Arrange
    when(mockRepository.addNotice(params: params)).thenAnswer(
      (_) async => Left(AppErrorHandler(message: 'Error')),
    );

    // Act
    final result = await usecase(params);

    // Assert
    expect(result.isLeft(), true);
    result.fold(
      (l) {
        expect(l.message, 'Error');
      },
      (r) => fail('Expected Left, but got Right'),
    );
  });
}
