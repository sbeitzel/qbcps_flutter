import 'dart:core';

/// A list of elements which can be endlessly iterated.
///
/// For example, if one wanted an unending sequence of int
/// as: 1, 2, 1, 2, 1, 2... then one might use a [CircularArray]
/// thus:
/// ```dart
/// CircularArray<int> intIterator = CircularArray<int>([1,2]);
/// do {
///   print(intIterator.current);
/// } while (intIterator.moveNext());
/// ```
class CircularArray<E> extends Iterable<E> {
  final List<E> _items = [];

  CircularArray(Iterable<E> items) {
    _items.addAll(items);
  }

  @override
  Iterator<E> get iterator => _CAIterator(_items);

  @override
  int get length => _items.length;
}

class _CAIterator<E> implements Iterator<E> {
  final List<E> _items;

  int _index = 0;

  _CAIterator(this._items);

  @override
  E get current => _items[_index];

  @override
  bool moveNext() {
    _index++;
    if (_index >= _items.length) {
      _index = 0;
    }
    if (_index > _items.length - 1) {
      return false;
    }
    return true;
  }
}
