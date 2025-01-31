import 'package:college_community_main/core/error/failure.dart';
import 'package:college_community_main/features/batch/data/data_source/remote_datasource/batch_remote_datasource.dart';
import 'package:college_community_main/features/batch/domain/entity/batch_entity.dart';
import 'package:college_community_main/features/batch/domain/repository/batch_repository.dart';
import 'package:dartz/dartz.dart';


class BatchRemoteRepository implements IBatchRepository {
  final BatchRemoteDataSource remoteDataSource;

  BatchRemoteRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> createBatch(BatchEntity batch) async {
    try {
      remoteDataSource.createBatch(batch);
      return Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteBatch(String id, String? token) async {
    try {
      remoteDataSource.deleteBatch(id, token);
      return Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getBatches() async {
    try {
      final batches = await remoteDataSource.getBatches();
      return Right(batches);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
