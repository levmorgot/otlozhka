import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/features/transactions/data/datasources/local_transactions_source.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_params.dart';

@Injectable(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository {
  final TransactionSource _source;
  const TransactionRepository(this._source);

  @override
  Future<Either<Failure, Transaction>> addTransaction(AddTransactionParams params) {
    return _source.addTransaction(params);
  }

  @override
  Future<Either<Failure, Transaction>> changeTransaction(ChangeTransactionParams params) {
    return _source.changeTransaction(params);
  }

  @override
  Future<Either<Failure, None>> deleteTransaction(int params) {
    return _source.deleteTransaction(params);
  }

  @override
  Future<Either<Failure, Transaction>> getTransaction(int params) {
    return _source.getTransaction(params);
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions() {
    return _source.getTransactions();
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactionsByCategoryId(int categoryId) {
    return _source.getTransactionsByCategoryId(categoryId);
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactionsByType(TransactionType type) {
    return _source.getTransactionsByType(type);
  }
}
