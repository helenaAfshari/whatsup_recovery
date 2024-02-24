import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notif/pressentation/blocs/homebloc/home_event.dart';
import 'package:notif/pressentation/blocs/homebloc/home_state.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // IntroBloc() : super(InisializeIntroState()) {
    HomeBloc():super(InisializeHomeState()){
       on<HomeEvent>((event, emit) async {
          if(event is HomeLoadedEvent){
                    print("hhh");
        emit (LoadingHomeState());
         
          //  emit(LoadedIntroState());

  print("LoadedHomeState");
  emit(LoadedHomeState());
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

}