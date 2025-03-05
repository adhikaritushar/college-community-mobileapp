import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/notice/domain/entities/request/notice_add_update_params.dart';
import 'package:college_community/features/notice/domain/repository/notice_repository.dart';
import 'package:college_community/features/notice/domain/usecase/update_notice_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockNoticeRepository extends Mock implements NoticeRepository {}

void main() {
  late UpdateNoticeUsecase usecase;
  late MockNoticeRepository mockRepository;

  setUp(() {
    mockRepository = MockNoticeRepository();
    usecase = UpdateNoticeUsecase(repository: mockRepository);
  });

  final NoticeAddUpdateParams params = NoticeAddUpdateParams(
    id: '1',
    description: 'Updated description',
    link: 'http://updated-link.com',
    title: 'Updated title',
    type: 'Important',
  );

  test('should return success message when the repository updates the notice successfully', () async {
    // Arrange
    when(mockRepository.updateNotice(params: params)).thenAnswer(
      (_) async => const Right('Notice updated successfully'),
    );

    // Act
    final result = await usecase(params);

    // Assert
    expect(result.isRight(), true);
    result.fold(
      (l) => fail('Expected Right, but got Left'),
      (r) {
        expect(r, 'Notice updated successfully');
      },
    );
  });

  test('should return error when the repository fails to update the notice', () async {
    // Arrange
    when(mockRepository.updateNotice(params: params)).thenAnswer(
      (_) async => Left(AppErrorHandler(message: 'Error updating notice')),
    );

    // Act
    final result = await usecase(params);

    // Assert
    expect(result.isLeft(), true);
    result.fold(
      (l) {
        expect(l.message, 'Error updating notice');
      },
      (r) => fail('Expected Left, but got Right'),
    );
  });
}
