import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/utils/app_logger.dart';
import 'package:otlozhka/core/utils/failure_message.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/add_transaction_category.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/change_transaction_category.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgories.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgory.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';

@LazySingleton()
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
              )), (category) {
        final incomeTransactionCategories = <TransactionCategory>[];
        final expenseTransactionCategories = <TransactionCategory>[];
        if (currentState is TransactionCategoriesLoadedState) {
          incomeTransactionCategories.addAll(currentState.incomeTransactionCategories);
          expenseTransactionCategories.addAll(currentState.expenseTransactionCategories);
        }
        if (category.type == TransactionType.income) {
          incomeTransactionCategories.add(category);
        } else {
          expenseTransactionCategories.add(category);
        }
        emit(TransactionCategoriesLoadedState(
          incomeTransactionCategories: incomeTransactionCategories,
          expenseTransactionCategories: expenseTransactionCategories,
        ));
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
              )), (category) {
        final incomeTransactionCategories = <TransactionCategory>[];
        final expenseTransactionCategories = <TransactionCategory>[];
        if (currentState is TransactionCategoriesLoadedState) {
          incomeTransactionCategories.addAll(currentState.incomeTransactionCategories);
          expenseTransactionCategories.addAll(currentState.expenseTransactionCategories);
        }
        log(incomeTransactionCategories);
        log(expenseTransactionCategories);
        if (category.type == TransactionType.income) {

          final index = incomeTransactionCategories.indexOf(incomeTransactionCategories.firstWhere((element) => element.id == category.id));
          incomeTransactionCategories[index] = category;
        } else {
          final index = expenseTransactionCategories.indexOf(expenseTransactionCategories.firstWhere((element) => element.id == category.id));
          expenseTransactionCategories[index] = category;
        }
        emit(TransactionCategoriesLoadedState(
          incomeTransactionCategories: incomeTransactionCategories,
          expenseTransactionCategories: expenseTransactionCategories,
        ));
      });
    });
    on<GetTransactionCategoriesEvent>((event, emit) async {
      if (state is TransactionCategoriesLoadingState) return;
      emit(TransactionCategoriesLoadingState());
      final failureOrTransactionCategories = await getTransactionCategories(const None());

      failureOrTransactionCategories.fold(
          (failure) => emit(TransactionCategoriesErrorState(
                message: mapFailureMessage(failure),
              )), (transaction) {
        final incomeTransactionCategories = transaction.where((transaction) => transaction.type == TransactionType.income).toList();
        final expenseTransactionCategories = transaction.where((transaction) => transaction.type == TransactionType.expense).toList();
        emit(TransactionCategoriesLoadedState(
          incomeTransactionCategories: incomeTransactionCategories,
          expenseTransactionCategories: expenseTransactionCategories,
        ));
      });
    });
  }
}
