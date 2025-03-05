import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/core/network_services/api_endpoints.dart';
import 'package:college_community/core/network_services/remote_service/generic_api_handler.dart';
import 'package:college_community/features/student/data/datasource/remote_datasource/student_remote_datasource.dart';
import 'package:college_community/features/student/data/models/student_model.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockApiHandler extends Mock implements GenericApiHandler {}

void main() {
  late StudentRemoteDatasourceImpl datasource;
  late MockApiHandler mockApiHandler;

  setUp(() {
    mockApiHandler = MockApiHandler();
    datasource = StudentRemoteDatasourceImpl(apiHandler: mockApiHandler);
  });

  final params = StudentGetDetilsParams(
    enrollmentNo: 12345,
    baranch: 'Computer Science',
    semester: '5',
  );

  test('should return a list of StudentModel on success', () async {
    // Arrange
    final mockResponse = {
      'user': [
        {
          'id': '1',
          'name': 'John Doe',
          'enrollmentNo': '12345',
          'branch': 'Computer Science',
        },
      ],
    };
    when(mockApiHandler.request(
      method: ApiMethod.POST,
      path: ApiEndpoint.getStudentDetailsURL,
      data: {
        'enrollmentNo': params.enrollmentNo,
        'branch': params.baranch,
        'semester': params.semester,
      },
    )).thenAnswer(
      (_) async => Right(mockResponse),
    );

    // Act
    final result = await datasource.studentGetDetails(params: params);

    // Assert
    expect(result.isRight(), true);
    result.fold(
      (l) => fail('Expected Right, but got Left'),
      (r) {
        expect(r, isA<List<StudentModel>>());
        expect(r.first.firstName, 'John Doe');
      },
    );
  });

  test('should return an error when the API call fails', () async {
    // Arrange
    when(mockApiHandler.request(
      method: ApiMethod.POST,
      path: ApiEndpoint.getStudentDetailsURL,
      data: {
        'enrollmentNo': params.enrollmentNo,
        'branch': params.baranch,
        'semester': params.semester,
      },
    )).thenAnswer(
      (_) async => Left(AppErrorHandler(message: 'Error occurred')),
    );

    // Act
    final result = await datasource.studentGetDetails(params: params);

    // Assert
    expect(result.isLeft(), true);
    result.fold(
      (l) {
        expect(l.message, 'Error occurred');
      },
      (r) => fail('Expected Left, but got Right'),
    );
  });

  test('should return an error when DioException is thrown', () async {
    // Arrange
    when(mockApiHandler.request(
      method: ApiMethod.POST,
      path: ApiEndpoint.getStudentDetailsURL,
      data: {
        'enrollmentNo': params.enrollmentNo,
        'branch': params.baranch,
        'semester': params.semester,
      },
    ));

    // Act
    final result = await datasource.studentGetDetails(params: params);

    // Assert
    expect(result.isLeft(), true);
    result.fold(
      (l) {
        expect(l.message, 'Dio error');
      },
      (r) => fail('Expected Left, but got Right'),
    );
  });
}
