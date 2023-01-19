part of 'wallet_bloc.dart';

@immutable
abstract class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];
}

class ChangeCardType extends WalletEvent {}

class ShowOrHideAmount extends WalletEvent {}

class DetectSwipeUp extends WalletEvent {}

class DetectSwipeDown extends WalletEvent {}

//
// @immutable
// abstract class CatEvent extends Equatable {
//   const CatEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// class ShowLoading extends CatEvent {}
//
// class HideLoading extends CatEvent {}
//
// // class SaveCatText extends CatEvent {
// //   const SaveCatText({required this.text});
// //   final String text;
// //
// //   @override
// //   List<Object> get props => [text];
// // }
//
// class GetCatFact extends CatEvent {}
