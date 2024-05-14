import 'package:auto_route/auto_route.dart';

import '../router.gr.dart';

final formTransactionRouter = AutoRoute(
  page: FormTransactionWrapper.page,
  children: [
    AutoRoute(page: AddTransactionsRoute.page, initial: true),
  ],
);
