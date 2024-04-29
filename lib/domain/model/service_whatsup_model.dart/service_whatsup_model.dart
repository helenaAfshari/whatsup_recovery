
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notif/domain/model/notif_event_hive/notif_event_hive.dart';
import 'package:notification_listener_service/notification_event.dart';
part 'service_whatsup_model.g.dart';

@HiveType(typeId: 0)
class NotifWithTimeModel extends  HiveObject{
   @HiveField(0)
  DateTime date;
  @HiveField(1)
  NotificationEventHive servicenotif;
  NotifWithTimeModel(this.date, this.servicenotif);
}

// //این برای  کلاس details برای اسکرین
@HiveType(typeId: 1)
class RoomModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  DateTime date;
  @HiveField(2)
  NotifWithTimeModel lastMsg;
  @HiveField(3)
  List<NotifWithTimeModel> messages;
  // ServiceNotificationEvent servicenotif;
  RoomModel({
    required this.name,
    required this.date,
    required this.lastMsg,
    required this.messages,
  });
}



///ttttrrrrruuuu
// class RoomModel {
//   String name;
//   DateTime date;
//   NotifWithTimeModel lastMsg;
//   List<NotifWithTimeModel> messages;
//   // ServiceNotificationEvent servicenotif;
//   RoomModel({
//     required this.name,
//     required this.date,
//     required this.lastMsg,
//     required this.messages,
//   });
// }
///tttrrrruuuu



// class userModel {
//   String name;
//   // List<messageModel> messages;
//   userModel(this.messages,this.name);
// }


// class MessageWithTimeModel {
//    DateTime date;
//       String message;
  
//    MessageWithTimeModel(this.date, this.message);
//  }


 
