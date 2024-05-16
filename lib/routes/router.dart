import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'major/major_router.dart';
import 'router.gr.dart';

@Singleton()
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        majorRouter,
        AutoRoute(page: TransactionRoute.page),
        AutoRoute(page: TransactionCategoryRoute.page),
      ];
}
