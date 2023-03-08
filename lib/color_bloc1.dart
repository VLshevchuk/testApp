import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { event_red, event_green }

class ColorBloc {
  Color _color = Colors.red; //по умолчанию хранит красный цвет
  final _inputEventController =
      StreamController<ColorEvent>(); //ПРИНИМАЕТ ТИП COLOREVENT
  //РЕАЛ ГЕТТЕР ДЛЯ ВХОДНОГО ПОТОКА
  StreamSink<ColorEvent> get inputEventSink => _inputEventController
      .sink; //С ПАРАМЕТРОМ СИНК,ВЫЗЫВАЕМ СИН ЧТО БЫ ДОБ СОБЫТИЕ В ПОТОК
  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStateController.stream;
  void _mapEventToState(ColorEvent event) {
    //В качестве параметра принимает событие
    if (event == ColorEvent.event_red) {
      _color = Colors.red;
    } else if (event == ColorEvent.event_green) {
      _color = Colors.green;
    } else {
      throw Exception('Wrong Event Type');
    }
    _outputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
