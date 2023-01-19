part of 'wallet_bloc.dart';

enum CardType { full, shrink }

class WalletState extends Equatable {
  const WalletState({
    this.cardType = CardType.full,
    this.name = '',
    this.walletType = '',
    this.currency = '',
    this.amount = '',
    this.cardNumber = '',
    this.showAmount = true,
  });

  final CardType cardType;
  final String name;
  final String walletType;
  final String currency;
  final String amount;
  final String cardNumber;
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
      name: name ?? this.name,
      walletType: walletType ?? this.walletType,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      cardNumber: cardNumber ?? this.cardNumber,
      showAmount: showAmount ?? this.showAmount,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [cardType, name, walletType, currency, amount, cardNumber, showAmount];
}
