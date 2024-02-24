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
    // final bool statuss = 
    // await  NotificationListenerService.requestPermission();
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
}


