import 'package:bloc/bloc.dart';

class CounterBlocProvider extends Cubit<int> {
  CounterBlocProvider() : super(5);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}
