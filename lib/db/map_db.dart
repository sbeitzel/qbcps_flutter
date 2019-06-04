import 'dart:async';

import 'package:tuple/tuple.dart';

class MapDB<K, V> {
  Map<K, V> _map = {};
  // ignore: close_sinks
  StreamController<Tuple2<K, V>> _streamController =
      StreamController<Tuple2<K, V>>.broadcast();

  MapDB();

  V put(K key, V value) {
    V oldValue = _map[key];
    _map[key] = value;
    _streamController.add(Tuple2<K, V>(key, value));
    return oldValue;
  }

  V get(K key) {
    return _map[key];
  }

  Iterable<V> values() {
    return _map.values;
  }

  Stream<Tuple2<K, V>> getChangeStream() {
    return _streamController.stream;
  }

  Stream<V> getChangesForKey(K key) {
    // ignore: close_sinks
    StreamController<V> changeController = StreamController();
    changeController.add(_map[key]);
    changeController
        .addStream(_streamController.stream.where((Tuple2<K, V> tuple) {
      return key == tuple.item1;
    }).map<V>((Tuple2<K, V> tuple) => tuple.item2));
    return changeController.stream;
  }
}
