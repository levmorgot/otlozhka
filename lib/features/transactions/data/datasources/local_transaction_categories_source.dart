import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/database/transations_db.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_category_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_category_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_params.dart';

abstract class TransactionCategorySource {
  Future<Either<Failure, TransactionCategory>> addTransactionCategory(AddTransactionCategoryParams params);

  Future<Either<Failure, TransactionCategory>> changeTransactionCategory(ChangeTransactionCategoryParams params);

  Future<Either<Failure, TransactionCategory>> getTransactionCategory(int params);

  Future<Either<Failure, List<TransactionCategory>>> getTransactionCategories();

  Future<Either<Failure, List<TransactionCategory>>> getTransactionCategoriesByType(TransactionType type);

  Future<Either<Failure, None>> deleteTransactionCategory(int params);
}

@Injectable(as: TransactionCategorySource)
class LocalTransactionCategorySource implements TransactionCategorySource {
  final TransactionsDatabase _database;

  const LocalTransactionCategorySource(this._database);

  @override
  Future<Either<Failure, TransactionCategory>> addTransactionCategory(AddTransactionCategoryParams params) {
    return _database.addTransactionCategory(params);
  }

  @override
  Future<Either<Failure, TransactionCategory>> changeTransactionCategory(ChangeTransactionCategoryParams params) {
    return _database.changeTransactionCategory(params);
  }

  @override
  Future<Either<Failure, None>> deleteTransactionCategory(int params) {
    return _database.deleteTransactionCategory(params);
  }

  @override
  Future<Either<Failure, TransactionCategory>> getTransactionCategory(int params) {
    return _database.getTransactionCategory(params);
  }

  @override
  Future<Either<Failure, List<TransactionCategory>>> getTransactionCategories() {
    return _database.getTransactionCategories();
  }

  @override
  Future<Either<Failure, List<TransactionCategory>>> getTransactionCategoriesByType(TransactionType type) async {
    return (await _database.getTransactionCategories()).fold(
        (failure) => Left(failure),
        (categories) => Right(
              categories.where((category) => category.type == type).toList(),
            ));
  }
}
