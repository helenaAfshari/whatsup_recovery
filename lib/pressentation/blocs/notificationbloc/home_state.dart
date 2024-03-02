
import 'package:intl/intl.dart';
import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class HomeState {}
class LoadingHomeState extends HomeState{

}
class InisializeHomeState extends HomeState{
  
}
// class LoadedHomeState extends HomeState {
//   LoadedHomeState(this.notificationListt);

//   List<RecoveryModel> notificationListt = [];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   sendNotificationsToScreen(notificationListt);
//   // }

//   void sendNotificationsToScreen(List<RecoveryModel> notifications) {
//     notifications.forEach((notification) {
//       ServiceNotificationEvent();
//         ServiceNotificationEvent(
//           title: notification.title,
//           content: notification.content,
//           // Here you can add other properties if needed
        
//       );
//     });
//   }
// }
class LoadedHomeState extends HomeState{
}
class ErrorHomeState extends HomeState{
  
}
