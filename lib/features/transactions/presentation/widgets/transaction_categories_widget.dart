import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_category_params.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/category_icon.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/transaction_card.dart';
import 'package:otlozhka/routes/router.gr.dart';

class TransactionCategoriesWidget extends StatelessWidget {
  final List<TransactionCategory> categories;

  const TransactionCategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
            runSpacing: 20,
            spacing: 15,
            children: categories
                .map((category) => InkWell(
                      onTap: () {
                       AutoRouter.of(context).push(TransactionCategoryRoute(category: category));
                      },
                      child: Column(
                        children: [
                          CategoryIcon(
                            category: category,
                            radius: 40,
                          ),
                          Text(category.name)
                        ],
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
