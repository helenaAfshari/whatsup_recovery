
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:WhatsUp/pressentation/blocs/intro/intro_event.dart';
import 'package:WhatsUp/pressentation/blocs/intro/intro_state.dart';
import 'package:notification_listener_service/notification_event.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
    bool permissionRequested = false;
    List notificationListt = <ServiceNotificationEvent>[];

  IntroBloc() : super(InisializeIntroState()) {
    on<IntroEvent>((event, emit) async {
      if(event is IntroLoadedEvent){
        print("hhh");
        emit (LoadingIntroState());
         

  print("No Permission");
  emit(LoadedIntroState());

  return;

  
    }
    else if(event is AddPermisionEvent){
      print("object");
     emit (LoadingIntroState());


  }

    });
    
  
  }}

