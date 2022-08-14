import 'package:flash/config/constants.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.index,
    required this.text,
  });

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 100,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kPaddingL),
                boxShadow: [
                  BoxShadow(
                    color: theme.cardColor,
                    offset: const Offset(0, kPaddingM),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(kPaddingL),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddingL,
              vertical: kPaddingXL,
            ),
            child: Column(
              children: [
                Text(
                  '$index',
                  style: textTheme.headline4,
                ),
                const SizedBox(height: kPaddingL),
                Text(text, style: textTheme.bodyText1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
