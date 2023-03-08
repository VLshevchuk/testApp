import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ColorEvent {}
class BlackColorEvent extends ColorEvent{}
class PinkColorEvent extends ColorEvent{}

class ColorBloc extends Bloc<ColorEvent,Color>{
  ColorBloc() : super(Colors.black) {
    on<BlackColorEvent>((event,emit) => emit(Colors.black));
    on<PinkColorEvent>((event,emit) => emit(Colors.pink));

  }
}

