import 'package:dartz/dartz.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_params.dart';

abstract class ITransactionRepository {
  Future<Either<Failure, Transaction>> addTransaction(AddTransactionParams params);

  Future<Either<Failure, Transaction>> changeTransaction(ChangeTransactionParams params);

  Future<Either<Failure, Transaction>> getTransaction(int id);

  Future<Either<Failure, List<Transaction>>> getTransactions();

  Future<Either<Failure, List<Transaction>>> getTransactionsByType(TransactionType type);

  Future<Either<Failure, List<Transaction>>> getTransactionsByCategoryId(int categoryId);

  Future<Either<Failure, Transaction>> deleteTransaction(int id);
}
