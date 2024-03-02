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

       on<HomeEvent>((event, emit) async {
          if(event is HomeLoadedEvent){
                    print("hhh");
        emit (LoadingHomeState());

  print("LoadedHomeState");
  emit(LoadedHomeState());
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