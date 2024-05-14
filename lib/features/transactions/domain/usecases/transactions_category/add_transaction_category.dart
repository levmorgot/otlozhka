import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/usecases/usecase.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_catogory_repository.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_category_params.dart';

@Injectable()
class AddTransactionCategory implements UseCase<TransactionCategory, AddTransactionCategoryParams> {
  final ITransactionCategoryRepository _repository;

  const AddTransactionCategory(this._repository);

  @override
  Future<Either<Failure, TransactionCategory>> call(AddTransactionCategoryParams params) {
    return _repository.addTransactionCategory(params);
  }
}
