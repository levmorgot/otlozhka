import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/controllers/form_transaction_controller.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/form_transaction_widget.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FormTransactionPage extends StatefulWidget {
  final TransactionType type;
  final Transaction? transaction;

  const FormTransactionPage({super.key, required this.type, this.transaction});

  @override
  State<FormTransactionPage> createState() => _FormTransactionPagePageState();
}

class _FormTransactionPagePageState extends State<FormTransactionPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.type == TransactionType.expense ? 0 : 1;
    tabController = TabController(length: 2, vsync: this, initialIndex: _selectedIndex);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      Provider.of<FormTransactionController>(context, listen: false).changeCategory(null);
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
          leading: IconButton(
            onPressed: () {
              AutoRouter.of(context).maybePop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(widget.transaction !=null ? 'Редактирование операции' :'Добавление операции'),
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
        body: FormTransactionsWidget(
          type: _selectedIndex == 0 ? TransactionType.expense : TransactionType.income,
          transaction: widget.transaction,
        ),
      ),
    );
  }
}
