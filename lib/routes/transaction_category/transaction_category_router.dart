import 'package:auto_route/auto_route.dart';

import '../router.gr.dart';

final transactionCategoryRouter = AutoRoute(
  page: TransactionCategoryWrapper.page,
  children: [
    AutoRoute(page: TransactionCategoryRoute.page, initial: true),
  ],
);
