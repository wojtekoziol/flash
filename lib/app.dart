import 'package:flash/config/theme.dart';
import 'package:flash/data/bloc/profile/profile_cubit.dart';
import 'package:flash/view/navigation/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: MaterialApp(
        title: 'Flash',
        debugShowCheckedModeBanner: false,
        theme: kLightTheme,
        home: const NavigationView(),
      ),
    );
  }
}
