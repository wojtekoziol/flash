import 'package:flash/config/constants.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton({
    super.key,
    required this.onTap,
    this.color,
    required this.child,
  });

  final VoidCallback onTap;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kPaddingM),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: kPaddingM,
          horizontal: kPaddingXL,
        ),
        child: child,
      ),
    );
  }
}
