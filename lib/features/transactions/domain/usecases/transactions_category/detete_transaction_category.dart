import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/usecases/usecase.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_catogory_repository.dart';

@Injectable()
class DeleteTransactionCategory implements UseCase<None, int> {
  final ITransactionCategoryRepository _repository;

  const DeleteTransactionCategory(this._repository);

  @override
  Future<Either<Failure, None>> call(int params) {
    return _repository.deleteTransactionCategory(params);
  }
}
