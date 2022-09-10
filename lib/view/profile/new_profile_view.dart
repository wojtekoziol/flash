import 'package:flash/config/constants.dart';
import 'package:flash/data/bloc/user/user_cubit.dart';
import 'package:flash/widgets/long_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NewProfileView extends HookWidget {
  const NewProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textEditingController = useTextEditingController();
    final focusNode = useFocusNode();

    final animationController =
        useAnimationController(duration: kClickAnimDuration);
    final clickAnimation = Tween<double>(begin: 1, end: 0.8)
        .chain(CurveTween(curve: kClickAnimCurve))
        .animate(animationController);

    return GestureDetector(
      onTap: focusNode.unfocus,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: SizedBox.shrink(),
                    ),
                    Image.asset('assets/images/new_profile_view.png'),
                    Text("Hi, what's your name?",
                        style: theme.textTheme.subtitle1),
                    const SizedBox(height: kPaddingM),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kPaddingL),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kPaddingM),
                          boxShadow: [
                            BoxShadow(
                              color: Color.lerp(
                                Colors.black,
                                theme.colorScheme.primary,
                                0.7,
                              )!
                                  .withOpacity(0.2),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: TextFormField(
                          focusNode: focusNode,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(kPaddingM),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(kPaddingM),
                              borderSide:
                                  BorderSide(color: theme.colorScheme.primary),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: kPaddingL,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox.shrink(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: kPaddingL),
                      child: ScaleTransition(
                        scale: clickAnimation,
                        child: LongButton(
                          onTap: () async {
                            await animationController
                                .forward()
                                .then((_) => animationController.reverse());
                            context
                                .read<UserCubit>()
                                .create(nickname: textEditingController.text);
                          },
                          color:
                              theme.floatingActionButtonTheme.backgroundColor,
                          child: Text(
                            'Create an account',
                            style: theme.textTheme.bodyText2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
