import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';
import 'package:otlozhka/features/transactions/presentation/controllers/form_transaction_controller.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/category_icon.dart';
import 'package:provider/provider.dart';

class FormTransactionsWidget extends StatelessWidget {
  final TransactionType type;
  const FormTransactionsWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormTransactionController>(context);
    return Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: const InputDecoration(suffixText: 'Руб'),
                    onChanged: (value) {
                      form.changeAmount(value);
                    },
                  ),
                ),
              ),
              const Gap(30),
              BlocBuilder<TransactionCategoriesBloc, TransactionCategoriesState>(builder: (context, state) {
                if (state is TransactionCategoriesLoadedState) {
                  final categories = type == TransactionType.expense ? state.expenseTransactionCategories : state.incomeTransactionCategories;
                  return Wrap(
                      runSpacing: 20,
                      children: categories
                          .map(
                            (category) => InkWell(
                              onTap: () {
                                form.changeCategory(category.id);
                              },
                              child: SizedBox(
                                height: 110,
                                width: 110,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: category.id == form.selectedCategoryId ? category.color : null,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    children: [
                                      CategoryIcon(
                                        category: category,
                                        radius: 40,
                                      ),
                                      Text(category.name)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList());
                }
                return const SizedBox();
              }),
              TextButton(onPressed: () {
                form.addTransaction(context, type);
              }, child: const Text('Добавить'))
            ],
          ),
        ),
    );
  }
}
