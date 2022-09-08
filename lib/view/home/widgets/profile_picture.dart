import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kPaddingM),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          final imageFile = state.whenOrNull(
            created: (user, _) => user.profilePictureFile,
          );

          if (imageFile == null) {
            return Container(
              height: kPaddingXL,
              width: kPaddingXL,
              color: Colors.amber,
              child: const Icon(Icons.person),
            );
          }

          return Image.file(
            imageFile,
            width: kPaddingXL,
            height: kPaddingXL,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
