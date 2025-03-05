import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/domain/entity/student_entity.dart';
import 'package:college_community/features/student/domain/repository/student_repository.dart';
import 'package:college_community/features/student/domain/usecase/student_get_detail_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Mocking the repository
class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  late StudentGetDetailUsecase usecase;
  late MockStudentRepository mockStudentRepository;

  setUp(() {
    mockStudentRepository = MockStudentRepository();
    usecase = StudentGetDetailUsecase(repository: mockStudentRepository);
  });

  final params = StudentGetDetilsParams(
    enrollmentNo: 12345,
    baranch: 'Computer Science',
    semester: '5',
  );

  final List<StudentEntity> studentList = [
    StudentEntity(id: '1', firstName: 'John Doe', enrollmentNo: 12345, branch: 'Computer Science'),
    StudentEntity(id: '2', firstName: 'Jane Doe', enrollmentNo: 67890, branch: 'Mathematics'),
  ];

  test('should return a list of StudentEntity when the repository succeeds', () async {
    // Arrange
    when(mockStudentRepository.studentGetDetail(params: params)).thenAnswer((_) async => Right(studentList));

    // Act
    final result = await usecase.call(params);

    // Assert
    expect(result.isRight(), true);
    result.fold(
      (l) => fail('Expected Right, but got Left'), // Should not happen
      (r) {
        expect(r, isA<List<StudentEntity>>());
        expect(r.length, 2);
        expect(r[0].firstName, 'John Doe');
        expect(r[1].firstName, 'Jane Doe');
      },
    );
  });

  test('should return an error when the repository fails', () async {
    // Arrange
    when(mockStudentRepository.studentGetDetail(params: params)).thenAnswer((_) async => Left(AppErrorHandler(message: 'Error occurred')));

    // Act
    final result = await usecase.call(params);

    // Assert
    expect(result.isLeft(), true);
    result.fold(
      (l) {
        expect(l.message, 'Error occurred');
      },
      (r) => fail('Expected Left, but got Right'), // Should not happen
    );
  });
}
