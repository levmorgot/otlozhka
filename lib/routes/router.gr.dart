// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart'
    as _i14;
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart'
    as _i13;
import 'package:otlozhka/features/transactions/presentation/pages/add_transactions_page.dart'
    as _i1;
import 'package:otlozhka/features/transactions/presentation/pages/transaction_categories_page.dart'
    as _i5;
import 'package:otlozhka/features/transactions/presentation/pages/transaction_category_page.dart'
    as _i7;
import 'package:otlozhka/features/transactions/presentation/pages/transaction_page.dart'
    as _i8;
import 'package:otlozhka/features/transactions/presentation/pages/transactions_page.dart'
    as _i9;
import 'package:otlozhka/routes/form_transaction/form_transaction_wrapper.dart'
    as _i2;
import 'package:otlozhka/routes/main/main_wrapper.dart' as _i3;
import 'package:otlozhka/routes/major/major_wrapper.dart' as _i4;
import 'package:otlozhka/routes/transaction_categories/transaction_categories_wrapper.dart'
    as _i6;
import 'package:otlozhka/routes/transactions/transactions_wrapper.dart' as _i10;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AddTransactionsRoute.name: (routeData) {
      final args = routeData.argsAs<AddTransactionsRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddTransactionsPage(
          key: args.key,
          type: args.type,
        ),
      );
    },
    FormTransactionWrapper.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i2.FormTransactionWrapper()),
      );
    },
    MainWrapperRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainWrapperPage(),
      );
    },
    MajorWrapper.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i4.MajorWrapper()),
      );
    },
    TransactionCategoriesRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TransactionCategoriesPage(),
      );
    },
    TransactionCategoriesWrapper.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child:
            _i11.WrappedRoute(child: const _i6.TransactionCategoriesWrapper()),
      );
    },
    TransactionCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionCategoryRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.TransactionCategoryPage(
          key: args.key,
          category: args.category,
        ),
      );
    },
    TransactionRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.TransactionPage(
          key: args.key,
          transaction: args.transaction,
          category: args.category,
        ),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.TransactionsPage(),
      );
    },
    TransactionsWrapper.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i10.TransactionsWrapper()),
      );
    },
  };
}

/// generated route for
/// [_i1.AddTransactionsPage]
class AddTransactionsRoute
    extends _i11.PageRouteInfo<AddTransactionsRouteArgs> {
  AddTransactionsRoute({
    _i12.Key? key,
    required _i13.TransactionType type,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          AddTransactionsRoute.name,
          args: AddTransactionsRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'AddTransactionsRoute';

  static const _i11.PageInfo<AddTransactionsRouteArgs> page =
      _i11.PageInfo<AddTransactionsRouteArgs>(name);
}

class AddTransactionsRouteArgs {
  const AddTransactionsRouteArgs({
    this.key,
    required this.type,
  });

  final _i12.Key? key;

  final _i13.TransactionType type;

  @override
  String toString() {
    return 'AddTransactionsRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i2.FormTransactionWrapper]
class FormTransactionWrapper extends _i11.PageRouteInfo<void> {
  const FormTransactionWrapper({List<_i11.PageRouteInfo>? children})
      : super(
          FormTransactionWrapper.name,
          initialChildren: children,
        );

  static const String name = 'FormTransactionWrapper';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainWrapperPage]
class MainWrapperRoute extends _i11.PageRouteInfo<void> {
  const MainWrapperRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainWrapperRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MajorWrapper]
class MajorWrapper extends _i11.PageRouteInfo<void> {
  const MajorWrapper({List<_i11.PageRouteInfo>? children})
      : super(
          MajorWrapper.name,
          initialChildren: children,
        );

  static const String name = 'MajorWrapper';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TransactionCategoriesPage]
class TransactionCategoriesRoute extends _i11.PageRouteInfo<void> {
  const TransactionCategoriesRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TransactionCategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionCategoriesRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TransactionCategoriesWrapper]
class TransactionCategoriesWrapper extends _i11.PageRouteInfo<void> {
  const TransactionCategoriesWrapper({List<_i11.PageRouteInfo>? children})
      : super(
          TransactionCategoriesWrapper.name,
          initialChildren: children,
        );

  static const String name = 'TransactionCategoriesWrapper';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.TransactionCategoryPage]
class TransactionCategoryRoute
    extends _i11.PageRouteInfo<TransactionCategoryRouteArgs> {
  TransactionCategoryRoute({
    _i12.Key? key,
    required _i14.TransactionCategory category,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          TransactionCategoryRoute.name,
          args: TransactionCategoryRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionCategoryRoute';

  static const _i11.PageInfo<TransactionCategoryRouteArgs> page =
      _i11.PageInfo<TransactionCategoryRouteArgs>(name);
}

class TransactionCategoryRouteArgs {
  const TransactionCategoryRouteArgs({
    this.key,
    required this.category,
  });

  final _i12.Key? key;

  final _i14.TransactionCategory category;

  @override
  String toString() {
    return 'TransactionCategoryRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i8.TransactionPage]
class TransactionRoute extends _i11.PageRouteInfo<TransactionRouteArgs> {
  TransactionRoute({
    _i12.Key? key,
    required _i13.Transaction transaction,
    required _i14.TransactionCategory category,
    List<_i11.PageRouteInfo>? children,
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

  static const _i11.PageInfo<TransactionRouteArgs> page =
      _i11.PageInfo<TransactionRouteArgs>(name);
}

class TransactionRouteArgs {
  const TransactionRouteArgs({
    this.key,
    required this.transaction,
    required this.category,
  });

  final _i12.Key? key;

  final _i13.Transaction transaction;

  final _i14.TransactionCategory category;

  @override
  String toString() {
    return 'TransactionRouteArgs{key: $key, transaction: $transaction, category: $category}';
  }
}

/// generated route for
/// [_i9.TransactionsPage]
class TransactionsRoute extends _i11.PageRouteInfo<void> {
  const TransactionsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TransactionsWrapper]
class TransactionsWrapper extends _i11.PageRouteInfo<void> {
  const TransactionsWrapper({List<_i11.PageRouteInfo>? children})
      : super(
          TransactionsWrapper.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsWrapper';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
