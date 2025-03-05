import 'package:college_community/features/auth/presentation/view/login_dashboard_screen.dart';
import 'package:college_community/features/branch/presentation/view_model/cubit/branch_cubit.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/helpers/faculty_helpers.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/notice/faculty_notice.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/profile/faculty_profile.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/faculty_time_table.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/categories/faculty_upload_marks.dart';
import 'package:college_community/features/dashboards/faculty_dashboard/presentation/view/faculty_dashboard_screen.dart';
import 'package:college_community/features/notice/presentation/view_model/cubit/notice_cubit.dart';
import 'package:college_community/features/subject/presentation/view_model/cubit/subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock Cubits
class MockBranchCubit extends Mock implements BranchCubit {}

class MockSubjectCubit extends Mock implements SubjectCubit {}

class MockNoticeCubit extends Mock implements NoticeCubit {}

void main() {
  late MockBranchCubit mockBranchCubit;
  late MockSubjectCubit mockSubjectCubit;
  late MockNoticeCubit mockNoticeCubit;

  setUp(() {
    mockBranchCubit = MockBranchCubit();
    mockSubjectCubit = MockSubjectCubit();
    mockNoticeCubit = MockNoticeCubit();
  });

  // Helper function to create the widget with mocked cubits
  Widget createWidgetUnderTest() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BranchCubit>.value(value: mockBranchCubit),
        BlocProvider<SubjectCubit>.value(value: mockSubjectCubit),
        BlocProvider<NoticeCubit>.value(value: mockNoticeCubit),
      ],
      child: const MaterialApp(
        home: FacultyDashboardScreen(),
      ),
    );
  }

  testWidgets('FacultyDashboardScreen displays all categories correctly', (WidgetTester tester) async {
    // Arrange
    when(() => mockBranchCubit.state).thenReturn(const BranchState());
    when(() => mockSubjectCubit.state).thenReturn(const SubjectState());
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.text('Faculty Dashboard'), findsOneWidget); // AppBar title
    expect(find.byType(GridView), findsOneWidget); // GridView for categories

    // Verify all categories are displayed
    for (final category in FacultyDashboardHelper.facultyCategories) {
      expect(find.text(category), findsOneWidget);
    }
  });

  testWidgets('FacultyDashboardScreen navigates to FacultyProfile when My Profile is tapped', (WidgetTester tester) async {
    // Arrange
    when(() => mockBranchCubit.state).thenReturn(const BranchState());
    when(() => mockSubjectCubit.state).thenReturn(const SubjectState());
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text(FacultyDashboardHelper.myprofile));
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(FacultyProfile), findsOneWidget);
  });

  testWidgets('FacultyDashboardScreen navigates to FacultyUploadMarks and triggers cubits', (WidgetTester tester) async {
    // Arrange
    when(() => mockBranchCubit.state).thenReturn(const BranchState());
    when(() => mockSubjectCubit.state).thenReturn(const SubjectState());
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text(FacultyDashboardHelper.uploadMarks));
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(FacultyUploadMarks), findsOneWidget);
    verify(() => mockBranchCubit.getBranch()).called(1);
    verify(() => mockSubjectCubit.getSubject()).called(1);
  });

  testWidgets('FacultyDashboardScreen navigates to FacultyTimeTable and triggers BranchCubit', (WidgetTester tester) async {
    // Arrange
    when(() => mockBranchCubit.state).thenReturn(const BranchState());
    when(() => mockSubjectCubit.state).thenReturn(const SubjectState());
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text(FacultyDashboardHelper.timetable));
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(FacultyTimeTable), findsOneWidget);
    verify(() => mockBranchCubit.getBranch()).called(1);
  });

  testWidgets('FacultyDashboardScreen navigates to FacultyNotice and triggers NoticeCubit', (WidgetTester tester) async {
    // Arrange
    when(() => mockBranchCubit.state).thenReturn(const BranchState());
    when(() => mockSubjectCubit.state).thenReturn(const SubjectState());
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text(FacultyDashboardHelper.notice));
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(FacultyNotice), findsOneWidget);
    verify(() => mockNoticeCubit.getNotice(any())).called(1);
  });

  testWidgets('FacultyDashboardScreen logs out and navigates to LoginDashBoard', (WidgetTester tester) async {
    // Arrange
    when(() => mockBranchCubit.state).thenReturn(const BranchState());
    when(() => mockSubjectCubit.state).thenReturn(const SubjectState());
    when(() => mockNoticeCubit.state).thenReturn(const NoticeState());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.byIcon(Icons.logout_outlined));
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(LoginDashBoard), findsOneWidget);
  });
}
