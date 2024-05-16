import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/features/transactions/presentation/controllers/form_transaction_controller.dart';
import 'package:provider/provider.dart';
@RoutePage()
class TransactionsWrapper extends StatelessWidget implements AutoRouteWrapper {
  const TransactionsWrapper({super.key});


  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
