import 'dart:io';

import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/timetable/domain/entity/request/post_timetable_params.dart';
import 'package:college_community/features/timetable/domain/repository/time_table_repository.dart';
import 'package:college_community/features/timetable/domain/usecase/post_timetable_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock class for TimeTableRepository
class MockTimeTableRepository extends Mock implements TimeTableRepository {}

void main() {
  late PostTimetableUsecase usecase;
  late MockTimeTableRepository mockRepository;

  setUp(() {
    mockRepository = MockTimeTableRepository();
    usecase = PostTimetableUsecase(repository: mockRepository);
  });

  group('PostTimetableUsecase', () {
    final params = PostTimetableParams(
      branch: 'Computer Science',
      semester: 'Fall 2023',
      type: "timetable",
      timeTableFile: File("timetable/abd.txt"),
    );

    test('should return success message when repository is successful', () async {
      // Arrange
      const successMessage = 'Timetable uploaded successfully';
      when(mockRepository.postTimeTable(params: params)).thenAnswer(
        (_) async => const Right(successMessage),
      );

      // Act
      final result = await usecase.call(params);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (r) {
          expect(r, successMessage);
        },
      );
    });

    test('should return error message when repository fails', () async {
      // Arrange
      const errorMessage = 'Failed to upload timetable';
      final error = AppErrorHandler(message: errorMessage);
      when(mockRepository.postTimeTable(params: params)).thenAnswer(
        (_) async => Left(error),
      );

      // Act
      final result = await usecase.call(params);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l.message, errorMessage);
        },
        (r) => fail('Expected Left, but got Right'),
      );
    });
  });
}
