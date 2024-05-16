import 'package:auto_route/auto_route.dart';
import 'package:otlozhka/routes/main/main_router.dart';

import '../router.gr.dart';

final majorRouter = AutoRoute(
  page: MajorWrapper.page,
  initial: true,
  children: [
    mainRouter,
  ],
);
