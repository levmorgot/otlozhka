import 'package:auto_route/auto_route.dart';

import '../router.gr.dart';

final transactionCategoriesRouter = AutoRoute(
  page: TransactionCategoriesWrapper.page,
  children: [
    AutoRoute(page: TransactionCategoriesRoute.page, initial: true),
  ],
);
