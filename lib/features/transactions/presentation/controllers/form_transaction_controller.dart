import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/core/utils/app_logger.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_params.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';

@Injectable()
class FormTransactionController extends ChangeNotifier {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  int? _selectedCategoryId;
  final now = DateTime.now();
  DateTime _transactionDate = DateTime.now();
  bool isInitial = false;

  init({Transaction? transaction, required TransactionType type}) {
    if (!isInitial) {
      isInitial = true;
      _amountController.text = transaction?.amount.toString() ?? '';
      _commentController.text = transaction?.comment ?? '';
      _selectedCategoryId = transaction?.categoryId;
      _transactionDate = transaction?.transactionDate ?? now;
    }
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
    _transactionDate = date;
    notifyListeners();
  }

  void saveTransaction(BuildContext context, TransactionType type, {Transaction? transaction}) {
    if (_selectedCategoryId != null && _amountController.text.isNotEmpty && (double.tryParse(_amountController.text) ?? 0) > 0) {
      final bloc = getIt<TransactionsBloc>();
      if (transaction != null) {
        bloc.add(
          ChangeTransactionEvent(
            params: ChangeTransactionParams(
              id: transaction.id,
              categoryId: _selectedCategoryId!,
              type: transaction.type != type ? type : null,
              amount: double.tryParse(_amountController.text) ?? 0,
              transactionDate: _transactionDate,
              comment: _commentController.text,
            ),
          ),
        );
      } else {
        bloc.add(
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
      }
      AutoRouter.of(context).maybePop();
    }
  }
}
