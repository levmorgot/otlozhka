import 'package:equatable/equatable.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_category_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_category_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_params.dart';

abstract class TransactionCategoriesEvent extends Equatable {
  const TransactionCategoriesEvent();

  @override
  List<Object> get props => [];
}

class AddTransactionCategoryEvent extends TransactionCategoriesEvent {
  final AddTransactionCategoryParams params;

  const AddTransactionCategoryEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class ChangeTransactionCategoryEvent extends TransactionCategoriesEvent {
  final ChangeTransactionCategoryParams params;

  const ChangeTransactionCategoryEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class GetTransactionCategoryEvent extends TransactionCategoriesEvent {
  final int id;

  const GetTransactionCategoryEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class GetTransactionCategoriesEvent extends TransactionCategoriesEvent {}

