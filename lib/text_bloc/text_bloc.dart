import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'text_event.dart';
part 'text_state.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(const TextState()) {
    on<SaveText>(_onSaveText);
    on<NavigateToNext>(_navigateToNext);
  }

  void _onSaveText(SaveText event, Emitter<TextState> emit) {
    final text = event.text;
    emit(
      state.copyWith(
        text: text,
      ),
    );
  }

  void _navigateToNext(NavigateToNext event, Emitter<TextState> emit) {

  }
}
