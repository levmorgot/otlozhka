import 'package:flutter/material.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';

class CategoryIcon extends StatelessWidget {
  final TransactionCategory category;
  final double radius;

  const CategoryIcon({super.key, required this.category, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: category.color,
      radius: radius,
      child: Image.asset(category.icon, width: radius, height: radius,),
    );
  }
}
