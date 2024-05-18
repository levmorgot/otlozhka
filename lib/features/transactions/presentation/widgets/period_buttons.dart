import 'package:flutter/material.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/core/utils/periods.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';

class PeriodButtons extends StatefulWidget {
  final Widget body;

  const PeriodButtons({super.key, required this.body});

  @override
  State<PeriodButtons> createState() => _PeriodButtonsState();
}

class _PeriodButtonsState extends State<PeriodButtons> with TickerProviderStateMixin {
  int _selectedIndex = 2;
  late TabController tabController;


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: _selectedIndex);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() => _selectedIndex = index);
      _getPeriodTransactions(index);
    }
  }

  void _getPeriodTransactions(int index) {
    switch (index) {
      case 0:
        getIt<TransactionsBloc>().add(GetTransactionsEvent(params: oneDay()));
        break;
      case 1:
        getIt<TransactionsBloc>().add(GetTransactionsEvent(params: oneWeek()));
        break;
      case 2:
        getIt<TransactionsBloc>().add(GetTransactionsEvent(params: oneMonth()));
        break;
      case 3:
        getIt<TransactionsBloc>().add(GetTransactionsEvent(params: oneYear()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
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
                    Tab(text: 'День'),
                    Tab(text: 'Неделя'),
                    Tab(text: 'Месяц'),
                    Tab(text: 'Год'),
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
        body: widget.body,
      ),
    );
  }
}
