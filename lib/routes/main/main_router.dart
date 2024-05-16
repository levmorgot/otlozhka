import 'package:auto_route/auto_route.dart';
import 'package:otlozhka/routes/form_transaction/form_transaction_router.dart';
import 'package:otlozhka/routes/transaction_categories/transaction_categories_router.dart';
import 'package:otlozhka/routes/transactions/transactions_router.dart';

import '../router.gr.dart';

final mainRouter = AutoRoute(
  page: MainWrapperRoute.page,
  initial: true,
  children: [
    transactionsRouter,
    transactionCategoriesRouter,
  ],
);
