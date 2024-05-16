import 'package:auto_route/auto_route.dart';
import 'package:otlozhka/routes/form_transaction/form_transaction_router.dart';

import '../router.gr.dart';

final transactionCategoriesRouter = AutoRoute(
  page: TransactionCategoriesWrapper.page,
  children: [
    AutoRoute(page: TransactionCategoriesRoute.page, initial: true),
    AutoRoute(page: TransactionCategoryRoute.page),
    formTransactionRouter,
  ],
);
