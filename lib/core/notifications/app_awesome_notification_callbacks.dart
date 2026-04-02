import 'package:awesome_notifications/awesome_notifications.dart';

/// Entry point for [AwesomeNotifications.setListeners] (background isolates).
class AppAwesomeNotificationCallbacks {
  AppAwesomeNotificationCallbacks._();

  @pragma('vm:entry-point')
  static Future<void> onActionReceived(ReceivedAction action) async {}
}
