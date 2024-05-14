import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
          toolbarHeight: 85,
          title: const Text('Отложка'),
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
                  indicator: ShapeDecoration(
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
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            Text('Расходы'),
            Text('Доходы'),
          ],
        ),
      ),
    );
  }
}
