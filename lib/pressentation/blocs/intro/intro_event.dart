
import 'package:notification_listener_service/notification_listener_service.dart';

abstract class IntroEvent{}
class IntroStart extends IntroEvent{}
class IntroLoadedEvent extends IntroEvent {
  IntroLoadedEvent(this.f);

  Future<bool> f;

  IntroLoadedEvent.withDefault() : f = NotificationListenerService.isPermissionGranted();
}

// class IntroLoadedEventt extends IntroEvent{
//    final int selectEstekhareId ;
//    IntroLoadedEventt(this.selectEstekhareId,);
// }


// class ChangeTabgg extends IntroEvent {
//    ChangeTabgg();
// }
