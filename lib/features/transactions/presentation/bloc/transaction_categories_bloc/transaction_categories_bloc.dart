import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/utils/failure_message.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/add_transaction_category.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/change_transaction_category.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgories.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgory.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';

@Singleton()
class TransactionCategoriesBloc extends Bloc<TransactionCategoriesEvent, TransactionCategoriesState> {
  final AddTransactionCategory addTransactionCategory;
  final ChangeTransactionCategory changeTransactionCategory;
  final GetTransactionCategory getTransactionCategory;
  final GetTransactionCategories getTransactionCategories;

  TransactionCategoriesBloc({
    required this.addTransactionCategory,
    required this.changeTransactionCategory,
    required this.getTransactionCategory,
    required this.getTransactionCategories,
  }) : super(TransactionCategoriesEmptyState()) {
    on<AddTransactionCategoryEvent>((event, emit) async {
      if (state is TransactionCategoriesLoadingState) return;
      final currentState = state;
      emit(TransactionCategoriesLoadingState());
      final failureOrTransaction = await addTransactionCategory(event.params);

      failureOrTransaction.fold(
          (failure) => emit(TransactionCategoriesErrorState(
                message: mapFailureMessage(failure),
              )), (transaction) {
        if (currentState is TransactionCategoriesLoadedState) {
          final incomeTransactionCategories = currentState.incomeTransactionCategories;
          final expenseTransactionCategories = currentState.expenseTransactionCategories;
          if (transaction.type == TransactionType.income) {
            incomeTransactionCategories.add(transaction);
          } else {
            expenseTransactionCategories.add(transaction);
          }
          emit(TransactionCategoriesLoadedState(
            incomeTransactionCategories: incomeTransactionCategories,
            expenseTransactionCategories: expenseTransactionCategories,
          ));
        }
      });
    });
    on<ChangeTransactionCategoryEvent>((event, emit) async {
      if (state is TransactionCategoriesLoadingState) return;
      final currentState = state;
      emit(TransactionCategoriesLoadingState());
      final failureOrTransaction = await changeTransactionCategory(event.params);

      failureOrTransaction.fold(
          (failure) => emit(TransactionCategoriesErrorState(
                message: mapFailureMessage(failure),
              )), (transaction) {
        if (currentState is TransactionCategoriesLoadedState) {
          final incomeTransactionCategories = currentState.incomeTransactionCategories;
          final expenseTransactionCategories = currentState.expenseTransactionCategories;
          if (transaction.type == TransactionType.income) {
            final index = incomeTransactionCategories.indexOf(incomeTransactionCategories.firstWhere((element) => element.id == transaction.id));
            incomeTransactionCategories[index] = transaction;
          } else {
            final index = expenseTransactionCategories.indexOf(incomeTransactionCategories.firstWhere((element) => element.id == transaction.id));
            expenseTransactionCategories[index] = transaction;
          }
          emit(TransactionCategoriesLoadedState(
            incomeTransactionCategories: incomeTransactionCategories,
            expenseTransactionCategories: expenseTransactionCategories,
          ));
        }
      });
    });
    on<GetTransactionCategoriesEvent>((event, emit) async {
      if (state is TransactionCategoriesLoadingState) return;
      final currentState = state;
      emit(TransactionCategoriesLoadingState());
      final failureOrTransactionCategories = await getTransactionCategories(const None());

      failureOrTransactionCategories.fold(
          (failure) => emit(TransactionCategoriesErrorState(
                message: mapFailureMessage(failure),
              )), (transaction) {
        if (currentState is TransactionCategoriesLoadedState) {
          final incomeTransactionCategories = transaction.where((transaction) => transaction.type == TransactionType.income).toList();
          final expenseTransactionCategories = transaction.where((transaction) => transaction.type == TransactionType.expense).toList();
          emit(TransactionCategoriesLoadedState(
            incomeTransactionCategories: incomeTransactionCategories,
            expenseTransactionCategories: expenseTransactionCategories,
          ));
        }
      });
    });
  }
}
