import 'package:college_community_main/features/batch/domain/use_case/delete_batch_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'repository_mock.dart';
import 'token.mock.dart';

void main() {
  late DeleteBatchUsecase usecase;
  late MockBatchRepository repository;
  late MockTokenSharedPrefs tokenSharedPrefs;



  setUp((){
    repository = MockBatchRepository();
    tokenSharedPrefs = MockTokenSharedPrefs();
    usecase = DeleteBatchUsecase(batchRepository: repository, tokenSharedPrefs: tokenSharedPrefs,
    );
    
  });
}