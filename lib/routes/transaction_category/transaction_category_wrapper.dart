import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_of_category_bloc.dart';

@RoutePage()
class TransactionCategoryWrapper extends StatelessWidget implements AutoRouteWrapper {
  const TransactionCategoryWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TransactionsOfCategoryBloc>(),
      child: this,
    );
  }
}
