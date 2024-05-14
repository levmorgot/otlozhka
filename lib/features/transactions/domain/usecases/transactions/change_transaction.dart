import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/usecases/usecase.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_params.dart';

@Injectable()
class ChangeTransaction implements UseCase<Transaction, ChangeTransactionParams> {
  final ITransactionRepository _repository;

  const ChangeTransaction(this._repository);

  @override
  Future<Either<Failure, Transaction>> call(ChangeTransactionParams params) {
    return _repository.changeTransaction(params);
  }
}
