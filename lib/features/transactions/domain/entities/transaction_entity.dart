import 'package:equatable/equatable.dart';
import 'package:otlozhka/core/utils/enum.dart';

const String tableTransactions = 'transactions';

class TransactionFields {
  static const String id = 'id';
  static const String categoryId = 'category_id';
  static const String type = 'type';
  static const String name = 'name';
  static const String amount = 'amount';
  static const String transactionDate = 'transaction_date';
  static const String createdAt = 'created_at';
  static const String comment = 'comment';

  static List<String> get values => [
        id,
        categoryId,
        name,
        amount,
        transactionDate,
        createdAt,
        comment,
      ];
}

enum TransactionType {
  income,
  expense,
}

class Transaction extends Equatable {
  final int id;
  final int categoryId;
  final TransactionType? type;
  final String name;
  final double amount;
  final DateTime transactionDate;
  final DateTime createdAt;
  final String comment;

  const Transaction({
    required this.id,
    required this.categoryId,
    this.type,
    this.name = '',
    required this.amount,
    required this.transactionDate,
    required this.createdAt,
    this.comment = '',
  });

  @override
  List<Object?> get props => [
        id,
        categoryId,
        type,
        name,
        amount,
        transactionDate,
        createdAt,
        comment,
      ];

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json[TransactionFields.id],
      categoryId: json[TransactionFields.categoryId],
      type: EnumUtil.fromString(json[TransactionFields.type], TransactionType.values),
      name: json[TransactionFields.name],
      amount: json[TransactionFields.amount],
      createdAt: DateTime.parse(json[TransactionFields.createdAt]),
      transactionDate: DateTime.parse(json[TransactionFields.transactionDate]),
      comment: json[TransactionFields.comment],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TransactionFields.id: id,
      TransactionFields.categoryId: categoryId,
      TransactionFields.type: type != null ? EnumUtil.toJson(type!) : null,
      TransactionFields.name: name,
      TransactionFields.amount: amount,
      TransactionFields.transactionDate: transactionDate.toIso8601String(),
      TransactionFields.createdAt: createdAt.toIso8601String(),
      TransactionFields.comment: comment,
    };
  }

  Transaction copyWith({
    int? categoryId,
    TransactionType? type,
    String? name,
    double? amount,
    DateTime? transactionDate,
    String? comment,
  }) =>
      Transaction(
        id: id,
        categoryId: categoryId ?? this.categoryId,
        type: type ?? this.type,
        name: name ?? this.name,
        amount: amount ?? this.amount,
        transactionDate: transactionDate ?? this.transactionDate,
        createdAt: createdAt,
        comment: comment ?? this.comment,
      );
}
