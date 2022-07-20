import 'package:flash/config/constants.dart';
import 'package:flutter/material.dart';

class CardDeck extends StatelessWidget {
  const CardDeck({
    super.key,
    required this.category,
    required this.title,
    required this.user,
  });

  final String category;
  final String title;
  final String user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.lerp(
                  Colors.black,
                  theme.colorScheme.primary,
                  0.7,
                )!
                    .withOpacity(0.2),
                blurRadius: 14,
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              border: Border.all(color: theme.dividerColor),
              borderRadius: BorderRadius.circular(kPaddingM),
            ),
            child: Padding(
              padding: const EdgeInsets.all(kPaddingM),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: textTheme.subtitle2!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: kPaddingS),
                  Text(title, style: textTheme.subtitle1),
                  const SizedBox(height: kPaddingS),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: kPaddingS,
                        backgroundColor: Colors.amber,
                      ),
                      const SizedBox(width: kPaddingS),
                      Text(user, style: textTheme.bodyText2),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
