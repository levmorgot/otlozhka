// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:otlozhka/features/transactions/presentation/pages/income_transactions_page.dart'
    as _i2;
import 'package:otlozhka/routes/major/major_wrapper.dart' as _i1;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MajorWrapper.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: const _i1.MajorWrapper()),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TransactionsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MajorWrapper]
class MajorWrapper extends _i3.PageRouteInfo<void> {
  const MajorWrapper({List<_i3.PageRouteInfo>? children})
      : super(
          MajorWrapper.name,
          initialChildren: children,
        );

  static const String name = 'MajorWrapper';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TransactionsPage]
class TransactionsRoute extends _i3.PageRouteInfo<void> {
  const TransactionsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
