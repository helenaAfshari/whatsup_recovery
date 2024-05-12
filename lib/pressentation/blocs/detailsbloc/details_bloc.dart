
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:WhatsUp/pressentation/blocs/detailsbloc/details_event.dart';
import 'package:WhatsUp/pressentation/blocs/detailsbloc/details_state.dart';
import 'package:notification_listener_service/notification_event.dart';

class DetailBloc extends Bloc<DetailsEvent, DetailState> {
    DetailBloc():super(InisializeDetailState()){
                  List notificationListt = <ServiceNotificationEvent>[];

       on<DetailsEvent>((event, emit) async {
          if(event is DetailLoadedEvent){
                    print("hhh");
        emit (LoadingDetailState());
         
  print("LoadedHomeState");
  emit(LoadedDetailState());
  return;
              
          }
 
          
    });
}

}