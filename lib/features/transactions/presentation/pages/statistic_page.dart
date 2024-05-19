import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/core/utils/periods.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/period_buttons.dart';

@RoutePage()
class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Статистика'),
      ),
      body: PeriodButtons(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TransactionCategoriesBloc, TransactionCategoriesState>(builder: (context, state) {
            if (state is TransactionCategoriesLoadedState) {
              return BlocBuilder<TransactionsBloc, TransactionsState>(builder: (context, transactionsState) {
                if (transactionsState is TransactionsLoadedState) {
                  final incomeTransactions = transactionsState.incomeTransactions;
                  final expenseTransactions = transactionsState.expenseTransactions;
                  double incomeTransactionsAmount = 0;
                  double expenseTransactionsAmount = 0;
                  double incomeTransactionsAmountLine = 0;
                  double expenseTransactionsAmountLine = 0;

                  for (var transaction in incomeTransactions) {
                    incomeTransactionsAmount += transaction.amount;
                  }
                  for (var transaction in expenseTransactions) {
                    expenseTransactionsAmount += transaction.amount;
                  }
                  final allAmount = incomeTransactionsAmount - expenseTransactionsAmount;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: SizedBox(
                            height: 600,
                            child: incomeTransactions.isNotEmpty || expenseTransactions.isNotEmpty
                                ? Column(
                                    children: [
                                      Flexible(
                                        child: LineChart(
                                          LineChartData(lineBarsData: [
                                            LineChartBarData(
                                              color: Colors.green,
                                              spots: incomeTransactions.asMap().entries.map((e) {
                                                incomeTransactionsAmountLine += e.value.amount;
                                                return FlSpot(e.key.toDouble(), incomeTransactionsAmountLine);
                                              }).toList(),
                                            ),
                                            LineChartBarData(
                                              color: Colors.red,
                                              spots: expenseTransactions.asMap().entries.map((e) {
                                                expenseTransactionsAmountLine += e.value.amount;
                                                return FlSpot(e.key.toDouble(), expenseTransactionsAmountLine);
                                              }).toList(),
                                            ),
                                          ]),
                                          duration: const Duration(milliseconds: 150), // Optional
                                          curve: Curves.linear, // Optional
                                        ),
                                      ),
                                      const Gap(40),
                                      Flexible(
                                        child: Stack(
                                          children: [
                                            PieChart(
                                              PieChartData(sections: [
                                                PieChartSectionData(
                                                  radius: 30,
                                                  title: '',
                                                  color: Colors.green,
                                                  value: incomeTransactionsAmount,
                                                ),
                                                PieChartSectionData(
                                                  radius: 30,
                                                  title: '',
                                                  color: Colors.red,
                                                  value: expenseTransactionsAmount,
                                                ),
                                              ]),
                                              swapAnimationDuration: const Duration(milliseconds: 200), // Optional
                                              swapAnimationCurve: Curves.ease, // Optional
                                            ),
                                            if (incomeTransactions.isNotEmpty || expenseTransactions.isNotEmpty)
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${allAmount > 0 ? '+' : '-'}${allAmount.round()} ₽',
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: allAmount > 0 ? Colors.green : Colors.red),
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : const Center(
                                    child: Text('Статистика отсутсвует'),
                                  ),
                          ),
                        ),
                      ],
                    ),
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
        ),
        updatePeriodTransactions: (index) {
          final bloc = getIt<TransactionsBloc>();
          switch (index) {
            case 0:
              bloc.add(GetTransactionsEvent(params: oneDay()));
              break;
            case 1:
              bloc.add(GetTransactionsEvent(params: oneWeek()));
              break;
            case 2:
              bloc.add(GetTransactionsEvent(params: oneMonth()));
              break;
            case 3:
              bloc.add(GetTransactionsEvent(params: oneYear()));
              break;
          }
        },
      ),
    );
  }
}
