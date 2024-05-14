import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/utils/failure_message.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/add_transaction.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/change_transaction.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transaction.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';

@Singleton()
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final AddTransaction addTransaction;
  final ChangeTransaction changeTransaction;
  final GetTransaction getTransaction;
  final GetTransactions getTransactions;

  TransactionsBloc({
    required this.addTransaction,
    required this.changeTransaction,
    required this.getTransaction,
    required this.getTransactions,
  }) : super(TransactionsEmptyState()) {
    on<AddTransactionEvent>((event, emit) async {
      if (state is TransactionsLoadingState) return;
      final currentState = state;
      emit(TransactionsLoadingState());
      final failureOrTransaction = await addTransaction(event.params);

      failureOrTransaction.fold(
          (failure) => emit(TransactionsErrorState(
                message: mapFailureMessage(failure),
              )), (transaction) {
        if (currentState is TransactionsLoadedState) {
          final incomeTransactions = currentState.incomeTransactions;
          final expenseTransactions = currentState.expenseTransactions;
          if (transaction.type == TransactionType.income) {
            incomeTransactions.add(transaction);
          } else {
            expenseTransactions.add(transaction);
          }
          emit(TransactionsLoadedState(
            incomeTransactions: incomeTransactions,
            expenseTransactions: expenseTransactions,
          ));
        }
      });
    });
    on<ChangeTransactionEvent>((event, emit) async {
      if (state is TransactionsLoadingState) return;
      final currentState = state;
      emit(TransactionsLoadingState());
      final failureOrTransaction = await changeTransaction(event.params);

      failureOrTransaction.fold(
          (failure) => emit(TransactionsErrorState(
                message: mapFailureMessage(failure),
              )), (transaction) {
        if (currentState is TransactionsLoadedState) {
          final incomeTransactions = currentState.incomeTransactions;
          final expenseTransactions = currentState.expenseTransactions;
          if (transaction.type == TransactionType.income) {
            final index = incomeTransactions.indexOf(incomeTransactions.firstWhere((element) => element.id == transaction.id));
            incomeTransactions[index] = transaction;
          } else {
            final index = expenseTransactions.indexOf(incomeTransactions.firstWhere((element) => element.id == transaction.id));
            expenseTransactions[index] = transaction;
          }
          emit(TransactionsLoadedState(
            incomeTransactions: incomeTransactions,
            expenseTransactions: expenseTransactions,
          ));
        }
      });
    });
    on<GetTransactionsEvent>((event, emit) async {
      if (state is TransactionsLoadingState) return;
      final currentState = state;
      emit(TransactionsLoadingState());
      final failureOrTransactions = await getTransactions(const None());

      failureOrTransactions.fold(
          (failure) => emit(TransactionsErrorState(
                message: mapFailureMessage(failure),
              )), (transaction) {
        if (currentState is TransactionsLoadedState) {
          final incomeTransactions = transaction.where((transaction) => transaction.type == TransactionType.income).toList();
          final expenseTransactions = transaction.where((transaction) => transaction.type == TransactionType.expense).toList();
          emit(TransactionsLoadedState(
            incomeTransactions: incomeTransactions,
            expenseTransactions: expenseTransactions,
          ));
        }
      });
    });
  }
}
