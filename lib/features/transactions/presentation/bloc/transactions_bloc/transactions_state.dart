import 'package:equatable/equatable.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/period_params.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();

  @override
  List<Object> get props => [];
}

class TransactionsEmptyState extends TransactionsState {}

class TransactionsLoadingState extends TransactionsState {}

class TransactionsLoadedState extends TransactionsState {
  final List<Transaction> incomeTransactions;
  final List<Transaction> expenseTransactions;
  final double amount;
  final PeriodParams lastPeriod;

  const TransactionsLoadedState({
    required this.incomeTransactions,
    required this.expenseTransactions,
    required this.amount,
    required this.lastPeriod,
  });

  @override
  List<Object> get props => [incomeTransactions, expenseTransactions, amount];
}

class TransactionsOfCategoryLoadedState extends TransactionsState {
  final List<Transaction> transactions;

  const TransactionsOfCategoryLoadedState({
    required this.transactions,
  });

  @override
  List<Object> get props => [transactions];
}

class TransactionsErrorState extends TransactionsState {
  final String message;

  const TransactionsErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
