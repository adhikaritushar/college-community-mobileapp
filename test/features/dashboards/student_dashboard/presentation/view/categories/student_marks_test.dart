import 'package:college_community/features/dashboards/student_dashboard/presentation/view/categories/student_marks.dart';
import 'package:college_community/features/marks/data/models/marks_model.dart';
import 'package:college_community/features/marks/presentation/view_model.dart/cubit/marks_cubit.dart';
import 'package:college_community/features/student/data/models/student_model.dart';
import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'student_marks_test.mocks.dart';

@GenerateMocks([StudentCubit, MarksCubit])
void main() {
  late MockStudentCubit mockStudentCubit;
  late MockMarksCubit mockMarksCubit;

  setUp(() {
    mockStudentCubit = MockStudentCubit();
    mockMarksCubit = MockMarksCubit();
  });

  Widget buildTestableWidget(Widget child) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<StudentCubit>.value(value: mockStudentCubit),
          BlocProvider<MarksCubit>.value(value: mockMarksCubit),
        ],
        child: child,
      ),
    );
  }

  testWidgets('Displays marks sections with student semester and marks', (WidgetTester tester) async {
    when(mockStudentCubit.state).thenReturn(StudentState(studentData: [
      StudentModel(semester: 1),
    ]));

    when(mockMarksCubit.state).thenReturn(MarksState(
      marksList: [
        MarksModel(
          internal: {"Math": "35", "Physics": "38"},
          external: {"Chemistry": "50", "English": "55"},
        ),
      ],
    ));

    await tester.pumpWidget(buildTestableWidget(const StudentMarks()));

    // Your tests here
  });
}
