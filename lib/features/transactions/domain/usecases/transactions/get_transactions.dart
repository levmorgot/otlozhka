import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/usecases/usecase.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/period_params.dart';

@Injectable()
class GetTransactions implements UseCase<List<Transaction>, PeriodParams> {
  final ITransactionRepository _repository;

  const GetTransactions(this._repository);

  @override
  Future<Either<Failure, List<Transaction>>> call(PeriodParams params) {
    return _repository.getTransactions(params);
  }
}
