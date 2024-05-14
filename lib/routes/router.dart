import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'major/major_router.dart';
import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        majorRouter,
      ];
}
