import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/usecases/usecase.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_catogory_repository.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_category_params.dart';

@Injectable()
class ChangeTransactionCategory implements UseCase<TransactionCategory, ChangeTransactionCategoryParams> {
  final ITransactionCategoryRepository _repository;

  const ChangeTransactionCategory(this._repository);

  @override
  Future<Either<Failure, TransactionCategory>> call(ChangeTransactionCategoryParams params) {
    return _repository.changeTransactionCategory(params);
  }
}
