
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class IntroState {}
class LoadingIntroState extends IntroState{

}
class InisializeIntroState extends IntroState{
  
}
class LoadedIntroState extends IntroState{
  //LoadedIntroState(this.f);
  Future<bool> f = NotificationListenerService.isPermissionGranted();
}
class ErrorIntroState extends IntroState{
  
}



