import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/core/utils/periods.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/period_buttons.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/transactions_widget.dart';
import 'package:otlozhka/routes/router.gr.dart';

@RoutePage()
class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: _selectedIndex);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 95,
          title: Column(
            children: [
              const Text('Отложка'),
              BlocBuilder<TransactionsBloc, TransactionsState>(
                  builder: (context, state) {
                    if (state is TransactionsLoadedState) {
                      final incomeTransactions = state.incomeTransactions;
                      final expenseTransactions = state.expenseTransactions;
                      double incomeTransactionsAmount = 0;
                      double expenseTransactionsAmount = 0;
                      for (var transaction in incomeTransactions) {
                        incomeTransactionsAmount+=transaction.amount;
                      }
                      for (var transaction in expenseTransactions) {
                        expenseTransactionsAmount+=transaction.amount;
                      }
                      final allAmount = incomeTransactionsAmount - expenseTransactionsAmount;
                      return Text('${allAmount.toStringAsFixed(2)} ₽', style: TextStyle(
                        color: allAmount > 0 ? Colors.green : Colors.red,
                      ),);
                    }
                    if (state is TransactionsLoadingState) {
                      return const CircularProgressIndicator();

                    }
                    return const SizedBox();
                  }
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20.0),
            child: Column(
              children: [
                TabBar(
                  controller: tabController,
                  onTap: _onItemTapped,
                  indicatorWeight: 1.0,
                  labelPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  // labelColor: AppColors.onMainBackground1,
                  labelStyle: const TextStyle(fontSize: 16),
                  unselectedLabelStyle: const TextStyle(fontSize: 16),
                  // unselectedLabelColor: AppColors.onMainBackground2,
                  indicator: const ShapeDecoration(
                    shape: UnderlineInputBorder(
                      borderSide: BorderSide(
                        // color: AppColors.onMainBackground1,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    // color: AppColors.mainBackground2,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Расходы',
                    ),
                    Tab(text: 'Доходы'),
                  ],
                ),
                Container(
                  // color: AppColors.dividers,
                  height: 0.5,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AutoRouter.of(context).push(
              FormTransactionRoute(
                type: _selectedIndex == 0 ? TransactionType.expense : TransactionType.income,
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: PeriodButtons(
          body: IndexedStack(
            index: _selectedIndex,
            children: const [
              TransactionsWidget(type: TransactionType.expense),
              TransactionsWidget(type: TransactionType.income),
            ],
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
      ),
    );
  }
}
