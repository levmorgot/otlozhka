import 'package:auto_route/auto_route.dart';

import '../router.gr.dart';

final formTransactionRouter = AutoRoute(
  page: FormTransactionWrapper.page,
  children: [
    AutoRoute(page: FormTransactionRoute.page, initial: true),
  ],
);
