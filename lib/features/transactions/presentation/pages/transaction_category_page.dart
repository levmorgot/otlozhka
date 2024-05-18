import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/core/utils/periods.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_category_params.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_of_category_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/category_icon.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/period_buttons.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/transaction_card.dart';

@RoutePage()
class TransactionCategoryPage extends StatelessWidget implements AutoRouteWrapper {
  final TransactionCategory category;

  const TransactionCategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final TextEditingController maxMonthAmountController = TextEditingController(text: category.maxMonthAmount?.toString());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                CategoryIcon(category: category, radius: 15),
                const Gap(15),
                Text(category.name),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Тип',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  category.type == TransactionType.income ? 'Доходы' : 'Расходы',
                  style: TextStyle(
                    color: category.type == TransactionType.income ? Colors.green : Colors.red,
                  ),
                ),
                const Gap(20),
                TextField(
                  controller: maxMonthAmountController,
                ),
                const Gap(10),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<TransactionCategoriesBloc>(context).add(ChangeTransactionCategoryEvent(
                        params: ChangeTransactionCategoryParams(
                            id: category.id,
                            maxMonthAmount: double.tryParse(
                              maxMonthAmountController.text,
                            ))));
                  },
                  child: const Text(
                    'Подтвердить',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Gap(20),
                const Text(
                  'Транзакции в этой категории',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: PeriodButtons(
                    body: BlocBuilder<TransactionsOfCategoryBloc, TransactionsState>(builder: (context, state) {
                      if (state is TransactionsEmptyState) {
                        BlocProvider.of<TransactionsOfCategoryBloc>(context).add(GetTransactionsByCategoryEvent(params: oneMonth(), category: category));
                      }
                      if (state is TransactionsOfCategoryLoadedState) {
                        final transactions = state.transactions;
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return TransactionCard(transaction: transactions[index], category: category);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 6);
                          },
                          itemCount: transactions.length,
                        );
                      } else if (state is TransactionsLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return const Text('');
                      }
                    }),
                    updatePeriodTransactions: (index) {
                      final bloc = BlocProvider.of<TransactionsOfCategoryBloc>(context);
                      switch (index) {
                        case 0:
                          bloc.add(GetTransactionsByCategoryEvent(params: oneDay(), category: category));
                          break;
                        case 1:
                          bloc.add(GetTransactionsByCategoryEvent(params: oneWeek(), category: category));
                          break;
                        case 2:
                          bloc.add(GetTransactionsByCategoryEvent(params: oneMonth(), category: category));
                          break;
                        case 3:
                          bloc.add(GetTransactionsByCategoryEvent(params: oneYear(), category: category));
                          break;
                      }
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TransactionsOfCategoryBloc>(),
      child: this,
    );
  }
}
