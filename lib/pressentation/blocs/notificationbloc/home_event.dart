import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

abstract class HomeEvent{}
class HomeStart extends HomeEvent{}
class HomeLoadedEvent extends HomeEvent {
 // HomeLoadedEvent(this.index);
  //HomeLoadedEvent(this.notificationListt);
 // List<ServiceNotificationEvent> notificationListt = <ServiceNotificationEvent>[];
// int index;
  // HomeLoadedEvent(this.notificationListt);
 //List<ServiceNotificationEvent>notificationListt = <ServiceNotificationEvent>[];

}
class GetPermisionEvent extends HomeEvent {

}