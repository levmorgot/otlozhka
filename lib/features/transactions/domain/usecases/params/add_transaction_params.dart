import 'package:equatable/equatable.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';

class AddTransactionParams extends Equatable {
  final int categoryId;
  final TransactionType type;
  final double amount;
  final DateTime transactionDate;
  final String? comment;

  const AddTransactionParams({
    required this.categoryId,
    required this.type,
    required this.amount,
    required this.transactionDate,
    this.comment,
  });

  @override
  List<Object?> get props => [
        categoryId,
        type,
        amount,
        transactionDate,
        comment,
      ];
}
