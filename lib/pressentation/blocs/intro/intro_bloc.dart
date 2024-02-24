
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notif/pressentation/blocs/intro/intro_event.dart';
import 'package:notif/pressentation/blocs/intro/intro_state.dart';
import 'package:notif/pressentation/screens/home_page_screen.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';
// class IntroCubit extends Cubit<IntroState>{
//     IntroCubit() : super(InisializeIntroState());
// // RxList notificationListt = RxList<ServiceNotificationEvent>();
//  //final notificationList = RxList<ServiceNotificationEvent>();
// final h = <ServiceNotificationEvent>[];

//  void requestForPermission() async {
//    // emit(LoadingIntroState()); // ایجاد و emit state LoadingIntroState
//     try{
//     print("Requesting Permission");
//     final bool status = await NotificationListenerService.isPermissionGranted();
//     if (status != true) {
//       print("No Permission");
//       final bool statuss = await NotificationListenerService.requestPermission();
//       return;
      
//     }
//     }catch(e){
//       print("CatchError");
//       emit(ErrorIntroState());
//     }
// listenForNotifications();
//   }

//   void listenForNotifications() {
//     emit(LoadedIntroState()); // ایجاد و emit state LoadedIntroState
//      try{
//     print("Listening Sms");
//     NotificationListenerService.notificationsStream.listen((event) {
//       print("Current notification: $event");
//       h.add(event);
//     });
//      }catch(e){
//        print("CatchError");
//        emit(ErrorIntroState());
//      }
//   }
// }

class IntroBloc extends Bloc<IntroEvent, IntroState> {
    bool permissionRequested = false;
    List notificationListt = <ServiceNotificationEvent>[];


 // List<GhazalItemModelEntity> ghazaliatHafez = [];
  IntroBloc() : super(InisializeIntroState()) {
    on<IntroEvent>((event, emit) async {
      if(event is IntroLoadedEvent){
        print("hhh");
        emit (LoadingIntroState());
         
          //  emit(LoadedIntroState());

  print("No Permission");
  emit(LoadedIntroState());
  // NotificationListenerService.requestPermission().then((isPermissionGranted) {
  //   // emit(LoadedIntroState(isPermissionGranted));
  //    emit(LoadedIntroState());
  // });
  return;

  

      // }
// void requestForPermisionnnn()async{
//   print("Requesting Permision");
//   final bool status = await NotificationListenerService.isPermissionGranted();
//   if(status != true){
//     print("No Permision");
//     final bool statuss = 
//     await  NotificationListenerService.requestPermission();
//     return;
//   }
//   listenerNotificationn();
// }



      //  if (!permissionRequested) {
      //   final bool status = await NotificationListenerService.isPermissionGranted();
      //   if (!status) {
      //     print("No Permission");
      //     permissionRequested = true;
      //     emit(LoadedIntroState());
      //     final bool statuss = await NotificationListenerService.requestPermission();
      //     return;
      //   }
      // }
    }
    ///1111111111111111111111111111111111111111111111111111
    else if(event is AddPermisionEvent){
      print("object");
     emit (LoadingIntroState());
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));

//     NotificationListenerService.requestPermission().then((isPermissionGranted) {
//     if (isPermissionGranted) {
//   Navigator.pushReplacement(event.context, MaterialPageRoute(builder: (context) => HomePageScreen()));

// }

//     });
  
// //   //      NotificationListenerService.requestPermission().then((isPermissionGranted) {
// //   //   // emit(LoadedIntroState(isPermissionGranted));
// //   //    emit(LoadedIntroState());
  
// //   // });
  
// //     }
// //     else if(event is AddPermisionEvent){
// //   print("object");
// //   NotificationListenerService.requestPermission().then((isPermissionGranted) {
// //     if (isPermissionGranted) {
// //       Navigator.pushReplacement(event.context, MaterialPageRoute(builder: (context) => HomePageScreen()));
// //     }
// //   });
  }

    ///111111111111111111111111111111111111111111111111111111111111
    });
    
  // void listenerNotificationn(){
  //     List notificationListt = <ServiceNotificationEvent>[];

  //   print("Listening Sms");
  //   NotificationListenerService.notificationsStream.listen((event) {
  //     print("Curent notification: $event");
  //     notificationListt.add(event);
  //   });
  // }
  
    // on<EstekhareEvent>((event, emit) async {
    //   print(event);
    //   if (event is EstekhareLoadedEvent) {
    //     print("kkkkkk");
    //     try {
    //       print("llllll");
    //       emit(LoadingEstekhareState());
    //       final detailsGhazaliatResponse =
    //           await serviceLocator<EstekhareRepository>().estekhareRepository(
    //               nextNumber(index: event.selectEstekhareId));
    //       print("EEEEEEEEEEETTTTTTTT${detailsGhazaliatResponse}");

    //       ghazaliatHafez = (detailsGhazaliatResponse.data['data'] as List)
    //           .map((e) => GhazalItemModelEntity.fromJson(e))
    //           .toList();
    //       if (detailsGhazaliatResponse.statusCode == 200) {
    //         print("llllllHHHHHTTTYYYYYYY$ghazaliatHafez");
    //         emit(SuccesEstekhareState(
    //           ghazaliatHafez,
    //         ));
    //         print("Estekhareh${ghazaliatHafez}");
    //       } else {
    //         emit(ErrorEstekhareState("not Valid"));
    //       }
    //     } catch (e) {
    //       print("have not interner");
    //     }
    //   }
    // });
  }}

