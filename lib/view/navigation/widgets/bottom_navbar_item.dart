import 'package:flash/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomNavbarItem extends HookWidget {
  const BottomNavbarItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).bottomNavigationBarTheme;

    final animController = useAnimationController(
      duration: kShortAnimDuration,
    );
    final colorAnim = ColorTween(
      begin: theme.selectedItemColor,
      end: theme.unselectedItemColor,
    ).animate(animController);

    useEffect(
      () {
        isSelected ? animController.reverse() : animController.forward();
        return;
      },
      [isSelected],
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          vertical: kPaddingS,
          horizontal: kPaddingM,
        ),
        child: AnimatedBuilder(
          animation: colorAnim,
          builder: (context, sizedBox) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: colorAnim.value,
                ),
                sizedBox!,
                Text(
                  label,
                  style: TextStyle(color: colorAnim.value),
                ),
              ],
            );
          },
          child: const SizedBox(height: kPaddingS),
        ),
      ),
    );
  }
}
