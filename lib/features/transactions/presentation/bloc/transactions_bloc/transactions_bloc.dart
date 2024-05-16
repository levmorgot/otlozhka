import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/utils/app_logger.dart';
import 'package:otlozhka/core/utils/failure_message.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/add_transaction.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/change_transaction.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/detete_transaction.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';

@LazySingleton()
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final AddTransaction addTransaction;
  final ChangeTransaction changeTransaction;
  final DeleteTransaction deleteTransaction;
  final GetTransactions getTransactions;

  TransactionsBloc({
    required this.addTransaction,
    required this.changeTransaction,
    required this.deleteTransaction,
    required this.getTransactions,
  }) : super(TransactionsEmptyState()) {
    on<AddTransactionEvent>((event, emit) async {
      if (state is TransactionsLoadingState) return;
      final currentState = state;
      emit(TransactionsLoadingState());
      final failureOrTransaction = await addTransaction(event.params);
      log(event.params);
      failureOrTransaction.fold(
          (failure) => emit(TransactionsErrorState(
                message: mapFailureMessage(failure),
              )), (transaction) {
        final incomeTransactions = <Transaction>[];
        final expenseTransactions = <Transaction>[];
        if (currentState is TransactionsLoadedState) {
          incomeTransactions.addAll(currentState.incomeTransactions);
          expenseTransactions.addAll(currentState.expenseTransactions);
        }
        if (transaction.type == TransactionType.income) {
          incomeTransactions.add(transaction);
        } else {
          expenseTransactions.add(transaction);
        }
        emit(TransactionsLoadedState(
          incomeTransactions: incomeTransactions,
          expenseTransactions: expenseTransactions,
        ));
      });
    });
    on<ChangeTransactionEvent>((event, emit) async {
      log('ChangeTransactionEvent $state');
      if (state is TransactionsLoadingState) return;
      final currentState = state;
      emit(TransactionsLoadingState());

      final failureOrTransaction = await changeTransaction(event.params);

      failureOrTransaction.fold(
          (failure) => emit(TransactionsErrorState(
                message: mapFailureMessage(failure),
              )), (transaction) {
        log(transaction);
        final incomeTransactions = <Transaction>[];
        final expenseTransactions = <Transaction>[];
        if (currentState is TransactionsLoadedState) {
          incomeTransactions.addAll(currentState.incomeTransactions);
          expenseTransactions.addAll(currentState.expenseTransactions);
        }
        log(expenseTransactions);
        if (event.params.type != null) {
          if (event.params.type == TransactionType.income) {
            final index = expenseTransactions.indexOf(expenseTransactions.firstWhere((element) => element.id == event.params.id));
            incomeTransactions.add(transaction);
            expenseTransactions.removeAt(index);
          } else {
            final index = incomeTransactions.indexOf(incomeTransactions.firstWhere((element) => element.id == event.params.id));
            expenseTransactions.add(transaction);
            incomeTransactions.removeAt(index);
          }
        } else if (transaction.type == TransactionType.income) {
          final index = incomeTransactions.indexOf(incomeTransactions.firstWhere((element) => element.id == event.params.id));
          incomeTransactions[index] = transaction;
        } else {
          final index = expenseTransactions.indexOf(expenseTransactions.firstWhere((element) => element.id == event.params.id));
          expenseTransactions[index] = transaction;
        }
        emit(TransactionsLoadedState(
          incomeTransactions: incomeTransactions,
          expenseTransactions: expenseTransactions,
        ));
      });
    });
    on<GetTransactionsEvent>((event, emit) async {
      if (state is TransactionsLoadingState) return;
      emit(TransactionsLoadingState());
      final failureOrTransactions = await getTransactions(const None());

      failureOrTransactions.fold(
          (failure) => emit(TransactionsErrorState(
                message: mapFailureMessage(failure),
              )), (transaction) {
        final incomeTransactions = transaction.where((transaction) => transaction.type == TransactionType.income).toList();
        final expenseTransactions = transaction.where((transaction) => transaction.type == TransactionType.expense).toList();
        emit(TransactionsLoadedState(
          incomeTransactions: incomeTransactions,
          expenseTransactions: expenseTransactions,
        ));
      });
    });
    on<DeleteTransactionEvent>((event, emit) async {
      if (state is TransactionsLoadingState) return;
      final currentState = state;
      emit(TransactionsLoadingState());
      final failureOrTransactions = await deleteTransaction(event.id);

      failureOrTransactions.fold(
          (failure) => emit(TransactionsErrorState(
                message: mapFailureMessage(failure),
              )), (transaction) {
        final incomeTransactions = <Transaction>[];
        final expenseTransactions = <Transaction>[];
        if (currentState is TransactionsLoadedState) {
          incomeTransactions.addAll(currentState.incomeTransactions);
          expenseTransactions.addAll(currentState.expenseTransactions);
        }

        if (transaction.type == TransactionType.income) {
          incomeTransactions.remove(transaction);
        } else {
          expenseTransactions.remove(transaction);
        }
        emit(TransactionsLoadedState(
          incomeTransactions: incomeTransactions,
          expenseTransactions: expenseTransactions,
        ));
      });
    });
  }
}
