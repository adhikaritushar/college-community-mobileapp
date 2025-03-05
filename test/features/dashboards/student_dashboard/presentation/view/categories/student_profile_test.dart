import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/profile/student_profile.dart';
import 'package:college_community/features/student/domain/entity/student_entity.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock StudentCubit
class MockStudentCubit extends Mock implements StudentCubit {}

// Mock StudentState
class FakeStudentState extends Fake implements StudentState {}

void main() {
  late MockStudentCubit mockStudentCubit;

  setUp(() {
    mockStudentCubit = MockStudentCubit();
  });

  setUpAll(() {
    registerFallbackValue(FakeStudentState());
  });

  // Helper function to create the widget with a mocked StudentCubit
  Widget createWidgetUnderTest(StudentState state) {
    return MaterialApp(
      home: BlocProvider<StudentCubit>.value(
        value: mockStudentCubit,
        child: const StudentProfile(),
      ),
    );
  }

  testWidgets('StudentProfile displays user information correctly', (WidgetTester tester) async {
    // Arrange
    final mockStudentData = [
      StudentEntity(
        firstName: 'John',
        lastName: 'Doe',
        enrollmentNo: 1222,
        branch: 'Computer Science',
        semester: 2,
        phoneNumber: 9876543210,
        email: 'john.doe@example.com',
        profile: 'profile.jpg',
      ),
    ];

    when(() => mockStudentCubit.state).thenReturn(StudentState(studentData: mockStudentData));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockStudentCubit.state));

    // Assert
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('123456'), findsOneWidget);
    expect(find.text('Computer Science'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('9876543210'), findsOneWidget);
    expect(find.text('john.doe@example.com'), findsOneWidget);
  });

  testWidgets('StudentProfile displays profile picture correctly', (WidgetTester tester) async {
    // Arrange
    final mockStudentData = [
      StudentEntity(
        firstName: 'John',
        lastName: 'Doe',
        enrollmentNo: 1222,
        branch: 'Computer Science',
        semester: 2,
        phoneNumber: 9876543210,
        email: 'john.doe@example.com',
        profile: 'profile.jpg',
      ),
    ];

    when(() => mockStudentCubit.state).thenReturn(StudentState(studentData: mockStudentData));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockStudentCubit.state));

    // Assert
    final profileImage = tester.widget<Container>(find.byType(Container).at(1));
    final decoration = profileImage.decoration as BoxDecoration;
    final image = decoration.image as DecorationImage;
    expect(image.image, isA<NetworkImage>());
    expect((image.image as NetworkImage).url, endsWith('profile.jpg'));
  });

  testWidgets('StudentProfile displays loading state correctly', (WidgetTester tester) async {
    // Arrange
    when(() => mockStudentCubit.state).thenReturn(const StudentState(isLoadingState: true, studentData: []));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockStudentCubit.state));

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('StudentProfile displays error state correctly', (WidgetTester tester) async {
    // Arrange
    when(() => mockStudentCubit.state).thenReturn(StudentState(errorState: AppErrorHandler(message: 'Failed to load data'), studentData: []));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockStudentCubit.state));

    // Assert
    expect(find.text('Failed to load data'), findsOneWidget);
  });
}
