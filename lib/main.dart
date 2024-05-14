import 'package:flutter/material.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouterAuto = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouterAuto.config(),
    );
  }
}
