import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/usecases/usecase.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_params.dart';

@Injectable()
class AddTransaction implements UseCase<Transaction, AddTransactionParams> {
  final ITransactionRepository _repository;

  const AddTransaction(this._repository);

  @override
  Future<Either<Failure, Transaction>> call(AddTransactionParams params) {
    return _repository.addTransaction(params);
  }
}
