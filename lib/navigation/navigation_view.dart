import 'package:flash/navigation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NavigationView extends HookWidget {
  const NavigationView({super.key});

  // final _pages = const [];

  @override
  Widget build(BuildContext context) {
    final indexNotifier = useValueNotifier(0);

    return Scaffold(
      // body: ValueListenableBuilder(
      //   valueListenable: indexNotifier,
      //   builder: (context, int index, child) {
      //     return IndexedStack(
      //       index: index,
      //       children: _pages,
      //     );
      //   },
      // ),
      bottomNavigationBar: BottomNavbar(indexNotifier: indexNotifier),
    );
  }
}
