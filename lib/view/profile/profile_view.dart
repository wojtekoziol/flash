import 'dart:io';

import 'package:flash/config/constants.dart';
import 'package:flash/config/get_it.dart';
import 'package:flash/data/bloc/user/user_cubit.dart';
import 'package:flash/view/profile/widgets/nickname_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileView extends HookWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final textFieldFocusNode = useFocusNode();

    return GestureDetector(
      onTap: textFieldFocusNode.unfocus,
      child: Column(
        children: [
          ChangeNotifierProvider.value(
            value: textFieldFocusNode,
            child: const _ProfileSection(),
          ),
          const _SettingsSection(),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Container(
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
              const Expanded(child: NicknameField()),
              const SizedBox(width: kPaddingL),
              GestureDetector(
                onTap: () async {
                  final picker = getIt<ImagePicker>();
                  final file = await picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 20,
                  );
                  if (file == null) return;
                  final cubit = context.read<UserCubit>();
                  cubit.update(profilePictureFile: File(file.path));
                },
                child: BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    final file = state.whenOrNull(
                      created: (user, _) => user.profilePictureFile,
                    );
                    if (file == null) {
                      return CircleAvatar(
                        radius: kPaddingS * 3,
                        backgroundColor:
                            theme.floatingActionButtonTheme.backgroundColor,
                        child: Text('+', style: theme.textTheme.bodyText2),
                      );
                    }

                    return ClipOval(
                      child: Image.file(
                        file,
                        width: kPaddingXL,
                        height: kPaddingXL,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
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
