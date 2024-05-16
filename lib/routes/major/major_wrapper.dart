import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_event.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MajorWrapper extends StatelessWidget implements AutoRouteWrapper {
  const MajorWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<TransactionsBloc>()..add(const GetTransactionsEvent())),
        BlocProvider(create: (context) => getIt<TransactionCategoriesBloc>()..add(const GetTransactionCategoriesEvent())),
      ],
      child: this,
    );
  }
}
