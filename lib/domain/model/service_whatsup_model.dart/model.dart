import 'package:notification_listener_service/notification_event.dart';

class NotifWithTimeModel{
  DateTime date;
  ServiceNotificationEvent servicenotif;
  NotifWithTimeModel(this.date, this.servicenotif);
}


//این برای  کلاس details برای اسکرین 
class messageModel{
   String detailsText;
   DateTime date;
  // ServiceNotificationEvent servicenotif;
  messageModel({required this.detailsText,required this.date});
}


class userModel {
  String name;
  List<messageModel> messages;
  userModel(this.messages,this.name);
}




// import 'package:notification_listener_service/notification_event.dart';

// class NotifWithTimeModel {
//   DateTime date;
//   ServiceNotificationEvent servicenotif;
//   NotifWithTimeModel(this.date, this.servicenotif);
// }

// //این برای  کلاس details برای اسکرین
class RoomModel {
  String name;
  DateTime date;
  NotifWithTimeModel lastMsg;
  List<NotifWithTimeModel> messages;
  // ServiceNotificationEvent servicenotif;
  RoomModel({
    required this.name,
    required this.date,
    required this.lastMsg,
    required this.messages,
  });
}


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


 
