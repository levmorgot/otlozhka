import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/category_icon.dart';
import 'package:otlozhka/routes/router.gr.dart';

@RoutePage()
class TransactionPage extends StatelessWidget {
  final Transaction transaction;
  final TransactionCategory category;
  const TransactionPage({super.key, required this.transaction, required this.category});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Транзакиця'),
        ),
        body: Column(children: [
          const Text('Тип'),
          Text(category.type == TransactionType.income ? 'Доходы' : 'Расходы'),
          const Text('Категория'),
          InkWell(
            onTap: () {
              AutoRouter.of(context).push(TransactionCategoryRoute(category: category));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryIcon(category: category, radius: 20),
                const Gap(10),
                Text(category.name)
              ],
            ),
          ),
          TextButton(onPressed: () {
            AutoRouter.of(context).push(FormTransactionRoute(type: transaction.type, transaction: transaction));

          }, child: const Text('Редактировать'))
        ],)
      ),
    );
  }
}
