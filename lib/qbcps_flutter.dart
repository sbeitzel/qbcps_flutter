/// A library of miscellaneous utility classes which I (the developer)
/// wind up using in my projects over and over.
///
/// Principally used in creating tests and in doing offline development
/// is the [MapDB] class. It's handy because, like with Firebase, client
/// code can subscribe to receive notifications of data updates. I find
/// it very useful for developing middleware tests and for standing in
/// for Firebase.
///
/// The [CircularArray] class is useful for situations where I want to have
/// a list of elements that alternates and which never ends. So far, I
/// use it to store user objects to simulate logging in and out for test
/// cases. For example, log in as admin and do stuff, log in as user and
/// look at things, log in as admin again, log in as user again, over and
/// over. This has been very useful for doing development while I have
/// no Internet connection.
library qbcps_flutter;

export 'collections/circular_array.dart';
export 'db/map_db.dart';
export 'stream/accumulator_stream.dart';
