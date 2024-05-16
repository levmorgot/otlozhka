import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router.gr.dart';

@RoutePage()
class MajorPage extends StatelessWidget {
  const MajorPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _load() async {
      AutoRouter.of(context).replace(const TransactionsRoute());
      return;
    }

    return FutureBuilder(
      future: _load(),
      builder: (context, snapshot) => const Scaffold(),
    );
  }
}
