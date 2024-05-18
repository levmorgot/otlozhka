import 'package:flutter/material.dart';
import 'package:otlozhka/core/database/transations_db.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  await getIt<TransactionsDatabase>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouterAuto = AppRouter();
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        )
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouterAuto.config(),
    );
  }
}
