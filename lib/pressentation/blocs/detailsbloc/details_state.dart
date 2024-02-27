import 'package:notification_listener_service/notification_event.dart';

class DetailState {}
class LoadingDetailState extends DetailState{

}
class InisializeDetailState extends DetailState{
  
}
class LoadedDetailState extends DetailState{
  // LoadedDetailState(this.notificationListt);
  // List notificationListt = <ServiceNotificationEvent>[];

  // LoadedHomeState({required this.mobile});
  //   final mobile;
}
class ErrorDetailState extends DetailState{
  
}
