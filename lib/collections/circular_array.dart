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
class CircularArray<E> implements Iterator<E> {
  List<E> _items = [];
  int _index = 0;

  CircularArray(Iterable<E> items) {
    _items.addAll(items);
  }

  @override
  E get current => _items[_index];

  @override
  bool moveNext() {
    if (++_index >= _items.length) {
      _index = 0;
    }
    return true;
  }
}
