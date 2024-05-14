import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/usecases/usecase.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_catogory_repository.dart';

@Injectable()
class GetTransactionCategory implements UseCase<TransactionCategory, int> {
  final ITransactionCategoryRepository _repository;

  const GetTransactionCategory(this._repository);

  @override
  Future<Either<Failure, TransactionCategory>> call(int params) {
    return _repository.getTransactionCategory(params);
  }
}
