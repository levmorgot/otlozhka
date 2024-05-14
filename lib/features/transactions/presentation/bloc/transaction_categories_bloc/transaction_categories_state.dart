import 'package:equatable/equatable.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';

abstract class TransactionCategoriesState extends Equatable {
  const TransactionCategoriesState();

  @override
  List<Object> get props => [];
}

class TransactionCategoriesEmptyState extends TransactionCategoriesState {}

class TransactionCategoriesLoadingState extends TransactionCategoriesState {}

class TransactionCategoriesLoadedState extends TransactionCategoriesState {
  final List<TransactionCategory> incomeTransactionCategories;
  final List<TransactionCategory> expenseTransactionCategories;

  const TransactionCategoriesLoadedState({
    required this.incomeTransactionCategories,
    required this.expenseTransactionCategories,
  });

  @override
  List<Object> get props => [incomeTransactionCategories, expenseTransactionCategories];
}

class TransactionCategoriesErrorState extends TransactionCategoriesState {
  final String message;

  const TransactionCategoriesErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
