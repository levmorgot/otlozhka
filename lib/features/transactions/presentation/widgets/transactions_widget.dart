import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/animated_cart_widget.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/transaction_card.dart';

class TransactionsWidget extends StatelessWidget {
  final TransactionType type;

  const TransactionsWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<TransactionCategoriesBloc, TransactionCategoriesState>(builder: (context, state) {
        if (state is TransactionCategoriesLoadedState) {
          return BlocBuilder<TransactionsBloc, TransactionsState>(builder: (context, transactionsState) {
            if (transactionsState is TransactionsLoadedState) {
              final ScrollController scrollController = ScrollController();
              final transactions = type == TransactionType.income ? transactionsState.incomeTransactions : transactionsState.expenseTransactions;
              final typeCategories = transactions.firstOrNull?.type == TransactionType.income ? state.incomeTransactionCategories : state.expenseTransactionCategories;
              final transactionsCategoryIds = transactions.map((transaction) => transaction.categoryId);
              final periodCategories = typeCategories.where((category) => transactionsCategoryIds.contains(category.id));
              double transactionsAmount = 0;
              for (var transaction in transactions) {
                transactionsAmount += transaction.amount;
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        AnimatedChartWidget(
                          key: ValueKey(transactionsState.lastPeriod),
                          periodCategories: periodCategories,
                          transactions: transactions,
                          transactionsAmount: transactionsAmount,
                          scrollController: scrollController,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        final category = periodCategories.firstWhere(
                          (element) => element.id == transactions[index].categoryId,
                          orElse: () => TransactionCategory.otherCategory(transactions[index].type),
                        );
                        return TransactionCard(
                          key: ValueKey(transactions[index].id),
                          transaction: transactions[index],
                          category: category,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 6);
                      },
                      itemCount: transactions.length,
                    ),
                  ),
                ],
              );
            } else if (transactionsState is TransactionsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Text('');
            }
          });
        } else if (state is TransactionCategoriesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('');
        }
      }),
    );
  }
}
