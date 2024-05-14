import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/transaction_card.dart';

class TransactionsWidget extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsWidget({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<TransactionCategoriesBloc, TransactionCategoriesState>(builder: (context, state) {
        if (state is TransactionCategoriesLoadedState) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final typeCategories = transactions[index].type == TransactionType.income ? state.incomeTransactionCategories : state.expenseTransactionCategories;
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
          );
        } else if (state is TransactionCategoriesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('Empty');
        }
      }),
    );
  }
}
