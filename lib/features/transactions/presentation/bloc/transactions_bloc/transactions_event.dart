import 'package:equatable/equatable.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_params.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

class AddTransactionEvent extends TransactionsEvent {
  final AddTransactionParams params;

  const AddTransactionEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class ChangeTransactionEvent extends TransactionsEvent {
  final ChangeTransactionParams params;

  const ChangeTransactionEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class GetTransactionEvent extends TransactionsEvent {
  final int id;

  const GetTransactionEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class GetTransactionsEvent extends TransactionsEvent {}

