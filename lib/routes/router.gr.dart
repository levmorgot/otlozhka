// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart'
    as _i16;
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart'
    as _i15;
import 'package:otlozhka/features/transactions/presentation/pages/form_transactions_page.dart'
    as _i1;
import 'package:otlozhka/features/transactions/presentation/pages/statistic_page.dart'
    as _i6;
import 'package:otlozhka/features/transactions/presentation/pages/transaction_categories_page.dart'
    as _i7;
import 'package:otlozhka/features/transactions/presentation/pages/transaction_category_page.dart'
    as _i8;
import 'package:otlozhka/features/transactions/presentation/pages/transaction_page.dart'
    as _i10;
import 'package:otlozhka/features/transactions/presentation/pages/transactions_page.dart'
    as _i11;
import 'package:otlozhka/routes/form_transaction/form_transaction_wrapper.dart'
    as _i2;
import 'package:otlozhka/routes/main/main_wrapper.dart' as _i3;
import 'package:otlozhka/routes/major/major.dart' as _i4;
import 'package:otlozhka/routes/major/major_wrapper.dart' as _i5;
import 'package:otlozhka/routes/transaction_category/transaction_category_wrapper.dart'
    as _i9;
import 'package:otlozhka/routes/transactions/transactions_wrapper.dart' as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    FormTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<FormTransactionRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.FormTransactionPage(
          key: args.key,
          type: args.type,
          transaction: args.transaction,
        ),
      );
    },
    FormTransactionWrapper.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i2.FormTransactionWrapper()),
      );
    },
    MainWrapperRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainWrapperPage(),
      );
    },
    MajorRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MajorPage(),
      );
    },
    MajorWrapper.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i5.MajorWrapper()),
      );
    },
    StatisticRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.StatisticPage(),
      );
    },
    TransactionCategoriesRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.TransactionCategoriesPage(),
      );
    },
    TransactionCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionCategoryRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(
            child: _i8.TransactionCategoryPage(
          key: args.key,
          category: args.category,
        )),
      );
    },
    TransactionCategoryWrapper.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i9.TransactionCategoryWrapper()),
      );
    },
    TransactionRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.TransactionPage(
          key: args.key,
          transaction: args.transaction,
          category: args.category,
        ),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.TransactionsPage(),
      );
    },
    TransactionsWrapper.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i12.TransactionsWrapper()),
      );
    },
  };
}

/// generated route for
/// [_i1.FormTransactionPage]
class FormTransactionRoute
    extends _i13.PageRouteInfo<FormTransactionRouteArgs> {
  FormTransactionRoute({
    _i14.Key? key,
    required _i15.TransactionType type,
    _i15.Transaction? transaction,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          FormTransactionRoute.name,
          args: FormTransactionRouteArgs(
            key: key,
            type: type,
            transaction: transaction,
          ),
          initialChildren: children,
        );

  static const String name = 'FormTransactionRoute';

  static const _i13.PageInfo<FormTransactionRouteArgs> page =
      _i13.PageInfo<FormTransactionRouteArgs>(name);
}

class FormTransactionRouteArgs {
  const FormTransactionRouteArgs({
    this.key,
    required this.type,
    this.transaction,
  });

  final _i14.Key? key;

  final _i15.TransactionType type;

  final _i15.Transaction? transaction;

  @override
  String toString() {
    return 'FormTransactionRouteArgs{key: $key, type: $type, transaction: $transaction}';
  }
}

/// generated route for
/// [_i2.FormTransactionWrapper]
class FormTransactionWrapper extends _i13.PageRouteInfo<void> {
  const FormTransactionWrapper({List<_i13.PageRouteInfo>? children})
      : super(
          FormTransactionWrapper.name,
          initialChildren: children,
        );

  static const String name = 'FormTransactionWrapper';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainWrapperPage]
class MainWrapperRoute extends _i13.PageRouteInfo<void> {
  const MainWrapperRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MainWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainWrapperRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MajorPage]
class MajorRoute extends _i13.PageRouteInfo<void> {
  const MajorRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MajorRoute.name,
          initialChildren: children,
        );

  static const String name = 'MajorRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MajorWrapper]
class MajorWrapper extends _i13.PageRouteInfo<void> {
  const MajorWrapper({List<_i13.PageRouteInfo>? children})
      : super(
          MajorWrapper.name,
          initialChildren: children,
        );

  static const String name = 'MajorWrapper';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.StatisticPage]
class StatisticRoute extends _i13.PageRouteInfo<void> {
  const StatisticRoute({List<_i13.PageRouteInfo>? children})
      : super(
          StatisticRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.TransactionCategoriesPage]
class TransactionCategoriesRoute extends _i13.PageRouteInfo<void> {
  const TransactionCategoriesRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TransactionCategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionCategoriesRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TransactionCategoryPage]
class TransactionCategoryRoute
    extends _i13.PageRouteInfo<TransactionCategoryRouteArgs> {
  TransactionCategoryRoute({
    _i14.Key? key,
    required _i16.TransactionCategory category,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          TransactionCategoryRoute.name,
          args: TransactionCategoryRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionCategoryRoute';

  static const _i13.PageInfo<TransactionCategoryRouteArgs> page =
      _i13.PageInfo<TransactionCategoryRouteArgs>(name);
}

class TransactionCategoryRouteArgs {
  const TransactionCategoryRouteArgs({
    this.key,
    required this.category,
  });

  final _i14.Key? key;

  final _i16.TransactionCategory category;

  @override
  String toString() {
    return 'TransactionCategoryRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i9.TransactionCategoryWrapper]
class TransactionCategoryWrapper extends _i13.PageRouteInfo<void> {
  const TransactionCategoryWrapper({List<_i13.PageRouteInfo>? children})
      : super(
          TransactionCategoryWrapper.name,
          initialChildren: children,
        );

  static const String name = 'TransactionCategoryWrapper';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TransactionPage]
class TransactionRoute extends _i13.PageRouteInfo<TransactionRouteArgs> {
  TransactionRoute({
    _i14.Key? key,
    required _i15.Transaction transaction,
    required _i16.TransactionCategory category,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          TransactionRoute.name,
          args: TransactionRouteArgs(
            key: key,
            transaction: transaction,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionRoute';

  static const _i13.PageInfo<TransactionRouteArgs> page =
      _i13.PageInfo<TransactionRouteArgs>(name);
}

class TransactionRouteArgs {
  const TransactionRouteArgs({
    this.key,
    required this.transaction,
    required this.category,
  });

  final _i14.Key? key;

  final _i15.Transaction transaction;

  final _i16.TransactionCategory category;

  @override
  String toString() {
    return 'TransactionRouteArgs{key: $key, transaction: $transaction, category: $category}';
  }
}

/// generated route for
/// [_i11.TransactionsPage]
class TransactionsRoute extends _i13.PageRouteInfo<void> {
  const TransactionsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.TransactionsWrapper]
class TransactionsWrapper extends _i13.PageRouteInfo<void> {
  const TransactionsWrapper({List<_i13.PageRouteInfo>? children})
      : super(
          TransactionsWrapper.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsWrapper';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
