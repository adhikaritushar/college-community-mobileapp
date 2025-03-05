import 'package:bloc_test/bloc_test.dart';
import 'package:college_community/core/errors_handler/error_handler.dart';
import 'package:college_community/features/branch/domain/entity/branch_entity.dart';
import 'package:college_community/features/branch/domain/usecase/add_branch_usecase.dart';
import 'package:college_community/features/branch/domain/usecase/delete_branch_usecase.dart';
import 'package:college_community/features/branch/domain/usecase/get_branch_usecase.dart';
import 'package:college_community/features/branch/presentation/view_model/cubit/branch_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetBranchUsecase extends Mock implements GetBranchUsecase {}

class MockAddBranchUsecase extends Mock implements AddBranchUsecase {}

class MockDeleteBranchUsecase extends Mock implements DeleteBranchUsecase {}

void main() {
  late BranchCubit branchCubit;
  late MockGetBranchUsecase mockGetBranchUsecase;
  late MockAddBranchUsecase mockAddBranchUsecase;
  late MockDeleteBranchUsecase mockDeleteBranchUsecase;

  setUp(() {
    mockGetBranchUsecase = MockGetBranchUsecase();
    mockAddBranchUsecase = MockAddBranchUsecase();
    mockDeleteBranchUsecase = MockDeleteBranchUsecase();

    branchCubit = BranchCubit(
      getBranchUsecase: mockGetBranchUsecase,
      addBranchUsecase: mockAddBranchUsecase,
      deleteBranchUsecase: mockDeleteBranchUsecase,
    );
  });

  tearDown(() => branchCubit.close());

  group('BranchCubit', () {
    var branchList = [BranchEntity(id: '1', name: 'CS')];
    var error = AppErrorHandler(message: 'Error occurred');

    blocTest<BranchCubit, BranchState>(
      'emits [loading, success] when getBranch succeeds',
      build: () {
        when(() => mockGetBranchUsecase.call(null)).thenAnswer((_) async => Right(branchList));
        return branchCubit;
      },
      act: (cubit) => cubit.getBranch(),
      expect: () => [
        branchCubit.state.copyWith(isLoadingState: true),
        branchCubit.state.copyWith(
          isLoadingState: false,
          isSuccessState: true,
          branchList: branchList,
        ),
      ],
    );

    blocTest<BranchCubit, BranchState>(
      'emits [loading, error] when getBranch fails',
      build: () {
        when(() => mockGetBranchUsecase.call(null)).thenAnswer((_) async => Left(error));
        return branchCubit;
      },
      act: (cubit) => cubit.getBranch(),
      expect: () => [
        branchCubit.state.copyWith(isLoadingState: true),
        branchCubit.state.copyWith(
          errorState: error,
          isLoadingState: false,
        ),
      ],
    );
  });
}
