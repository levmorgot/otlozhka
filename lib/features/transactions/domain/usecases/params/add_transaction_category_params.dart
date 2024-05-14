import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';

class AddTransactionCategoryParams extends Equatable {
  final TransactionType type;
  final String? name;
  final Color color;
  final String icon;
  final double? maxMonthAmount;

  const AddTransactionCategoryParams({
    required this.type,
    this.name,
    required this.color,
    required this.icon,
    this.maxMonthAmount,
  });

  @override
  List<Object?> get props => [
        type,
        name,
        color,
        icon,
        maxMonthAmount,
      ];
}
