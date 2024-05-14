import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/database/transations_db.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_params.dart';

abstract class TransactionSource {
  Future<Either<Failure, Transaction>> addTransaction(AddTransactionParams params);

  Future<Either<Failure, Transaction>> changeTransaction(ChangeTransactionParams params);

  Future<Either<Failure, Transaction>> getTransaction(int id);

  Future<Either<Failure, List<Transaction>>> getTransactions();

  Future<Either<Failure, List<Transaction>>> getTransactionsByType(TransactionType type);

  Future<Either<Failure, List<Transaction>>> getTransactionsByCategoryId(int categoryId);

  Future<Either<Failure, None>> deleteTransaction(int id);
}

@Injectable(as: TransactionSource)
class LocalTransactionSource implements TransactionSource {
  final TransactionsDatabase _database;

  const LocalTransactionSource(this._database);

  @override
  Future<Either<Failure, Transaction>> addTransaction(AddTransactionParams params) {
    return _database.addTransaction(params);
  }

  @override
  Future<Either<Failure, Transaction>> changeTransaction(ChangeTransactionParams params) {
    return _database.changeTransaction(params);
  }

  @override
  Future<Either<Failure, None>> deleteTransaction(int params) {
    return _database.deleteTransaction(params);
  }

  @override
  Future<Either<Failure, Transaction>> getTransaction(int params) {
    return _database.getTransaction(params);
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions() {
    return _database.getTransactions();
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactionsByCategoryId(int categoryId) async {
    return (await _database.getTransactions()).fold(
        (failure) => Left(failure),
        (transactions) => Right(
              transactions.where((transaction) => transaction.categoryId == categoryId).toList(),
            ));
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactionsByType(TransactionType type) async {
    return (await _database.getTransactions()).fold(
        (failure) => Left(failure),
        (transactions) => Right(
              transactions.where((transaction) => transaction.type == type).toList(),
            ));
  }
}
