import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome/text_bloc/text_bloc.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Center(
            child: Text('Next'),
          ),
          // BlocBuilder<TextBloc, TextState>(
          //   builder: (context, state) {
          //     return Center(
          //       child: Text(state.text ?? ''),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
