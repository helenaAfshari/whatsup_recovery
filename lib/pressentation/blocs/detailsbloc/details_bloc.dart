
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notif/pressentation/blocs/detailsbloc/details_event.dart';
import 'package:notif/pressentation/blocs/detailsbloc/details_state.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_event.dart';
import 'package:notification_listener_service/notification_event.dart';

class DetailBloc extends Bloc<DetailsEvent, DetailState> {
  // IntroBloc() : super(InisializeIntroState()) {
    DetailBloc():super(InisializeDetailState()){
                  List notificationListt = <ServiceNotificationEvent>[];

       on<DetailsEvent>((event, emit) async {
          if(event is DetailLoadedEvent){
                    print("hhh");
        emit (LoadingDetailState());
         
          //  emit(LoadedIntroState());

  print("LoadedHomeState");
  emit(LoadedDetailState());
  // NotificationListenerService.requestPermission().then((isPermissionGranted) {
  //   // emit(LoadedIntroState(isPermissionGranted));
  //    emit(LoadedIntroState());
  // });
  return;
              
          }
    //       else if(event is GetPermisionEvent){
    //       List notificationListt = <ServiceNotificationEvent>[];
    //          print("GetPermisionEvent");
    //            NotificationListenerService.notificationsStream.listen((event) {
    //   print("Curent notification: $event");
    //   notificationListt.add(event);
    // });
    //       }
          
    });
}

}