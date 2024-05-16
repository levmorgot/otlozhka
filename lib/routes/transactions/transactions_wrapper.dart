import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
