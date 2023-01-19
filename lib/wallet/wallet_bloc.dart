import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc() : super(const WalletState()) {
    on<InitWalletData>(_initWalletData);
    on<ChangeCardType>(_changeCardType);
    on<ShowOrHideAmount>(_showOrHideAmount);
    on<DetectSwipeDown>(_detectSwipeDown);
    on<DetectSwipeUp>(_detectSwipeUp);
  }

  void _initWalletData(InitWalletData event, Emitter<WalletState> emit) async {
    print('_initWalletData');
    emit(
      state.copyWith(
          name: "RHYLVIN DALE TINADOR",
          currency: 'PHP',
          walletType: 'MAIN WALLET',
          cardType: CardType.full,
          amount: '10,000.00',
          cardNumber: '654-3-654222-65-8'),
    );
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
