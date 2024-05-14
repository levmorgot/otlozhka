import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otlozhka/core/utils/extensoins.dart';
import 'package:otlozhka/features/transactions/presentation/controllers/form_transaction_controller.dart';

class DateTransactionButton extends StatelessWidget {
  final DateTime date;
  final FormTransactionController form;
  final String title;

  const DateTransactionButton({super.key, required this.date, required this.title, required this.form});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        form.changeTransactionDate(date);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: date.trim() == form.transactionDate.trim() ? Colors.black12 : null,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(DateFormat('dd.MM').format(date)),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
