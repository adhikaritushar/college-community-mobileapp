// import 'package:bloc_test/bloc_test.dart';
// import 'package:college_community/core/errors_handler/error_handler.dart';
// import 'package:college_community/features/student/domain/entity/reqeust/student_add_details_faculty_params.dart';
// import 'package:college_community/features/student/domain/entity/student_entity.dart';
// import 'package:college_community/features/student/domain/usecase/student_get_detail_usecase.dart';
// import 'package:college_community/features/student/presentation/view_model/cubit/student_cubit.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class MockStudentGetDetailUsecase extends Mock implements StudentGetDetailUsecase {}

// void main() {
//   group('StudentCubit Tests', () {
//     late MockStudentGetDetailUsecase mockStudentGetDetailUsecase;
//     late StudentCubit studentCubit;

//     setUp(() {
//       mockStudentGetDetailUsecase = MockStudentGetDetailUsecase();
//       studentCubit = StudentCubit(studentGetDetailUsecase: mockStudentGetDetailUsecase);
//     });

//     test('initial state is correctly set', () {
//       expect(studentCubit.state, StudentState.initially());
//     });

//     blocTest<StudentCubit, StudentState>(
//       'emits isLoadingState before making the API call',
//       build: () => studentCubit,
//       act: (cubit) => cubit.studentGetDetials(
//         params: StudentGetDetilsParams(enrollmentNo: 12345, baranch: 'CS', semester: '1'),
//         context: MockBuildContext(),
//       ),
//       expect: () => [
//         const StudentState(isLoadingState: true),
//       ],
//     );

//     blocTest<StudentCubit, StudentState>(
//       'emits error state when the use case returns an error',
//       build: () {
//         when(mockStudentGetDetailUsecase.call(
//           StudentGetDetilsParams(baranch: "1234", enrollmentNo: 1222, semester: "1"),
//         )).thenAnswer(
//           (_) async => Left(AppErrorHandler(message: 'Error fetching student details')),
//         );
//         return studentCubit;
//       },
//       act: (cubit) => cubit.studentGetDetials(
//         params: StudentGetDetilsParams(enrollmentNo: 12345, baranch: 'CS', semester: '1'),
//         context: MockBuildContext(),
//       ),
//       expect: () => [
//         const StudentState(isLoadingState: true),
//         StudentState(isLoadingState: false, errorState: AppErrorHandler(message: 'Error fetching student details')),
//       ],
//     );

//     blocTest<StudentCubit, StudentState>(
//       'emits success state with empty student data and shows a Snackbar',
//       build: () {
//         when(mockStudentGetDetailUsecase.call(
//           StudentGetDetilsParams(baranch: "1234", enrollmentNo: 1222, semester: "1"),
//         )).thenAnswer(
//           (_) async => const Right([]),
//         );
//         return studentCubit;
//       },
//       act: (cubit) => cubit.studentGetDetials(
//         params: StudentGetDetilsParams(enrollmentNo: 12345, baranch: 'CS', semester: '1'),
//         context: MockBuildContext(),
//       ),
//       expect: () => [
//         const StudentState(isLoadingState: true),
//         const StudentState(isLoadingState: false, isSuccessState: true, studentData: []),
//       ],
//       verify: (_) {},
//     );

//     blocTest<StudentCubit, StudentState>(
//       'emits success state with student data',
//       build: () {
//         when(mockStudentGetDetailUsecase.call(
//           StudentGetDetilsParams(baranch: "1234", enrollmentNo: 1222, semester: "1"),
//         )).thenAnswer(
//           (_) async => Right([StudentEntity(id: '1', firstName: 'John Doe', enrollmentNo: 12345)]),
//         );
//         return studentCubit;
//       },
//       act: (cubit) => cubit.studentGetDetials(
//         params: StudentGetDetilsParams(enrollmentNo: 12345, baranch: 'CS', semester: '1'),
//         context: MockBuildContext(),
//       ),
//       expect: () => [
//         const StudentState(isLoadingState: true),
//         StudentState(isLoadingState: false, isSuccessState: true, studentData: [StudentEntity(id: '1', firstName: 'John Doe', enrollmentNo: 12345)]),
//       ],
//     );
//   });
// }

// class MockBuildContext extends Mock implements BuildContext {}
