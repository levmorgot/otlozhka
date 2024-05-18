import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';
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
              final transactions = type == TransactionType.income ? transactionsState.incomeTransactions : transactionsState.expenseTransactions;
              final typeCategories = transactions.firstOrNull?.type == TransactionType.income ? state.incomeTransactionCategories : state.expenseTransactionCategories;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      height: 200,
                      child: PieChart(
                        PieChartData(
                          // read about it in the PieChartData section
                          sections: typeCategories.map(
                            (category) {
                              return PieChartSectionData(
                                radius: 30,
                                title: category.name,
                                color: category.color,
                                value: transactions.where((transaction) => transaction.categoryId == category.id).length.toDouble(),
                              );
                            },
                          ).toList(),
                        ),
                        swapAnimationDuration: const Duration(milliseconds: 200), // Optional
                        swapAnimationCurve: Curves.ease, // Optional
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final category = typeCategories.firstWhere(
                          (element) => element.id == transactions[index].categoryId,
                          orElse: () => TransactionCategory.otherCategory(transactions[index].type),
                        );
                        return TransactionCard(transaction: transactions[index], category: category);
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
