import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:notif/pressentation/blocs/intro/intro_state.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';
class IntroCubit extends Cubit<IntroState>{
    IntroCubit() : super(InisializeIntroState());
// RxList notificationListt = RxList<ServiceNotificationEvent>();
  final notificationList = RxList<ServiceNotificationEvent>();

 void requestForPermission() async {
    emit(LoadingIntroState()); // ایجاد و emit state LoadingIntroState

    print("Requesting Permission");
    final bool status = await NotificationListenerService.isPermissionGranted();
    if (status != true) {
      print("No Permission");
      final bool statuss = await NotificationListenerService.requestPermission();
      return;
    }

    listenForNotifications();
  }

  void listenForNotifications() {
    emit(LoadedIntroState()); // ایجاد و emit state LoadedIntroState

    print("Listening Sms");
    NotificationListenerService.notificationsStream.listen((event) {
      print("Current notification: $event");
      notificationList.add(event);
    });
  }
}
