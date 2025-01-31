import 'package:college_community_main/app/usecase/usecase.dart';
import 'package:college_community_main/core/error/failure.dart';
import 'package:college_community_main/features/batch/domain/entity/batch_entity.dart';
import 'package:college_community_main/features/batch/domain/repository/batch_repository.dart';
import 'package:dartz/dartz.dart';


class GetAllBatchUseCase implements UsecaseWithoutParams<List<BatchEntity>> {
  final IBatchRepository batchRepository;

  GetAllBatchUseCase({required this.batchRepository});

  @override
  Future<Either<Failure, List<BatchEntity>>> call() {
    return batchRepository.getBatches();
  }
}
