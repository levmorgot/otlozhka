import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/category_icon.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final TransactionCategory category;

  const TransactionCard({super.key, required this.category, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8.0),
        ) ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CategoryIcon(category: category, radius: 20),
            const Gap(10),
            Text(
              category.name,
            ),
            const Spacer(),
            Text('${transaction.type == TransactionType.income ? '+' : '-'}${transaction.amount} ₽')
          ],
        ),
      ),
    );
  }
}
