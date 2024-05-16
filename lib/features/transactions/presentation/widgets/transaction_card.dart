import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/category_icon.dart';
import 'package:otlozhka/routes/router.gr.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final TransactionCategory category;

  const TransactionCard({super.key, required this.category, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(TransactionRoute(transaction: transaction, category: category));
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CategoryIcon(category: category, radius: 20),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                  ),
                  Text(
                    DateFormat(DateTime.now().year > transaction.transactionDate.year ? 'dd.MM.yy' : 'dd.MM').format(transaction.transactionDate),
                  ),
                ],
              ),
              const Spacer(),
              Text('${transaction.type == TransactionType.income ? '+' : '-'}${transaction.amount} ₽')
            ],
          ),
        ),
      ),
    );
  }
}
