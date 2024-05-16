import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_category_params.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/category_icon.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/transaction_categories_widget.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/transactions_widget.dart';
import 'package:otlozhka/routes/router.gr.dart';

@RoutePage()
class TransactionCategoryPage extends StatelessWidget {
  final TransactionCategory category;
  const TransactionCategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final TextEditingController maxMonthAmountController = TextEditingController(text: category.maxMonthAmount?.toString());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.name),
        ),
        body: Column(children: [
          CategoryIcon(category: category, radius: 50),
          Text('Тип'),
          Text(category.type == TransactionType.income ? 'Доходы' : 'Расходы'),
          TextField(controller: maxMonthAmountController,),

          TextButton(
            onPressed: () {

              BlocProvider.of<TransactionCategoriesBloc>(context).add(ChangeTransactionCategoryEvent(
                  params: ChangeTransactionCategoryParams(
                      id: category.id,
                      maxMonthAmount: double.tryParse(
                        maxMonthAmountController.text,
                      ))));
            },
            child: Text('Подтвердить'),
          ),
        ],)
      ),
    );
  }
}
