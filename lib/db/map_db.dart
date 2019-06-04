import 'dart:async';

import 'package:tuple/tuple.dart';

/// An in-memory database, backed by a [Map].
///
/// MapDB offers a [Stream] to which interested code may subscribe. When
/// the contents of this database are modified, the stream will emit data
/// events containing the changes.
///
/// **Note:** because the database consists of key:value pairs, the author
/// has found it convenient for the [Stream] to traffic in [Tuple2] objects,
/// where the Tuple's first value is the key and the second is the value.
class MapDB<K, V> {
  Map<K, V> _map = {};
  // ignore: close_sinks
  StreamController<Tuple2<K, V>> _streamController =
      StreamController<Tuple2<K, V>>.broadcast();

  /// Constructs an empty MapDB.
  MapDB();

  /// Inserts (or replaces) [value] at [key] in this database.
  ///
  /// The previous value for [key], if any, is returned. If there was no
  /// previous value -- that is, if this is an INSERT rather than an UPDATE --
  /// then the return value is `null`.
  V put(K key, V value) {
    V oldValue = _map[key];
    _map[key] = value;
    _streamController.add(Tuple2<K, V>(key, value));
    return oldValue;
  }

  /// Get the value stored at [key] in this database. If there isn't one,
  /// this method will return `null` rather than throw an exception.
  ///
  /// See [Map.[]].
  V get(K key) {
    return _map[key];
  }

  /// Get all the values that are stored in this database.
  ///
  /// See [Map.values].
  Iterable<V> values() {
    return _map.values;
  }

  /// Get the change [Stream] for this database.
  ///
  /// All modifications to the database contents will be emitted by the
  /// returned [Stream].
  Stream<Tuple2<K, V>> getChangeStream() {
    return _streamController.stream;
  }

  /// Get the change [Stream] for [key].
  ///
  /// The first event on the returned [Stream] will be the current value
  /// stored at [key]. Whenever a new value is stored at [key], that value
  /// will be sent out on the returned stream.
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
