part of 'wallet_bloc.dart';

enum CardType { full, shrink }

class WalletState extends Equatable {
  const WalletState({
    this.cardType = CardType.full,
    this.showAmount = true,
  });

  final CardType cardType;
  final bool showAmount;

  WalletState copyWith({
    CardType? cardType,
    String? name,
    String? walletType,
    String? currency,
    String? amount,
    String? cardNumber,
    bool? showAmount,
  }) {
    return WalletState(
      cardType: cardType ?? this.cardType,
      showAmount: showAmount ?? this.showAmount,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [cardType, showAmount];
}
