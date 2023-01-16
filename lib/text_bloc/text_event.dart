part of 'text_bloc.dart';

@immutable
abstract class TextEvent extends Equatable {
  const TextEvent();

  @override
  List<Object> get props => [];
}

class SaveText extends TextEvent {
  const SaveText({required this.text});
  final String text;

  @override
  List<Object> get props => [text];
}

class NavigateToNext extends TextEvent {}
