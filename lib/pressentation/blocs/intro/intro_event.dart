
import 'package:flutter/material.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

abstract class IntroEvent{}
class IntroStart extends IntroEvent{}
class IntroLoadedEvent extends IntroEvent {


}
class AddPermisionEvent extends IntroEvent {
  AddPermisionEvent(this.isPermision);
  
  Future<bool> isPermision =NotificationListenerService.requestPermission();
 // BuildContext context;

}


// class IntroLoadedEventt extends IntroEvent{
//    final int selectEstekhareId ;
//    IntroLoadedEventt(this.selectEstekhareId,);
// }


// class ChangeTabgg extends IntroEvent {
//    ChangeTabgg();
// }
