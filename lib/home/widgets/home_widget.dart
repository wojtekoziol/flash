import 'package:flash/config/constants.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.color,
    required this.value,
    required this.title,
  });

  final Color color;
  final int value;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(kPaddingM),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$value',
              style: textTheme.headline5!.copyWith(color: color),
            ),
            Text(
              title,
              style: textTheme.subtitle2!.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
