import 'package:cached_network_image/cached_network_image.dart';
import 'package:college_community/core/common_widgets/k_text_form_field.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/faculty_student_info.dart';
import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
import 'package:college_community/features/student/domain/entity/student_entity.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock StudentCubit
class MockStudentCubit extends Mock implements StudentCubit {}

void main() {
  late MockStudentCubit mockStudentCubit;

  setUp(() {
    mockStudentCubit = MockStudentCubit();
  });

  // Helper function to create the widget with a mocked StudentCubit
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<StudentCubit>.value(
        value: mockStudentCubit,
        child: const FacultyStudentInfo(),
      ),
    );
  }

  testWidgets('FacultyStudentInfo renders search bar and button correctly', (WidgetTester tester) async {
    // Arrange
    when(() => mockStudentCubit.state).thenReturn(const StudentState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byType(KTextFormField), findsOneWidget); // Search field
    expect(find.byIcon(Icons.search), findsOneWidget); // Search button
  });

  testWidgets('FacultyStudentInfo shows validation error when search field is empty', (WidgetTester tester) async {
    // Arrange
    when(() => mockStudentCubit.state).thenReturn(const StudentState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Assert
    expect(find.text('Employee ID is required'), findsOneWidget);
  });

  testWidgets('FacultyStudentInfo triggers StudentCubit.studentGetDetials when search is valid', (WidgetTester tester) async {
    // Arrange
    when(() => mockStudentCubit.state).thenReturn(const StudentState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.enterText(find.byType(KTextFormField), '123456');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Assert
    verify(() => mockStudentCubit.studentGetDetials(
          context: any(named: 'context'),
          params: StudentGetDetilsParams(enrollmentNo: 123456),
        )).called(1);
  });

  testWidgets('FacultyStudentInfo displays student data when search is successful', (WidgetTester tester) async {
    // Arrange
    final mockStudent = StudentEntity(
      firstName: 'John',
      lastName: 'Doe',
      enrollmentNo: 1123456,
      phoneNumber: 9876543210,
      email: 'john.doe@example.com',
      branch: 'Computer Science',
      semester: 5,
      profile: 'profile.jpg',
    );

    when(() => mockStudentCubit.state).thenReturn(StudentState(studentData: [mockStudent]));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.enterText(find.byType(KTextFormField), '123456');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Assert
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('123456'), findsOneWidget);
    expect(find.text('9876543210'), findsOneWidget);
    expect(find.text('john.doe@example.com'), findsOneWidget);
    expect(find.text('Computer Science'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);

    // Verify profile picture
    final cachedNetworkImage = tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    expect(cachedNetworkImage.imageUrl, endsWith('profile.jpg'));
  });

  testWidgets('FacultyStudentInfo shows "No Data Found!!" when student data is empty', (WidgetTester tester) async {
    // Arrange
    when(() => mockStudentCubit.state).thenReturn(const StudentState(studentData: []));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.enterText(find.byType(KTextFormField), '123456');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Assert
    expect(find.text('No Data Found!!'), findsOneWidget);
  });

  testWidgets('FacultyStudentInfo shows loading indicator when StudentCubit is in loading state', (WidgetTester tester) async {
    // Arrange
    when(() => mockStudentCubit.state).thenReturn(const StudentState(isLoadingState: true));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.enterText(find.byType(KTextFormField), '123456');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('FacultyStudentInfo shows error message when StudentCubit has an error', (WidgetTester tester) async {
    // Arrange
    when(() => mockStudentCubit.state).thenReturn(StudentState(errorState: AppErrorHandler(message: 'Failed to load data')));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.enterText(find.byType(KTextFormField), '123456');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Assert
    expect(find.text('Failed to load data'), findsOneWidget);
  });
}
