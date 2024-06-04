import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:moodmaster/navigation/app_router.dart';

@RoutePage()
class AppBottomTabsScreen extends StatelessWidget {
  const AppBottomTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        ProfileRoute(),
        MoodRoute(),
        MoodInfoRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'profile', icon: Icon(Icons.person)),
            BottomNavigationBarItem(label: 'mood', icon: Icon(Icons.abc)),
            BottomNavigationBarItem(label: 'mood info', icon: Icon(Icons.abc)),
          ],
        );
      },
    );
  }
}
