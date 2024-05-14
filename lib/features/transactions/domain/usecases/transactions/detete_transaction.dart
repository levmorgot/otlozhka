import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/usecases/usecase.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_repository.dart';

@Injectable()
class DeleteTransaction implements UseCase<None, int> {
  final ITransactionRepository _repository;

  const DeleteTransaction(this._repository);

  @override
  Future<Either<Failure, None>> call(int params) {
    return _repository.deleteTransaction(params);
  }
}
