import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationsHandler {
  int createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(100000);
  }

  Future<void> createNotification(int period) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title: '${Emojis.time_watch} Congrats !!!',
        body: 'You Won The Challenge !!',
        notificationLayout: NotificationLayout.Default,
        backgroundColor: Colors.amber,
        color: Colors.deepPurple,
      ),
      schedule: NotificationCalendar(
        day: DateTime.now().day,
        hour: DateTime.now().hour,
        minute: DateTime.now().minute,
        second: DateTime.now().second + period,
        millisecond: 0,
      ),
    );
  }

  Future<void> cancelScheduledNotifications() async {
    await AwesomeNotifications().cancelAllSchedules();
  }
}
