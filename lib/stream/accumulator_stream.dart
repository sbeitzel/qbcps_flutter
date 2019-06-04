import 'dart:async';

typedef R ConversionCallback<R, T>(T arg);

/// This is a stream that accepts a list of futures and accumulates all their
/// results. When all the futures have completed, the accumulated results are
/// emitted as a single event (the list of results) and then a done event is
/// emitted.
class AccumulatorStream<E, D> {
  List<E> _elements = [];
  StreamController<List<E>> _controller = StreamController();

  ConversionCallback<E, D> _convert;

  AccumulatorStream(
      Iterable<Future<D>> futures, ConversionCallback<E, D> convert) {
    _convert = convert;

    Stream.fromFutures(futures).listen((D data) {
      _elements.add(_convert(data));
    }, onDone: () {
      _controller.add(_elements);
      _controller.close();
    }, onError: (error, trace) {
      _controller.addError(error, trace);
    });
  }

  Stream<List<E>> getStream() {
    return _controller.stream;
  }
}
