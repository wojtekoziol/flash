import 'package:flash/home/home_view.dart';
import 'package:flash/navigation/widgets/bottom_navbar.dart';
import 'package:flash/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NavigationView extends HookWidget {
  const NavigationView({super.key});

  List<Widget> get _pages => const [HomeView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    final indexNotifier = useValueNotifier(0);

    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: indexNotifier,
            builder: (context, index, child) {
              return IndexedStack(
                index: index,
                children: _pages,
              );
            },
          ),
          BottomNavbar(indexNotifier: indexNotifier),
        ],
      ),
    );
  }
}
