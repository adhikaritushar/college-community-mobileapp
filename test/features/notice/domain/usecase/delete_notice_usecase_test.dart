import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/notice/domain/repository/notice_repository.dart';
import 'package:college_community/features/notice/domain/usecase/delete_notice_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockNoticeRepository extends Mock implements NoticeRepository {}

void main() {
  late DeleteNoticeUsecase usecase;
  late MockNoticeRepository mockRepository;

  setUp(() {
    mockRepository = MockNoticeRepository();
    usecase = DeleteNoticeUsecase(repository: mockRepository);
  });

  const String noticeId = '123';

  test('should return success message when deleting notice is successful', () async {
    // Arrange
    when(mockRepository.deleteNotice(id: noticeId)).thenAnswer(
      (_) async => const Right('Notice deleted successfully'),
    );

    // Act
    final result = await usecase(noticeId);

    // Assert
    expect(result.isRight(), true);
    result.fold(
      (l) => fail('Expected Right, but got Left'),
      (r) {
        expect(r, 'Notice deleted successfully');
      },
    );
  });

  test('should return error message when deleting notice fails', () async {
    // Arrange
    when(mockRepository.deleteNotice(id: noticeId)).thenAnswer(
      (_) async => Left(AppErrorHandler(message: 'Error')),
    );

    // Act
    final result = await usecase(noticeId);

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
