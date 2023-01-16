import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:welcome/api/api.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  CatBloc() : super(const CatState()) {
    on<GetCatFact>(_onGetCatText);
    // on<ShowLoading>(_onShowLoading);
    // on<NavigateToNext>(_navigateToNext);
  }

  void _onGetCatText(GetCatFact event, Emitter<CatState> emit) async {
    emit(state.copyWith(loading: true));

    //declare outside text variable to be used
    var fact = '';
    //call the cat fact api to obtain cat facts
    await API.getRandomCatFactAPI().then((value) async {
      //decode the get response
      Map<String, dynamic> map = jsonDecode(value.body);
      print('${map['fact']}');
      //set the cat fact
      // store.dispatch(SetCatFact(catFact: map['fact']));
      fact = map['fact'];
    });

    emit(state.copyWith(fact: fact, loading: false));
  }

  // void _onShowLoading(ShowLoading event, Emitter<CatState> emit) {
  //   emit(state.copyWith(loading: true));
  // }
}
