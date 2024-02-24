import 'package:notification_listener_service/notification_listener_service.dart';

abstract class HomeEvent{}
class HomeStart extends HomeEvent{}
class HomeLoadedEvent extends HomeEvent {


}
class GetPermisionEvent extends HomeEvent {
  
}