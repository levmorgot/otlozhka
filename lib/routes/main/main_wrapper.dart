import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:otlozhka/routes/router.gr.dart';

late TabsRouter globalTabsRouter;

@RoutePage()
class MainWrapperPage extends StatefulWidget {
  const MainWrapperPage({super.key});

  @override
  State<MainWrapperPage> createState() => _MainWrapperPageState();
}

class _MainWrapperPageState extends State<MainWrapperPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<PageRouteInfo<dynamic>> routes = [
      const TransactionsRoute(),
      const TransactionCategoriesRoute(),
    ];

    return AutoTabsScaffold(
      resizeToAvoidBottomInset: false,
      routes: routes,
      bottomNavigationBuilder: (context, tabsRouter) {
        globalTabsRouter = tabsRouter;
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            tabsRouter.setActiveIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          // selectedItemColor: AppColors.onMainBackground1,
          // unselectedItemColor: AppColors.onMainBackground4,
          unselectedLabelStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          selectedLabelStyle: const TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w500,
          ),
          items: [
            BottomNavigationBarItem(
              label: 'Отложка',
              icon: Container(margin: const EdgeInsets.only(bottom: 2), child: const Icon(Icons.monetization_on_outlined)),
            ),
            BottomNavigationBarItem(
              label: 'Категории',
              icon: Container(margin: const EdgeInsets.only(bottom: 2), child: const Icon(Icons.monetization_on_outlined)),
            ),
          ],
        );
      },
    );
  }
}
