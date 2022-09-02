import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NicknameField extends HookWidget {
  const NicknameField({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          created: (nickname, _) => controller.text = nickname,
        );
      },
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        onEditingComplete: () {
          context.read<ProfileCubit>().update(nickname: controller.text);
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
      ),
    );
  }
}
