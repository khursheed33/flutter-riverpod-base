import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod_base/core/extensions/message_log.dart';
import 'package:flutter_riverpod_base/core/notifications/app_awesome_notification_callbacks.dart';

abstract final class AppAwesomeNotificationChannels {
  static const String groupKey = 'widget_gallery';
  static const String instant = 'gallery_instant';
  static const String scheduled = 'gallery_scheduled';
}

abstract final class AppAwesomeNotificationIds {
  static const int instantDemo = 91001;
  static const int scheduledDemo = 91002;
}

bool get appAwesomeNotificationsSupported => !kIsWeb;

Future<void> initializeAppAwesomeNotifications() async {
  if (kIsWeb) return;

  final awesome = AwesomeNotifications();
  final ok = await awesome.initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: AppAwesomeNotificationChannels.groupKey,
        channelKey: AppAwesomeNotificationChannels.instant,
        channelName: 'Gallery — instant',
        channelDescription: 'Immediate local notifications from the widget gallery',
        defaultColor: const Color(0xFF6750A4),
        ledColor: Colors.white,
        importance: NotificationImportance.Default,
      ),
      NotificationChannel(
        channelGroupKey: AppAwesomeNotificationChannels.groupKey,
        channelKey: AppAwesomeNotificationChannels.scheduled,
        channelName: 'Gallery — scheduled',
        channelDescription: 'Scheduled local notifications from the widget gallery',
        defaultColor: const Color(0xFF6750A4),
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      ),
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: AppAwesomeNotificationChannels.groupKey,
        channelGroupName: 'Widget gallery',
      ),
    ],
    debug: kDebugMode,
  );

  if (!ok) {
    'AwesomeNotifications: initialize failed'.log();
    return;
  }

  await awesome.setListeners(
    onActionReceivedMethod: AppAwesomeNotificationCallbacks.onActionReceived,
  );
}

Future<bool> requestAwesomeNotificationPermission() async {
  if (kIsWeb) return false;
  if (await AwesomeNotifications().isNotificationAllowed()) return true;
  return AwesomeNotifications().requestPermissionToSendNotifications();
}

Future<bool> showGalleryInstantNotification() async {
  if (kIsWeb) return false;
  return AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: AppAwesomeNotificationIds.instantDemo,
      channelKey: AppAwesomeNotificationChannels.instant,
      title: 'Instant notification',
      body: 'Fired immediately from the widget gallery (awesome_notifications).',
    ),
  );
}

Future<bool> scheduleGalleryNotification({
  Duration delay = const Duration(seconds: 5),
}) async {
  if (kIsWeb) return false;
  final when = DateTime.now().add(delay);
  final timeStr = _formatScheduleTime(when);
  return AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: AppAwesomeNotificationIds.scheduledDemo,
      channelKey: AppAwesomeNotificationChannels.scheduled,
      title: 'Scheduled notification',
      body: 'Scheduled from the gallery for $timeStr (local time).',
    ),
    schedule: NotificationCalendar.fromDate(
      date: when,
      preciseAlarm: true,
    ),
  );
}

Future<void> cancelGalleryScheduledNotification() async {
  if (kIsWeb) return;
  await AwesomeNotifications().cancelSchedule(AppAwesomeNotificationIds.scheduledDemo);
}

String _formatScheduleTime(DateTime t) {
  final loc = t.toLocal();
  final h = loc.hour.toString().padLeft(2, '0');
  final m = loc.minute.toString().padLeft(2, '0');
  final s = loc.second.toString().padLeft(2, '0');
  return '$h:$m:$s';
}
