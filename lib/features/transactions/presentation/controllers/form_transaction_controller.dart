import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/utils/app_logger.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_params.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';
import 'package:otlozhka/routes/router.gr.dart';

@Injectable()
class FormTransactionController extends ChangeNotifier {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  int? _selectedCategoryId;
  final now = DateTime.now();
  DateTime _transactionDate = DateTime.now();

  init({Transaction? transaction, required TransactionType type}) {
    _amountController.text = transaction?.amount.toString() ?? '';
    _commentController.text = transaction?.comment ?? '';
    _selectedCategoryId = transaction?.categoryId;
    _transactionDate = transaction?.transactionDate ?? now;
    notifyListeners();
  }

  TextEditingController get amountController => _amountController;

  TextEditingController get commentController => _commentController;

  int? get selectedCategoryId => _selectedCategoryId;

  DateTime get transactionDate => _transactionDate;

  void changeAmount(String text) {
    _amountController.text = text;
    notifyListeners();
  }

  void changeComment(String text) {
    _commentController.text = text;
    notifyListeners();
  }

  void changeCategory(int? categoryId) {
    _selectedCategoryId = categoryId;
    notifyListeners();
  }

  void changeTransactionDate(DateTime date) {
    log(date);
    _transactionDate = date;
    notifyListeners();
  }

  void addTransaction(BuildContext context, TransactionType type) {
    if (_selectedCategoryId != null && _amountController.text.isNotEmpty && (double.tryParse(_amountController.text) ?? 0) > 0) {
      BlocProvider.of<TransactionsBloc>(context).add(
        AddTransactionEvent(
          params: AddTransactionParams(
            categoryId: _selectedCategoryId!,
            type: type,
            amount: double.tryParse(_amountController.text) ?? 0,
            transactionDate: _transactionDate,
            comment: _commentController.text,
          ),
        ),
      );
      AutoRouter.of(context).maybePop(const TransactionsRoute());
    }
  }
}
