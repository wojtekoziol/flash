import 'package:animations/animations.dart';
import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/new_deck/new_deck_cubit.dart';
import 'package:flash/view/navigation/widgets/bottom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
    required this.indexNotifier,
  });

  final ValueNotifier<int> indexNotifier;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kPaddingM),
        height: 90,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: const _FloatingActionButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: _BottomAppBar(indexNotifier: indexNotifier),
        ),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openElevation: 0,
      closedElevation: 0,
      transitionDuration: kDefaultAnimDuration,
      openShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kPaddingL),
      ),
      middleColor: Colors.transparent,
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedBuilder: (_, open) => FloatingActionButton(
        onPressed: open,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context)
                    .floatingActionButtonTheme
                    .backgroundColor!
                    .withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Icon(UniconsLine.pen),
        ),
      ),
      openBuilder: (_, __) => BlocProvider(
        create: (_) => NewDeckCubit(),
        // TODO(wojtekoziol): Implement
        child: const SizedBox.shrink(),
      ),
    );
  }
}

class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar({required this.indexNotifier});

  final ValueNotifier<int> indexNotifier;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kPaddingXL),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: kPaddingS,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kPaddingS,
            horizontal: kPaddingL,
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: indexNotifier,
            builder: (context, index, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavbarItem(
                  onTap: () => indexNotifier.value = 0,
                  isSelected: index == 0,
                  icon: Icons.home_filled,
                  label: 'Home',
                ),
                BottomNavbarItem(
                  onTap: () => indexNotifier.value = 1,
                  isSelected: index == 1,
                  icon: Icons.person_rounded,
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
