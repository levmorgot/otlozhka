import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:otlozhka/core/utils/extensoins.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_state.dart';
import 'package:otlozhka/features/transactions/presentation/controllers/form_transaction_controller.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/category_icon.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/date_transaction_button.dart';
import 'package:provider/provider.dart';

class FormTransactionsWidget extends StatelessWidget {
  final TransactionType type;
  final Transaction? transaction;

  const FormTransactionsWidget({super.key, required this.type, this.transaction});

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormTransactionController>(context)..init(type: type, transaction: transaction);
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 150,
                child: TextFormField(
                  controller: form.amountController,
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
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                children: [
                  DateTransactionButton(
                    date: form.now,
                    form: form,
                    title: 'Сегодня',
                  ),
                  const Gap(20),
                  DateTransactionButton(
                    date: form.now.subtract(const Duration(days: 1)),
                    form: form,
                    title: 'Вчера',
                  ),
                  const Gap(20),
                  DateTransactionButton(
                    date: form.transactionDate.trim().isBefore(form.now.subtract(const Duration(days: 2)).trim()) ? form.transactionDate : form.now.subtract(const Duration(days: 2)),
                    form: form,
                    title: form.transactionDate.trim().isBefore(form.now.subtract(const Duration(days: 2)).trim()) ? 'Выбранная' : 'Позавчера',
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                        form.changeTransactionDate((await showDatePicker(
                              context: context,
                              firstDate: DateTime(2020),
                              lastDate: form.now,
                              initialDate: form.transactionDate,
                            )) ??
                            form.now);
                      },
                      icon: const Icon(Icons.calendar_month))
                ],
              ),
            ),
            const Gap(20),
            TextButton(
                onPressed: () {
                  form.saveTransaction(context, type, transaction: transaction);
                },
                child: Text(transaction != null ? 'Сохранить' : 'Добавить'))
          ],
        ),
      ),
    );
  }
}
