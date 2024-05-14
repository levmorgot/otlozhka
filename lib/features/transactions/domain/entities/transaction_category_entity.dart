import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:otlozhka/core/utils/enum.dart';
import 'package:otlozhka/core/utils/extensoins.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/generated/assets.gen.dart';

const String tableTransactionCategories = 'transaction_categories';

class TransactionCategoryFields {
  static const String id = 'id';
  static const String type = 'type';
  static const String name = 'name';
  static const String color = 'color';
  static const String icon = 'icon';
  static const String maxMonthAmount = 'max_month_amount';
  static const String createdAt = 'created_at';

  static List<String> get values => [
        id,
        type,
        name,
        color,
        icon,
        createdAt,
      ];
}

class TransactionCategory extends Equatable {
  final int id;
  final TransactionType type;
  final String name;
  final Color color;
  final String icon;
  final double? maxMonthAmount;
  final DateTime createdAt;

  const TransactionCategory({
    required this.id,
    required this.type,
    required this.name,
    required this.color,
    required this.icon,
    this.maxMonthAmount,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        name,
        color,
        icon,
        maxMonthAmount,
      ];

  factory TransactionCategory.fromJson(Map<String, dynamic> json) {
    return TransactionCategory(
      id: json[TransactionCategoryFields.id],
      type: EnumUtil.fromString(json[TransactionCategoryFields.type], TransactionType.values),
      name: json[TransactionCategoryFields.name],
      color: HexColor.fromHex(json[TransactionCategoryFields.color]),
      icon: json[TransactionCategoryFields.icon],
      maxMonthAmount: json[TransactionCategoryFields.maxMonthAmount],
      createdAt: DateTime.parse(json[TransactionCategoryFields.createdAt]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TransactionCategoryFields.id: id,
      TransactionCategoryFields.type: EnumUtil.toJson(type),
      TransactionCategoryFields.name: name,
      TransactionCategoryFields.color: color.toHex(),
      TransactionCategoryFields.icon: icon,
      TransactionCategoryFields.maxMonthAmount: maxMonthAmount,
      TransactionCategoryFields.createdAt: createdAt.toIso8601String(),
    };
  }

  TransactionCategory copyWith({
    TransactionType? type,
    String? name,
    Color? color,
    String? icon,
    double? maxMonthAmount,
  }) =>
      TransactionCategory(
        id: id,
        type: type ?? this.type,
        name: name ?? this.name,
        color: color ?? this.color,
        icon: icon ?? this.icon,
        maxMonthAmount: maxMonthAmount ?? this.maxMonthAmount,
        createdAt: createdAt,
      );

  static TransactionCategory otherCategory(TransactionType type) {
    return TransactionCategory(
      id: type == TransactionType.income ? 11 : 10,
      type: type,
      name: 'Другое',
      icon: Assets.images.transactions.other.path,
      color: Colors.blueGrey[200]!,
      createdAt: DateTime(2024),
    );
  }
}
