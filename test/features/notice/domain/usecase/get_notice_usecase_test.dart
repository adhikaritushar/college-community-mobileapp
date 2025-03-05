import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/notice/domain/entities/notice_entity.dart';
import 'package:college_community/features/notice/domain/repository/notice_repository.dart';
import 'package:college_community/features/notice/domain/usecase/get_notice_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockNoticeRepository extends Mock implements NoticeRepository {}

void main() {
  late GetNoticeUsecase usecase;
  late MockNoticeRepository mockRepository;

  setUp(() {
    mockRepository = MockNoticeRepository();
    usecase = GetNoticeUsecase(repository: mockRepository);
  });

  final List<NoticeEntity> noticeList = [
    NoticeEntity(id: '1', title: 'Notice 1', description: 'Description 1'),
    NoticeEntity(id: '2', title: 'Notice 2', description: 'Description 2'),
  ];

  test('should return list of notices when the repository returns a list of notices', () async {
    // Arrange
    when(mockRepository.getNotice()).thenAnswer(
      (_) async => Right(noticeList),
    );

    // Act
    final result = await usecase(null);

    // Assert
    expect(result.isRight(), true);
    result.fold(
      (l) => fail('Expected Right, but got Left'),
      (r) {
        expect(r, noticeList);
      },
    );
  });

  test('should return error when the repository fails to get notices', () async {
    // Arrange
    when(mockRepository.getNotice()).thenAnswer(
      (_) async => Left(AppErrorHandler(message: 'Error fetching notices')),
    );

    // Act
    final result = await usecase(null);

    // Assert
    expect(result.isLeft(), true);
    result.fold(
      (l) {
        expect(l.message, 'Error fetching notices');
      },
      (r) => fail('Expected Left, but got Right'),
    );
  });
}
