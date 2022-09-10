import 'package:flash/config/constants.dart';
import 'package:flash/config/theme.dart';
import 'package:flash/data/bloc/user/user_cubit.dart';
import 'package:flash/view/navigation/navigation_view.dart';
import 'package:flash/view/profile/new_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(Hive.box(kProfileBox)),
      child: MaterialApp(
        title: 'Flash',
        debugShowCheckedModeBanner: false,
        theme: kLightTheme,
        home: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return state.map(
              notCreated: (_) => const NewProfileView(),
              created: (_) => const NavigationView(),
            );
          },
        ),
      ),
    );
  }
}
