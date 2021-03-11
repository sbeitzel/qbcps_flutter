import 'package:qbcps_flutter/qbcps_flutter.dart';
import 'package:test/test.dart';

// ignore: always_declare_return_types
main() {
  group('MapDB unit tests', () {
    test('Change subscription starts with current value', () {
      testChangeSubscription();
    });
  });

  group('AccumulatorStream unit tests', () {});

  group('CircularArray unit tests', () {
    test('Two element list iterates three times', () {
      testCircleThreeTimes();
    });
  });
}

void testChangeSubscription() {
  var db = MapDB<String, String>();
  db.put('key', 'value');
  var changeStream = db.getChangesForKey('key');
  changeStream.listen((value) {
    print('Received a value on the changeStream: $value');
  });
  db.put('key', 'second value');
}

void testCircleThreeTimes() {
  var ra = CircularArray<int>([1, 2]);
  var circularIterator = ra.iterator;
  expect(circularIterator.current, 1);
  circularIterator.moveNext();
  expect(circularIterator.current, 2);
  expect(circularIterator.moveNext(), true);
  expect(circularIterator.current, 1);
}
