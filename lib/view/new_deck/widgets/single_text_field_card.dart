import 'package:flash/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SingleTextFieldCard extends HookWidget {
  const SingleTextFieldCard({
    super.key,
    required this.onEditingComplete,
    required this.title,
  });

  final void Function(String text) onEditingComplete;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final controller = useTextEditingController();
    final focusNode = useFocusNode();

    useEffect(() {
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          onEditingComplete(controller.text);
        }
      });
      return;
    }, []);

    return GestureDetector(
      onTap: focusNode.unfocus,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.subtitle1),
            const SizedBox(height: kPaddingS),
            TextFormField(
              focusNode: focusNode,
              controller: controller,
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
          ],
        ),
      ),
    );
  }
}
