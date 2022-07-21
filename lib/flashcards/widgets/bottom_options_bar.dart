import 'package:flash/config/constants.dart';
import 'package:flutter/material.dart';

class BottomOptionsBar extends StatelessWidget {
  const BottomOptionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.floatingActionButtonTheme.backgroundColor!,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: kPaddingL, bottom: kPaddingM),
          child: Text(
            'Reveal Answer',
            style: theme.textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
