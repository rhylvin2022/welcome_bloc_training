part of 'cat_bloc.dart';

@immutable
abstract class CatEvent extends Equatable {
  const CatEvent();

  @override
  List<Object> get props => [];
}

class ShowLoading extends CatEvent {}

class HideLoading extends CatEvent {}

// class SaveCatText extends CatEvent {
//   const SaveCatText({required this.text});
//   final String text;
//
//   @override
//   List<Object> get props => [text];
// }

class GetCatFact extends CatEvent {}
