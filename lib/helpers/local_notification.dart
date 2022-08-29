import 'package:chat_app/pages/bottom_bar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import '../main.dart';
import 'functions.dart';

class NotificationApi {
  static final _notification = FlutterLocalNotificationsPlugin();
  var scheduledNotificationDateTime =
  new DateTime.now().add(new Duration(seconds: 5));



  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings("logo");
    final ioS = IOSInitializationSettings();
    // When app is closed
    final details =  await _notification.getNotificationAppLaunchDetails();
    if(details!=null && details.didNotificationLaunchApp){
      pushPage(
          context: navigatorKey.currentContext, page: BottomBar());

    }
    final settings = InitializationSettings(android: android, iOS: ioS);
    await _notification.initialize(
      settings,
      onSelectNotification: (payload) async {
        pushPage(
            context: navigatorKey.currentContext, page: BottomBar());
      },
    );

  }

  static Future _notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails("channel id", "channel name",
            importance: Importance.max, icon: 'logo'),
        iOS: IOSNotificationDetails());
  }

  static Future showNotification(
      {int id = 0, title,  body, payload}) async {
    return _notification.show(id, title, body, await _notificationDetails());
  }
}
