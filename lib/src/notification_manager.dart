import 'dart:async';

/// An interface to get the token used by Firebase Cloud Messaging to identify
/// a particular device.
///
/// The intention here is to have a layer of indirection so that testing and
/// offline development don't require actual communication with an external
/// service.
abstract class NotificationManager {
  /// Initialize the implementing class so that it is ready to work.
  /// Calling other methods (such as [getFCMToken]) before calling
  /// [init] is unlikely to work the way you want it to.
  void init();

  /// Get the token for the device this is executing on.
  Future<String>? getFCMToken();
}

/// A [NotificationManager] implementation that returns a fixed string for
/// the device token. Intended for use in tests only.
class DummyNotificationManager extends NotificationManager {
  /// The token this manager will always return.
  static const String DUMMY_TOKEN =
      '+++++%%%%%-----Not A Real Device Token-----%%%%%+++++';

  bool _initialized = false;

  @override
  Future<String>? getFCMToken() {
    if (_initialized) {
      return Future<String>(() => DUMMY_TOKEN);
    }
    print(
        'NotificationManager - USAGE PROBLEM: called getFCMToken() *before* calling init()');
    return null;
  }

  @override
  void init() {
    _initialized = true;
  }
}
