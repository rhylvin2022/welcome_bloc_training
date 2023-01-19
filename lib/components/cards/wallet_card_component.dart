import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../wallet/wallet_bloc.dart';

class WalletCardComponent extends StatelessWidget {
  final int backgroundId;
  final String name;
  final String currency;
  final String walletType;
  final CardType cardType;
  final String amount;
  final String cardNumber;
  WalletCardComponent({
    Key? key,
    required this.backgroundId,
    required this.name,
    required this.currency,
    required this.walletType,
    required this.cardType,
    required this.amount,
    required this.cardNumber,
  }) : super(key: key);

  bool panDirectionUp = true;
  @override
  Widget build(BuildContext context) {
    String fullBackground = '';
    String shrinkBackground = '';
    if (backgroundId == 0) {
      fullBackground = 'assets/images/wallet_cards/card_main_full.png';
      shrinkBackground = 'assets/images/wallet_cards/card_main_shrink.png';
    } else if (backgroundId == 1) {
      fullBackground = 'assets/images/wallet_cards/card_sub_full.png';
      shrinkBackground = 'assets/images/wallet_cards/card_sub_shrink.png';
    } else if (backgroundId == 2) {
      fullBackground = 'assets/images/wallet_cards/card_child_full.png';
      shrinkBackground = 'assets/images/wallet_cards/card_child_shrink.png';
    } else {
      fullBackground = 'assets/images/wallet_cards/card_main_full.png';
      shrinkBackground = 'assets/images/wallet_cards/card_main_shrink.png';
    }
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        if (state.cardType == CardType.full) {
          return Center(
            child: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dy > 0 && details.delta.dy > 3.0) {
                  print('swipe down: ${details.delta.dy}');
                  panDirectionUp = false;
                  // context.read<WalletBloc>().add(DetectSwipeDown());
                } else if (details.delta.dy < 0 && details.delta.dy < -3.0) {
                  print('swipe up: ${details.delta.dy}');
                  panDirectionUp = true;
                  // context.read<WalletBloc>().add(DetectSwipeUp());
                }
              },
              onPanEnd: (details) {
                if (panDirectionUp) {
                  context.read<WalletBloc>().add(DetectSwipeUp());
                } else {
                  context.read<WalletBloc>().add(DetectSwipeDown());
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.24,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(fullBackground),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Text(
                          walletType,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Text(
                              currency,
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              state.showAmount ? amount : '__,___.__',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Inter-Bold',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                // onTap: () => context
                                //     .read<WalletBloc>()
                                //     .add(ShowOrHideAmount()),
                                child: Transform.scale(
                              scaleX: -1,
                              child: Icon(
                                state.showAmount
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.white,
                              ),
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 20,
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontFamily: 'Inter-Bold',
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: Text(
                          cardNumber,
                          style: const TextStyle(
                              fontFamily: 'Inter-BOLD',
                              color: Colors.white,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(shrinkBackground),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3)),
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          walletType,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 15),
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                              fontFamily: 'Inter-Bold',
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Row(
                          children: [
                            Text(
                              currency,
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              state.showAmount ? amount : '__,___.__',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Inter-Bold',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                          child: Text(
                            cardNumber,
                            style: const TextStyle(
                                fontFamily: 'Inter-BOLD',
                                color: Colors.white,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
