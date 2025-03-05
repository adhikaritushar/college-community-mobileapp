import 'package:college_community/features/auth/presentation/helpers/auth_helper.dart';
import 'package:college_community/features/auth/presentation/view/login_dashboard_screen.dart';
import 'package:college_community/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_dashboard_screen_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthCubit>()])
void main() {
  late MockAuthCubit mockAuthCubit;

  setUp(() {
    mockAuthCubit = MockAuthCubit();

    // Ensure the stream emits only necessary states
    when(mockAuthCubit.stream).thenAnswer((_) {
      return Stream.fromIterable([
        AuthState.initially(),
        const AuthState(selectedCategory: AuthHelper.student),
        const AuthState(selectedCategory: AuthHelper.faculty),
        const AuthState(selectedCategory: AuthHelper.admin),
      ]);
    });

    // Set the initial state for the mock AuthCubit
    when(mockAuthCubit.state).thenReturn(AuthState.initially());
  });

  Widget buildTestableWidget(Widget child) {
    return MaterialApp(
      home: BlocProvider<AuthCubit>.value(
        value: mockAuthCubit,
        child: child,
      ),
    );
  }

  testWidgets('Displays TabBar with Student, Faculty, and Admin tabs', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(const LoginDashBoard()));

    // Verify that the text for the tabs is present
    expect(find.text('Student'), findsOneWidget);
    expect(find.text('Faculty'), findsOneWidget);
    expect(find.text('Admin'), findsOneWidget);
  });

  testWidgets('Switching tabs updates selected category in AuthCubit', (WidgetTester tester) async {
    // Initialize the widget
    await tester.pumpWidget(buildTestableWidget(const LoginDashBoard()));

    // Tap on the "Faculty" tab
    await tester.tap(find.text('Faculty'));
    await tester.pumpAndSettle();

    // Verify that `selectedCategory` was called exactly once with the correct category
    verify(mockAuthCubit.selectedCategory(category: AuthHelper.faculty)).called(1);

    // Reset mock interactions before the next verification
    reset(mockAuthCubit);

    // Tap on the "Admin" tab
    await tester.tap(find.text('Admin'));
    await tester.pumpAndSettle();

    // Verify that `selectedCategory` was called exactly once with the correct category
    verify(mockAuthCubit.selectedCategory(category: AuthHelper.admin)).called(1);
  });
}
