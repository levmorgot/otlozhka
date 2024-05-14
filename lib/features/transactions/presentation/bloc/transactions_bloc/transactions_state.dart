import 'package:equatable/equatable.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';

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

  const TransactionsLoadedState({
    required this.incomeTransactions,
    required this.expenseTransactions,
  });

  @override
  List<Object> get props => [incomeTransactions, expenseTransactions];
}

class TransactionsErrorState extends TransactionsState {
  final String message;

  const TransactionsErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
