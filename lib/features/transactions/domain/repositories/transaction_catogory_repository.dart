import 'package:dartz/dartz.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_category_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_category_params.dart';

abstract class ITransactionCategoryRepository {
  Future<Either<Failure, TransactionCategory>> addTransactionCategory(AddTransactionCategoryParams params);

  Future<Either<Failure, TransactionCategory>> changeTransactionCategory(ChangeTransactionCategoryParams params);

  Future<Either<Failure, TransactionCategory>> getTransactionCategory(int id);

  Future<Either<Failure, List<TransactionCategory>>> getTransactionCategories();

  Future<Either<Failure, List<TransactionCategory>>> getTransactionCategoriesByType(TransactionType type);

  Future<Either<Failure, None>> deleteTransactionCategory(int id);
}
