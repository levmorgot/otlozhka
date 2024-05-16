import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_state.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/category_icon.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/transaction_categories_widget.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/transactions_widget.dart';
import 'package:otlozhka/routes/router.gr.dart';

@RoutePage()
class TransactionPage extends StatelessWidget {
  final Transaction transaction;
  final TransactionCategory category;
  const TransactionPage({super.key, required this.transaction, required this.category});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Транзакиця'),

        ),
        body: Column(children: [
          Text('Тип'),
          Text(category.type == TransactionType.income ? 'Доходы' : 'Расходы'),
          Text('Категория'),
          CategoryIcon(category: category, radius: 50),
          TextField(),
        ],)
      ),
    );
  }
}
