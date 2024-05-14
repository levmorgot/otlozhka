import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/usecases/usecase.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_catogory_repository.dart';

@Injectable()
class GetTransactionCategoriesByType implements UseCase<List<TransactionCategory>, TransactionType> {
  final ITransactionCategoryRepository _repository;

  const GetTransactionCategoriesByType(this._repository);

  @override
  Future<Either<Failure, List<TransactionCategory>>> call(TransactionType params) {
    return _repository.getTransactionCategoriesByType(params);
  }
}
