import 'package:qbcps_flutter/db/map_db.dart';
import 'package:tuple/tuple.dart';

/// Example code showing how to use [MapDB]

void main() {
  MapDB<String, String> stringDatabase = MapDB<String, String>();

  stringDatabase.getChangeStream().listen((Tuple2<String, String> data) {
    print(
        "Change stream just reported that key: ${data.item1} was assigned value: ${data.item2}");
  });

  stringDatabase.getChangesForKey("A_Key").listen((String value) {
    print("Change stream for key `A_Key` reports value: $value");
  });

  String oldValue = stringDatabase.put("A_Key", "A_value");
  print("The freshly created MapDB contained $oldValue for key 'A_Key'");

  String freshlySetValue = stringDatabase.get("A_Key");
  print("Fetched value $freshlySetValue for key 'A_Key'");

  // both change streams will emit a data event for this
  stringDatabase.put("A_Key", "A_second_value");

  // only the database change stream (not the change stream for key 'A_Key') will emit data for this
  stringDatabase.put("B_Key", "B_value");

  stringDatabase.delete('A_Key');
}
