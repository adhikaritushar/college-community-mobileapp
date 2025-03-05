import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/marks/domain/entity/marks_entity.dart';
import 'package:college_community/features/marks/domain/repository/marks_repository.dart';
import 'package:college_community/features/marks/domain/usecase/get_marks_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMarksRepository extends Mock implements MarksRepository {}

void main() {
  late GetMarksUsecase getMarksUsecase;
  late MockMarksRepository mockMarksRepository;

  setUp(() {
    mockMarksRepository = MockMarksRepository();
    getMarksUsecase = GetMarksUsecase(repository: mockMarksRepository);
  });

  group('GetMarksUsecase', () {
    const enrollmentNo = 12345;
    final marksList = [
      MarksEntity(
        id: "123",
        enrollmentNo: 456,
        internal: {"subject1": "80", "subject2": "75"},
        createdAt: "2021-01-01T00:00:00Z",
        updatedAt: "2021-01-01T01:00:00Z",
        v: 1,
        external: {"subject1": "70", "subject2": "60"},
      ),
      MarksEntity(
        id: "123",
        enrollmentNo: 456,
        internal: {"subject1": "80", "subject2": "75"},
        createdAt: "2021-01-01T00:00:00Z",
        updatedAt: "2021-01-01T01:00:00Z",
        v: 1,
        external: {"subject1": "70", "subject2": "60"},
      ),
    ];

    test('should return a list of marks when the marks are fetched successfully', () async {
      // Arrange
      when(() => mockMarksRepository.getMarks(enrollmentNo: enrollmentNo)).thenAnswer((_) async => Right(marksList));

      // Act
      final result = await getMarksUsecase(enrollmentNo);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected success but got error'),
        (r) => expect(r, marksList),
      );
    });

    test('should return an error when fetching marks fails', () async {
      // Arrange
      const errorMessage = 'Failed to fetch marks';
      when(() => mockMarksRepository.getMarks(enrollmentNo: enrollmentNo)).thenAnswer((_) async => Left(AppErrorHandler(message: errorMessage)));

      // Act
      final result = await getMarksUsecase(enrollmentNo);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l.message, errorMessage),
        (r) => fail('Expected error but got success'),
      );
    });
  });
}
