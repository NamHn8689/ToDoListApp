import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'base_event.dart';

abstract class BaseBloc {
  BaseBloc() {
    _eventStreamController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception("Event false");
      }
      dispatchEvent(event);
    });
  }

  final StreamController<BaseEvent> _eventStreamController = StreamController();

  Sink<BaseEvent> get event => _eventStreamController.sink;

  void dispatchEvent(BaseEvent event);

  @mustCallSuper
  void dispose() {
    _eventStreamController.close();
  }
}
