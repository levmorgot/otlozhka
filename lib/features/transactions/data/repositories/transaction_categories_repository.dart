import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/features/transactions/data/datasources/local_transaction_categories_source.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_catogory_repository.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_category_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_category_params.dart';

@Injectable(as: ITransactionCategoryRepository)
class TransactionCategoryRepository implements ITransactionCategoryRepository {
  final TransactionCategorySource _source;
  const TransactionCategoryRepository(this._source);

  @override
  Future<Either<Failure, TransactionCategory>> addTransactionCategory(AddTransactionCategoryParams params) {
    return _source.addTransactionCategory(params);
  }

  @override
  Future<Either<Failure, TransactionCategory>> changeTransactionCategory(ChangeTransactionCategoryParams params) {
    return _source.changeTransactionCategory(params);
  }

  @override
  Future<Either<Failure, TransactionCategory>> getTransactionCategory(int id) {
    return _source.getTransactionCategory(id);
  }

  @override
  Future<Either<Failure, List<TransactionCategory>>> getTransactionCategories() {
    return _source.getTransactionCategories();
  }

  @override
  Future<Either<Failure, None>> deleteTransactionCategory(int id) {
    return _source.deleteTransactionCategory(id);
  }

  @override
  Future<Either<Failure, List<TransactionCategory>>> getTransactionCategoriesByType(TransactionType type) {
    return _source.getTransactionCategoriesByType(type);
  }

}
