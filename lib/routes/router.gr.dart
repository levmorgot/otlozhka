// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart'
    as _i7;
import 'package:otlozhka/features/transactions/presentation/pages/add_transactions_page.dart'
    as _i1;
import 'package:otlozhka/features/transactions/presentation/pages/transactions_page.dart'
    as _i4;
import 'package:otlozhka/routes/form_transaction/form_transaction_wrapper.dart'
    as _i2;
import 'package:otlozhka/routes/major/major_wrapper.dart' as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AddTransactionsRoute.name: (routeData) {
      final args = routeData.argsAs<AddTransactionsRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddTransactionsPage(
          key: args.key,
          type: args.type,
        ),
      );
    },
    FormTransactionWrapper.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i2.FormTransactionWrapper()),
      );
    },
    MajorWrapper.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i3.MajorWrapper()),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TransactionsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddTransactionsPage]
class AddTransactionsRoute extends _i5.PageRouteInfo<AddTransactionsRouteArgs> {
  AddTransactionsRoute({
    _i6.Key? key,
    required _i7.TransactionType type,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AddTransactionsRoute.name,
          args: AddTransactionsRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'AddTransactionsRoute';

  static const _i5.PageInfo<AddTransactionsRouteArgs> page =
      _i5.PageInfo<AddTransactionsRouteArgs>(name);
}

class AddTransactionsRouteArgs {
  const AddTransactionsRouteArgs({
    this.key,
    required this.type,
  });

  final _i6.Key? key;

  final _i7.TransactionType type;

  @override
  String toString() {
    return 'AddTransactionsRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i2.FormTransactionWrapper]
class FormTransactionWrapper extends _i5.PageRouteInfo<void> {
  const FormTransactionWrapper({List<_i5.PageRouteInfo>? children})
      : super(
          FormTransactionWrapper.name,
          initialChildren: children,
        );

  static const String name = 'FormTransactionWrapper';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MajorWrapper]
class MajorWrapper extends _i5.PageRouteInfo<void> {
  const MajorWrapper({List<_i5.PageRouteInfo>? children})
      : super(
          MajorWrapper.name,
          initialChildren: children,
        );

  static const String name = 'MajorWrapper';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TransactionsPage]
class TransactionsRoute extends _i5.PageRouteInfo<void> {
  const TransactionsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
