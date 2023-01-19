import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(const WalletState()) {
    on<ChangeCardType>(_changeCardType);
    on<ShowOrHideAmount>(_showOrHideAmount);
    on<DetectSwipeDown>(_detectSwipeDown);
    on<DetectSwipeUp>(_detectSwipeUp);
  }

  void _changeCardType(ChangeCardType event, Emitter<WalletState> emit) async {
    CardType cardType = CardType.full;
    if (state.cardType == CardType.full) {
      cardType = CardType.shrink;
    }
    emit(state.copyWith(cardType: cardType));
  }

  void _showOrHideAmount(
      ShowOrHideAmount event, Emitter<WalletState> emit) async {
    emit(state.copyWith(showAmount: !state.showAmount));
  }

  void _detectSwipeUp(DetectSwipeUp event, Emitter<WalletState> emit) async {
    print('_detectSwipeUp');
    emit(state.copyWith(showAmount: true));
  }

  void _detectSwipeDown(
      DetectSwipeDown event, Emitter<WalletState> emit) async {
    print('_detectSwipeDown');
    emit(state.copyWith(showAmount: false));
  }
}
