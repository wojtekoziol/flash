import 'package:flash/data/bloc/flashcards/flashcards_cubit.dart';
import 'package:flash/view/flashcards/view/card_view.dart';
import 'package:flash/view/flashcards/view/finished_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlashcardsView extends StatelessWidget {
  const FlashcardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlashcardsCubit, FlashcardsState>(
      builder: (context, state) {
        return state.maybeMap(
          finished: (_) => const FinishedView(),
          orElse: CardView.new,
        );
      },
    );
  }
}
