import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome/components/cards/wallet_card_component.dart';
import 'package:welcome/wallet/wallet_bloc.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1.0,
                pageSnapping: true,
                initialPage: 0,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                WalletCardComponent(
                    backgroundId: 0,
                    name: "RHYLVIN DALE TINADOR",
                    currency: 'PHP',
                    walletType: 'MAIN WALLET',
                    cardType: CardType.full,
                    amount: '10,000.00',
                    cardNumber: '654-3-654222-65-8'),
                WalletCardComponent(
                    backgroundId: 1,
                    name: "RHYLVIN DALE TINADOR",
                    currency: 'PHP',
                    walletType: 'SUB WALLET',
                    cardType: CardType.full,
                    amount: '99,999.99',
                    cardNumber: '654-3-654222-65-8'),
                WalletCardComponent(
                    backgroundId: 2,
                    name: "RHYLVIN DALE TINADOR",
                    currency: 'PHP',
                    walletType: 'CHILD WALLET',
                    cardType: CardType.full,
                    amount: '10,000.00',
                    cardNumber: '654-3-654222-65-8'),
              ]),
          ElevatedButton(
              onPressed: () => context.read<WalletBloc>().add(ChangeCardType()),
              child: const Text('Change Card Type')),
        ],
      ),
    );
  }
}
