import 'package:learning_bloc/widgets/bloc_provider.dart';
import 'dart:async';

class CounterBloc implements BlocBase {
  int _counter;

  // Streams to handle the counter
  StreamController<int> _counterController = StreamController<int>();
  Sink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  // Streams to handle the increment of the counter
  StreamController<int> _incrementController = StreamController<int>();
  Sink<int> get incrementCounter => _incrementController.sink;

  CounterBloc() {
    _counter = 0;
    _incrementController.stream.listen(_increment);
  }

  @override
  void dispose() {
    _counterController.close();
    _incrementController.close();
  }

  void _increment(data) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }
}
