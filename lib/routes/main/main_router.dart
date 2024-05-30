import 'package:auto_route/auto_route.dart';
import 'package:otlozhka/routes/transactions/transactions_router.dart';

import '../router.gr.dart';

final mainRouter = AutoRoute(
  page: MainWrapperRoute.page,
  initial: true,
  children: [
    transactionsRouter,
    AutoRoute(page: TransactionCategoriesRoute.page),
    AutoRoute(page: StatisticRoute.page),
    AutoRoute(page: TransactionCategoryRoute.page),
    AutoRoute(page: TransactionRoute.page),
  ],
);
