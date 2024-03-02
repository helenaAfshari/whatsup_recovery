import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_event.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_state.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // IntroBloc() : super(InisializeIntroState()) {
    int idext = 0;
    
    
    HomeBloc():super(InisializeHomeState()){
  List<ServiceNotificationEvent> notificationListt = <ServiceNotificationEvent>[];
    List<RecoveryModel> recovery =[];
        String content = recovery.isNotEmpty ? recovery[0].content ?? "" : "";
String formattedDateTime = DateFormat('HH:mm:ss a').format(DateTime.now());


       on<HomeEvent>((event, emit) async {
          if(event is HomeLoadedEvent){
                    print("hhh");
        emit (LoadingHomeState());
        
      //    ServiceNotificationEvent(
      //   title: event.notificationListt[1].title,
      //   content: event.notificationListt[1].content,
      // );
         
          //  emit(LoadedIntroState());

  print("LoadedHomeState");
  emit(LoadedHomeState(formattedDateTime));
  // NotificationListenerService.requestPermission().then((isPermissionGranted) {
  //   // emit(LoadedIntroState(isPermissionGranted));
  //    emit(LoadedIntroState());
  // });
  return;
              
          }
          else if(event is GetPermisionEvent){
          List notificationListt = <ServiceNotificationEvent>[];
             print("GetPermisionEvent");
               NotificationListenerService.notificationsStream.listen((event) {
      print("Curent notification: $event");
      notificationListt.add(event);
    });
          }
          
    });
}

  // void sendNotificationsToScreen(List<RecoveryModel> notifications) {
  //   notifications.forEach((notification) {
  //     ServiceNotificationEvent();
  //       ServiceNotificationEvent(
  //         title: notification.title,
  //         content: notification.content,
  //         // Here you can add other properties if needed
        
  //     );
  //   });
  // }
//   void sendNotificationsToScreen(List<RecoveryModel> notifications) {
//   for (var notification in notifications) {
//     ServiceNotificationEvent(
//       title: notification.title,
//       content: notification.content,
//       // Here you can add other properties if needed
//     );
//   }
// }

}