import 'package:flash/view/home/home_view.dart';
import 'package:flash/view/navigation/widgets/bottom_navbar.dart';
import 'package:flash/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class NavigationView extends HookWidget {
  const NavigationView({super.key});

  List<Widget> get _pages => const [HomeView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    final indexNotifier = useValueNotifier(0);

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ValueListenableBuilder<int>(
            valueListenable: indexNotifier,
            builder: (_, index, __) {
              return IndexedStack(
                index: index,
                children: _pages,
              );
            },
          ),
          ChangeNotifierProvider.value(
            value: indexNotifier,
            child: const BottomNavbar(),
          ),
        ],
      ),
    );
  }
}
