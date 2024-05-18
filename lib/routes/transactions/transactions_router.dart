import 'package:auto_route/auto_route.dart';
import 'package:otlozhka/routes/form_transaction/form_transaction_router.dart';

import '../router.gr.dart';

final transactionsRouter = AutoRoute(
  page: TransactionsWrapper.page,
  children: [
    AutoRoute(page: TransactionsRoute.page, initial: true),
    formTransactionRouter
  ],
);
