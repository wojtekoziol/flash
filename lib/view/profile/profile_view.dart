import 'package:flash/config/constants.dart';
import 'package:flash/view/profile/nickname_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ProfileSection(),
        _SettingsSection(),
      ],
    );
  }
}

class _ProfileSection extends HookWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    final textFieldFocusNode = useFocusNode();

    return GestureDetector(
      onTap: textFieldFocusNode.unfocus,
      child: Container(
        height: screenSize.height / 2,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(kPaddingXL),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: kPaddingXL),
        alignment: const Alignment(0, 0.25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Your Profile',
              style: theme.textTheme.headline3,
            ),
            const SizedBox(height: kPaddingXL),
            Row(
              children: [
                Expanded(
                  child: NicknameField(
                    focusNode: textFieldFocusNode,
                  ),
                ),
                const SizedBox(width: kPaddingL),
                CircleAvatar(
                  radius: kPaddingS * 3,
                  backgroundColor:
                      theme.floatingActionButtonTheme.backgroundColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
