import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/utils/failure_message.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';

@Injectable()
class TransactionsOfCategoryBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final GetTransactions getTransactions;

  TransactionsOfCategoryBloc({
    required this.getTransactions,
  }) : super(TransactionsEmptyState()) {
    on<GetTransactionsByCategoryEvent>((event, emit) async {
      emit(TransactionsLoadingState());
      final failureOrTransactions = await getTransactions(event.params);

      failureOrTransactions.fold(
          (failure) => emit(TransactionsErrorState(
                message: mapFailureMessage(failure),
              )), (transactions) {
        emit(TransactionsOfCategoryLoadedState(
          transactions: transactions.where((transaction) => transaction.categoryId == event.category.id).toList(),
        ));
      });
    });
  }
}
