part of 'cat_bloc.dart';

class CatState extends Equatable {
  const CatState({
    this.fact = '',
    this.loading = false,
  });

  final String fact;
  final bool loading;

  CatState copyWith({
    String? fact,
    bool? loading,
  }) {
    return CatState(
      fact: fact ?? this.fact,
      loading: loading ?? this.loading,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [fact, loading];
}
