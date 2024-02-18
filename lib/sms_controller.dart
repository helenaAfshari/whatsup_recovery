import 'package:get/get.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class SmsController extends GetxController{
RxList notificationListt = RxList<ServiceNotificationEvent>();

 @override
  void onInit() {
    super.onInit();
    listenerNotificationn();
  }

void requestForPermisionnnn()async{
  print("Requesting Permision");
  final bool status = await NotificationListenerService.isPermissionGranted();
  if(status != true){
    print("No Permision");
    final bool statuss = 
    await  NotificationListenerService.requestPermission();
    return;
  }
  listenerNotificationn();
}
  void listenerNotificationn(){
    print("Listening Sms");
    NotificationListenerService.notificationsStream.listen((event) {
      print("Curent notification: $event");
      notificationListt.add(event);
    });
  }


//   void startListening() async {
//     print("start listening");
//     var hasPermission = await NotificationsListener.hasPermission;
//     if (hasPermission!) {
//         print("no permission, so open settings");
//         NotificationsListener.openPermissionSettings();
//         return;
//     }

//     var isR = await NotificationsListener.isRunning;

//     if (isR!) {
//         await NotificationsListener.startService();
//     }

//     // setState(() => started = true);
// }

// void requestForPermision() async{
//   final bool statuse = await 
//   print("registration for permision");
//   var hasPermision = await NotificationsListener.hasPermission;
//   if(hasPermision!){
//     print("No Permission");
//     NotificationsListener.openPermissionSettings();
//    return ;
//   }
//   listenNotification();

// }

// void listenNotification()async{
//   print("Listening Notification");
//    NotificationsListener.initialize();
//    NotificationsListener.receivePort?.listen((e)=>print(e) );
// }

}