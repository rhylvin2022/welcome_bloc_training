part of 'text_bloc.dart';

class TextState extends Equatable{
  const TextState({
    this.text = '',
});

  final String text;

  TextState copyWith({
  String? text,
  }) {
    return TextState(
      text: text ?? this.text,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [text];
}