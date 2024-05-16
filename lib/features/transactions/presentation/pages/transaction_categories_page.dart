import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/transaction_categories_widget.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/transactions_widget.dart';
import 'package:otlozhka/routes/router.gr.dart';

@RoutePage()
class TransactionCategoriesPage extends StatefulWidget {
  const TransactionCategoriesPage({super.key});

  @override
  State<TransactionCategoriesPage> createState() => _TransactionCategoriesPageState();
}

class _TransactionCategoriesPageState extends State<TransactionCategoriesPage> with TickerProviderStateMixin {
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
          toolbarHeight: 85,
          title: const Text('Категории'),
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
        body: BlocBuilder<TransactionCategoriesBloc, TransactionCategoriesState>(builder: (context, state) {
          if (state is TransactionCategoriesLoadedState) {
            return IndexedStack(
              index: _selectedIndex,
              children: [
                TransactionCategoriesWidget(categories: state.expenseTransactionCategories),
                TransactionCategoriesWidget(categories: state.incomeTransactionCategories),
              ],
            );
          } else if (state is TransactionsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Text('');
          }
        }),
      ),
    );
  }
}
