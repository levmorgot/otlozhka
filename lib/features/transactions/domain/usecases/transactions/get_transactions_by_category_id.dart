import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/usecases/usecase.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_repository.dart';

@Injectable()
class GetTransactionByCategoryId implements UseCase<List<Transaction>, int> {
  final ITransactionRepository _repository;

  const GetTransactionByCategoryId(this._repository);

  @override
  Future<Either<Failure, List<Transaction>>> call(int params) {
    return _repository.getTransactionsByCategoryId(params);
  }
}
