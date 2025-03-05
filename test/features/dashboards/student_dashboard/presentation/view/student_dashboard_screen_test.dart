import 'package:college_community/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_marks.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_materials.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_notice.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_timetable.dart';
import 'package:college_community/features/dashboards/student_dashboard/presentation/view/student_dashboard_screen.dart';
import 'package:college_community/features/marks/presentation/view_model.dart/cubit/marks_cubit.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';
import 'package:college_community/features/timetable/presentation/view_model/cubit/timetable_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'student_dashboard_screen_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<MarksCubit>(),
  MockSpec<TimetableCubit>(),
  MockSpec<SubjectCubit>(),
  MockSpec<NoticeCubit>(),
  MockSpec<AuthLocalService>(), // Ensure this is properly generated
])
void main() {
  late MockMarksCubit mockMarksCubit;
  late MockTimetableCubit mockTimetableCubit;
  late MockSubjectCubit mockSubjectCubit;
  late MockNoticeCubit mockNoticeCubit;

  setUp(() {
    mockMarksCubit = MockMarksCubit();
    mockTimetableCubit = MockTimetableCubit();
    mockSubjectCubit = MockSubjectCubit();
    mockNoticeCubit = MockNoticeCubit();

    // Mock method correctly based on return type
    // when(mockAuthLocalService.getAuthLocalService()).thenReturn(12345);
  });

  Widget buildTestableWidget(Widget child) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MarksCubit>.value(value: mockMarksCubit),
          BlocProvider<TimetableCubit>.value(value: mockTimetableCubit),
          BlocProvider<SubjectCubit>.value(value: mockSubjectCubit),
          BlocProvider<NoticeCubit>.value(value: mockNoticeCubit),
        ],
        child: child,
      ),
    );
  }

  testWidgets('Displays categories and triggers cubit actions on tap', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(const StudentDashboardScreen()));

    expect(find.text('My Profile'), findsOneWidget);
    expect(find.text('Timetable'), findsOneWidget);
    expect(find.text('Marks'), findsOneWidget);
    expect(find.text('Materials'), findsOneWidget);
    expect(find.text('Notice'), findsOneWidget);

    await tester.tap(find.text('Marks'));
    await tester.pumpAndSettle();
    verify(mockMarksCubit.getMarks(enrollmentNo: 12345)).called(1);

    await tester.tap(find.text('Timetable'));
    await tester.pumpAndSettle();
    verify(mockTimetableCubit.getTimetable()).called(1);

    await tester.tap(find.text('Materials'));
    await tester.pumpAndSettle();
    verify(mockSubjectCubit.getSubject()).called(1);

    await tester.tap(find.text('Notice'));
    await tester.pumpAndSettle();
    verify(mockNoticeCubit.getNotice(any)).called(1);
  });

  testWidgets('Navigates to the correct screen when a category is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(const StudentDashboardScreen()));

    await tester.tap(find.text('Marks'));
    await tester.pumpAndSettle();
    expect(find.byType(StudentMarks), findsOneWidget);

    await tester.tap(find.text('Timetable'));
    await tester.pumpAndSettle();
    expect(find.byType(StudentTimetable), findsOneWidget);

    await tester.tap(find.text('Materials'));
    await tester.pumpAndSettle();
    expect(find.byType(StudentMaterials), findsOneWidget);

    await tester.tap(find.text('Notice'));
    await tester.pumpAndSettle();
    expect(find.byType(StudentNotice), findsOneWidget);
  });
}
