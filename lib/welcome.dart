import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome/cat_bloc/cat_bloc.dart';
import 'package:welcome/text_bloc/text_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

final TextEditingController controller = TextEditingController();

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
      ),
      body: Align(
        child: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Text(state.fact ?? ''),
                ),
                state.loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          context.read<CatBloc>().add(GetCatFact());
                        },
                        child: const Text('Get Cat Fact'),
                      ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/next');
                  },
                  child: const Text('Next Page'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
