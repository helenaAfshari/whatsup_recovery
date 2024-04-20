
import 'package:flutter/material.dart';
import 'package:notif/pressentation/route/screen_names.dart';
import 'package:notif/pressentation/screens/intro/intro_screen.dart';
import 'package:notif/pressentation/screens/notificationhistory/details_notification_history_list.dart';
import 'package:notif/pressentation/screens/notificationhistory/notification_hisory.dart';
import 'package:notification_listener_service/notification_event.dart';

Map<String,Widget Function(BuildContext)> routes ={
  
 ScreenNames.introRoot : (contex) => IntroScreen(),
 ScreenNames.notificationHistoryScreen : (contex) => NotificationHistory(),

ScreenNames.detailsNotificationHistoryListScreen : (contex) => DetailsNotificationHistoryList(room: null),
//  ScreenNames.detailsNotificationHistoryListScreen : (contex) => DetailsNotificationHistoryList(formattedDatee: DateTime.now()),
//درست اخرش
// ScreenNames.detailsNotificationHistoryListScreen : (contex) => DetailsNotificationHistoryList(formattedDatee: DateTime.now(), notificationListt: [],),

};