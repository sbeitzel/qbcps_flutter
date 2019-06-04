import 'package:flutter_test/flutter_test.dart';
import 'package:qbcps_flutter/qbcps_flutter.dart';

main() {
  group("MapDB unit tests", () {
    test("Change subscription starts with current value", () {
      testChangeSubscription();
    });
  });

  group("AccumulatorStream unit tests", () {});
}

void testChangeSubscription() {
  MapDB<String, String> db = MapDB<String,String>();
  db.put("key", "value");
  Stream<String> changeStream = db.getChangesForKey("key");
  changeStream.listen((value) {
    print("Received a value on the changeStream: $value");
  });
  db.put("key", "second value");
}