import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';
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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Сумма',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${transaction.amount.toStringAsFixed(2)} ₽',
                  style: TextStyle(
                    color: transaction.type == TransactionType.income ? Colors.green : Colors.red,
                  ),
                ),
                const Gap(20),
                const Text(
                  'Категория',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                InkWell(
                  onTap: () {
                    AutoRouter.of(context).push(TransactionCategoryRoute(category: category));
                  },
                  child: Row(
                    children: [CategoryIcon(category: category, radius: 20), const Gap(10), Text(category.name)],
                  ),
                ),
                const Gap(40),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          AutoRouter.of(context).push(FormTransactionRoute(type: transaction.type, transaction: transaction));
                        },
                        child: const Text(
                          'Редактировать',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Gap(20),
                      TextButton(
                        onPressed: () {
                          getIt<TransactionsBloc>().add(DeleteTransactionEvent(id: transaction.id));
                          AutoRouter.of(context).maybePop();
                        },
                        child: const Text(
                          'Удалить',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
