import 'package:flash/config/constants.dart';
import 'package:flash/widgets/long_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DoubleTextFieldCard extends HookWidget {
  const DoubleTextFieldCard({
    super.key,
    required this.onEditingComplete,
    required this.onDeleteButtonClicked,
    required this.title1,
    required this.title2,
    this.startText1,
    this.startText2,
    required this.index,
  });

  final void Function(String text1, String text2) onEditingComplete;
  final void Function() onDeleteButtonClicked;
  final String title1;
  final String title2;
  final String? startText1;
  final String? startText2;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final controller1 = useTextEditingController(text: startText1);
    final controller2 = useTextEditingController(text: startText2);
    final focusNode1 = useFocusNode();
    final focusNode2 = useFocusNode();

    useEffect(() {
      focusNode1.addListener(() {
        if (!focusNode1.hasFocus) {
          onEditingComplete(controller1.text, controller2.text);
        }
      });
      focusNode2.addListener(() {
        if (!focusNode2.hasFocus) {
          onEditingComplete(controller1.text, controller2.text);
        }
      });
      return;
    }, []);

    return GestureDetector(
      onTap: () {
        focusNode1.unfocus();
        focusNode2.unfocus();
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(kPaddingM),
          boxShadow: [
            BoxShadow(
              color: Color.lerp(Colors.black, theme.colorScheme.primary, 0.7)!
                  .withOpacity(0.2),
              blurRadius: 14,
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: kPaddingL,
          vertical: kPaddingM,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title1, style: theme.textTheme.subtitle1),
                Text('$index', style: theme.textTheme.subtitle1),
              ],
            ),
            const SizedBox(height: kPaddingS),
            TextFormField(
              focusNode: focusNode1,
              controller: controller1,
              decoration: InputDecoration(
                fillColor: theme.dividerColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kPaddingM),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kPaddingM),
                  borderSide: BorderSide(color: theme.colorScheme.secondary),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: kPaddingL,
                ),
              ),
            ),
            const SizedBox(height: kPaddingM),
            Row(
              children: [
                Text(
                  title2,
                  style: theme.textTheme.subtitle1,
                ),
              ],
            ),
            const SizedBox(height: kPaddingS),
            TextFormField(
              focusNode: focusNode2,
              controller: controller2,
              decoration: InputDecoration(
                fillColor: theme.dividerColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kPaddingM),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kPaddingM),
                  borderSide: BorderSide(color: theme.colorScheme.secondary),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: kPaddingL,
                ),
              ),
            ),
            const SizedBox(height: kPaddingL),
            LongButton(
              onTap: onDeleteButtonClicked,
              color: Colors.red,
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
