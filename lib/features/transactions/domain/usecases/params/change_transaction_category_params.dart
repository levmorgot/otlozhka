import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ChangeTransactionCategoryParams extends Equatable {
  final int id;
  final String? name;
  final Color? color;
  final String? icon;
  final double? maxMonthAmount;

  const ChangeTransactionCategoryParams({
    required this.id,
    this.name,
    this.color,
    this.icon,
    this.maxMonthAmount,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        color,
        icon,
        maxMonthAmount,
      ];
}
