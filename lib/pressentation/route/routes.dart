
import 'package:WhatsUp/screens/intro/intro_screen.dart';
import 'package:WhatsUp/screens/notificationhistory/details_notification_history_list.dart';
import 'package:WhatsUp/screens/notificationhistory/notification_hisory.dart';
import 'package:flutter/material.dart';
import 'package:WhatsUp/pressentation/route/screen_names.dart';
import 'package:notification_listener_service/notification_event.dart';

Map<String,Widget Function(BuildContext)> routes ={
 ScreenNames.introRoot : (contex) => IntroScreen(),
  ScreenNames.notificationHistoryScreen : (contex) => NotificationHistory(),
 ScreenNames.detailsNotificationHistoryListScreen : (contex) => DetailsNotificationHistoryList(room: null),
 
};