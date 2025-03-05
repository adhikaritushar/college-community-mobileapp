import 'package:cached_network_image/cached_network_image.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_timetable.dart';
import 'package:college_community/features/student/domain/entity/student_entity.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:college_community/features/timetable/domain/entity/time_table_entity.dart';
import 'package:college_community/features/timetable/presentation/view_model/cubit/timetable_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock StudentCubit
class MockStudentCubit extends Mock implements StudentCubit {}

// Mock TimetableCubit
class MockTimetableCubit extends Mock implements TimetableCubit {}

// Mock StudentState
class FakeStudentState extends Fake implements StudentState {}

// Mock TimetableState
class FakeTimetableState extends Fake implements TimetableState {}

void main() {
  late MockStudentCubit mockStudentCubit;
  late MockTimetableCubit mockTimetableCubit;

  setUp(() {
    mockStudentCubit = MockStudentCubit();
    mockTimetableCubit = MockTimetableCubit();
  });

  setUpAll(() {
    registerFallbackValue(FakeStudentState());
    registerFallbackValue(FakeTimetableState());
  });

  // Helper function to create the widget with mocked cubits
  Widget createWidgetUnderTest(StudentState studentState, TimetableState timetableState) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StudentCubit>.value(value: mockStudentCubit),
        BlocProvider<TimetableCubit>.value(value: mockTimetableCubit),
      ],
      child: const MaterialApp(
        home: StudentTimetable(),
      ),
    );
  }

  testWidgets('StudentTimetable displays timetable for the correct semester', (WidgetTester tester) async {
    // Arrange
    final mockStudentData = [
      StudentEntity(
        firstName: 'John',
        lastName: 'Doe',
        semester: 5,
      ),
    ];

    final mockTimetableData = [
      TimetableEntity(
        semester: 5,
        link: 'timetable.jpg',
      ),
    ];

    when(() => mockStudentCubit.state).thenReturn(StudentState(studentData: mockStudentData));
    when(() => mockTimetableCubit.state).thenReturn(TimetableState(timetableList: mockTimetableData));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockStudentCubit.state, mockTimetableCubit.state));

    // Assert
    expect(find.text('TimeTable of Semester 5'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });

  testWidgets('StudentTimetable displays "No Data Found !!" when timetable list is empty', (WidgetTester tester) async {
    // Arrange
    final mockStudentData = [
      StudentEntity(
        firstName: 'John',
        lastName: 'Doe',
        semester: 5,
      ),
    ];

    when(() => mockStudentCubit.state).thenReturn(StudentState(studentData: mockStudentData));
    when(() => mockTimetableCubit.state).thenReturn(const TimetableState(timetableList: []));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockStudentCubit.state, mockTimetableCubit.state));

    // Assert
    expect(find.text('No Data Found !!'), findsOneWidget);
  });

  testWidgets('StudentTimetable displays loading indicator while fetching timetable', (WidgetTester tester) async {
    // Arrange
    final mockStudentData = [
      StudentEntity(
        firstName: 'John',
        lastName: 'Doe',
        semester: 5,
      ),
    ];

    when(() => mockStudentCubit.state).thenReturn(StudentState(studentData: mockStudentData));
    when(() => mockTimetableCubit.state).thenReturn(const TimetableState(isLoadingState: true, timetableList: []));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockStudentCubit.state, mockTimetableCubit.state));

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('StudentTimetable filters timetable based on student semester', (WidgetTester tester) async {
    // Arrange
    final mockStudentData = [
      StudentEntity(
        firstName: 'John',
        lastName: 'Doe',
        semester: 5,
      ),
    ];

    final mockTimetableData = [
      TimetableEntity(
        semester: 5,
        link: 'timetable.jpg',
      ),
      TimetableEntity(
        semester: 6,
        link: 'timetable2.jpg',
      ),
    ];

    when(() => mockStudentCubit.state).thenReturn(StudentState(studentData: mockStudentData));
    when(() => mockTimetableCubit.state).thenReturn(TimetableState(timetableList: mockTimetableData));

    // Act
    await tester.pumpWidget(createWidgetUnderTest(mockStudentCubit.state, mockTimetableCubit.state));

    // Assert
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.text('TimeTable of Semester 5'), findsOneWidget);
  });
}
