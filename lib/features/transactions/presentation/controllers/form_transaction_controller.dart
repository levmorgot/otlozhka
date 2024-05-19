import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/core/utils/periods.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions.dart';
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgory.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';
import 'package:otlozhka/features/transactions/presentation/widgets/limit_confirm_widget.dart';

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

  void saveTransaction(BuildContext context, TransactionType type, {Transaction? transaction}) async {
    final amount = double.tryParse(_amountController.text) ?? 0;
    if (_selectedCategoryId != null && amount > 0) {
      final limitExceeded = await _checkLimitExceeded(_selectedCategoryId!, amount);
      if (limitExceeded) {
        LimitConfirmDialog.show(context, () => _saveTransaction(context, type, transaction: transaction));
      } else {
        _saveTransaction(context, type, transaction: transaction);
      }
    }
  }

  void _saveTransaction(BuildContext context, TransactionType type, {Transaction? transaction}) {
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

  Future<bool> _checkLimitExceeded(int categoryId, double amount) async {
    double? maxMonthAmount;
    final failureOrCategory = await getIt<GetTransactionCategory>()(categoryId);
    failureOrCategory.fold((failure) {}, (category) {
      maxMonthAmount = category.maxMonthAmount;
    });
    if (maxMonthAmount != null) {
      double amountCategory = 0;
      final failureOrTransactions = await getIt<GetTransactions>()(oneMonth());

      failureOrTransactions.fold((failure) {}, (transactions) {
        final expenseTransactions = transactions.where((transaction) => transaction.type == TransactionType.expense && transaction.categoryId == _selectedCategoryId).toList();
        for (var transaction in expenseTransactions) {
          amountCategory += transaction.amount;
        }
      });
      amountCategory += amount;
      return amountCategory > maxMonthAmount!;
    } else {
      return false;
    }
  }
}
