import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/timetable/domain/entity/time_table_entity.dart';
import 'package:college_community/features/timetable/domain/repository/time_table_repository.dart';
import 'package:college_community/features/timetable/domain/usecase/get_timetable_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock class for TimeTableRepository
class MockTimeTableRepository extends Mock implements TimeTableRepository {}

void main() {
  late GetTimeTableUsecase usecase;
  late MockTimeTableRepository mockRepository;

  setUp(() {
    mockRepository = MockTimeTableRepository();
    usecase = GetTimeTableUsecase(repository: mockRepository);
  });

  group('GetTimeTableUsecase', () {
    test('should return timetable data when repository is successful', () async {
      // Arrange
      final mockTimeTableList = [
        TimetableEntity(id: "1", branch: 'Computer Science', semester: 1),
        TimetableEntity(id: "2", branch: 'Mechanical Engineering', semester: 2),
      ];
      when(mockRepository.getTimeTable()).thenAnswer(
        (_) async => Right(mockTimeTableList),
      );

      // Act
      final result = await usecase.call(null);

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected Right, but got Left'),
        (r) {
          expect(r, mockTimeTableList);
          expect(r.length, 2);
        },
      );
    });

    test('should return an error when repository fails', () async {
      // Arrange
      final mockError = AppErrorHandler(message: 'Error occurred');
      when(mockRepository.getTimeTable()).thenAnswer(
        (_) async => Left(mockError),
      );

      // Act
      final result = await usecase.call(null);

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l.message, 'Error occurred');
        },
        (r) => fail('Expected Left, but got Right'),
      );
    });
  });
}
