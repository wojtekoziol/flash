import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NicknameField extends HookWidget {
  const NicknameField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    final focusNode = context.read<FocusNode>();

    final controller = useTextEditingController(
      text: cubit.state.whenOrNull(created: (nickname, _, __) => nickname),
    );

    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      onChanged: (text) {
        cubit.update(nickname: text);
      },
      decoration: InputDecoration(
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        filled: true,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(kPaddingL),
          borderSide: BorderSide.none,
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(kPaddingL),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kPaddingL,
        ),
      ),
    );
  }
}
