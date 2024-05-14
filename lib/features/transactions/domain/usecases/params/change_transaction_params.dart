import 'package:equatable/equatable.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';

class ChangeTransactionParams extends Equatable {
  final int id;
  final int? categoryId;
  final TransactionType? type;
  final String? name;
  final double? amount;
  final DateTime? transactionDate;
  final String? comment;

  const ChangeTransactionParams({
    required this.id,
    this.categoryId,
    this.type,
    this.name,
    this.amount,
    this.transactionDate,
    this.comment,
  });

  @override
  List<Object?> get props => [
        id,
        categoryId,
        type,
        name,
        amount,
        transactionDate,
        comment,
      ];
}
