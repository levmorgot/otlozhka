import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/utils/app_logger.dart';
import 'package:otlozhka/core/utils/failure_message.dart';
import 'package:otlozhka/core/utils/periods.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/period_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/add_transaction.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/change_transaction.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/detete_transaction.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';

@Injectable()
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
        PeriodParams? lastPeriod;
        if (currentState is TransactionsLoadedState) {
          incomeTransactions.addAll(currentState.incomeTransactions);
          expenseTransactions.addAll(currentState.expenseTransactions);
          lastPeriod = currentState.lastPeriod;
        }

        add(GetTransactionsEvent(params: lastPeriod ?? oneWeek()));
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
        final incomeTransactions = <Transaction>[];
        final expenseTransactions = <Transaction>[];
        PeriodParams? lastPeriod;
        if (currentState is TransactionsLoadedState) {
          incomeTransactions.addAll(currentState.incomeTransactions);
          expenseTransactions.addAll(currentState.expenseTransactions);
          lastPeriod = currentState.lastPeriod;
        }

        add(GetTransactionsEvent(params: lastPeriod ?? oneWeek()));
      });
    });
    on<GetTransactionsEvent>((event, emit) async {
      // if (state is TransactionsLoadingState) return;
      emit(TransactionsLoadingState());
      final failureOrTransactions = await getTransactions(event.params);

      failureOrTransactions.fold(
          (failure) => emit(TransactionsErrorState(
                message: mapFailureMessage(failure),
              )), (transactions) {
        final incomeTransactions = transactions.where((transaction) => transaction.type == TransactionType.income).toList();
        final expenseTransactions = transactions.where((transaction) => transaction.type == TransactionType.expense).toList();
        emit(TransactionsLoadedState(
          incomeTransactions: incomeTransactions,
          expenseTransactions: expenseTransactions,
          lastPeriod: event.params,
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
        PeriodParams? lastPeriod;
        if (currentState is TransactionsLoadedState) {
          incomeTransactions.addAll(currentState.incomeTransactions);
          expenseTransactions.addAll(currentState.expenseTransactions);
          lastPeriod = currentState.lastPeriod;
        }

        if (transaction.type == TransactionType.income) {
          incomeTransactions.remove(transaction);
        } else {
          expenseTransactions.remove(transaction);
        }
        emit(TransactionsLoadedState(
          incomeTransactions: incomeTransactions,
          expenseTransactions: expenseTransactions,
          lastPeriod: lastPeriod ?? oneWeek(),
        ));
      });
    });
  }
}
