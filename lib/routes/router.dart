import 'package:auto_route/auto_route.dart';
import 'package:otlozhka/routes/main/main_router.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        mainRouter,
      ];
}
