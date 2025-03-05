import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/marks/domain/entity/request/add_marks_params.dart';
import 'package:college_community/features/marks/domain/repository/marks_repository.dart';
import 'package:college_community/features/marks/domain/usecase/add_marks_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMarksRepository extends Mock implements MarksRepository {}

void main() {
  late AddMarksUsecase addMarksUsecase;
  late MockMarksRepository mockMarksRepository;

  setUp(() {
    mockMarksRepository = MockMarksRepository();
    addMarksUsecase = AddMarksUsecase(repository: mockMarksRepository);
  });

  group('AddMarksUsecase', () {
    final addMarksParams = AddMarksParams(enrollmentNo: "12345", isInternal: true, examType: {"internal": "internl example"});

    test('should return a success message when marks are added successfully', () async {
      // Arrange
      const successMessage = 'Marks added successfully';
      when(() => mockMarksRepository.addMarks(params: addMarksParams)).thenAnswer((_) async => const Right(successMessage));

      // Act
      final result = await addMarksUsecase(addMarksParams);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected success but got error'),
        (r) => expect(r, successMessage),
      );
    });

    test('should return an error when adding marks fails', () async {
      // Arrange
      const errorMessage = 'Failed to add marks';
      when(() => mockMarksRepository.addMarks(params: addMarksParams)).thenAnswer((_) async => Left(AppErrorHandler(message: errorMessage)));

      // Act
      final result = await addMarksUsecase(addMarksParams);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l.message, errorMessage),
        (r) => fail('Expected error but got success'),
      );
    });
  });
}
