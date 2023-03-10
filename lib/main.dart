import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome/cat_bloc/cat_bloc.dart';
import 'package:welcome/next.dart';
import 'package:welcome/text_bloc/text_bloc.dart';
import 'package:welcome/wallet/wallet_bloc.dart';
import 'package:welcome/welcome.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatBloc(),
        ),
        BlocProvider(
          create: (context) => WalletBloc(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => WelcomeScreen(),
          '/next': (context) => NextScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
