import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';

class ChangeTransactionCategoryParams extends Equatable {
  final int id;
  final String? name;
  final Color? color;
  final String? icon;

  const ChangeTransactionCategoryParams({
    required this.id,
    this.name,
    this.color,
    this.icon,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        color,
        icon,
      ];
}
