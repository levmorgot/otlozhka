import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/usecases/usecase.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_repository.dart';

@Injectable()
class GetTransactionByType implements UseCase<List<Transaction>, TransactionType> {
  final ITransactionRepository _repository;

  const GetTransactionByType(this._repository);

  @override
  Future<Either<Failure, List<Transaction>>> call(TransactionType params) {
    return _repository.getTransactionsByType(params);
  }
}
