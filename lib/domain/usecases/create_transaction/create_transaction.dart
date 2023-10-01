import 'package:flix_movie/data/repositories/transaction/transaction_repository.dart';
import 'package:flix_movie/domain/entities/result/result.dart';
import 'package:flix_movie/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:flix_movie/domain/usecases/usecase.dart';

class CreateTransaction
    implements UseCase<Result<void>, CreateTransactionParam> {
  final TransactionRepository _transactionRepository;

  CreateTransaction({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(CreateTransactionParam params) async {
    var result = await _transactionRepository.createTransaction(
        transaction: params.transaction);

    return switch (result) {
      Success(value: _) => const Result.success(null),
      Failed(:final message) => Result.failed(message)
    };
  }
}
