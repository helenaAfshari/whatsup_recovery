import 'package:hive_flutter/hive_flutter.dart';
import 'package:WhatsUp/domain/model/notif_event_hive/notif_event_hive.dart';
part 'service_whatsup_model.g.dart';



//شرید رو تبدیل به دیتابیس کردم
@HiveType(typeId: 0)
class NotifWithTimeModel extends HiveObject {
  @HiveField(0)
  DateTime date;
  @HiveField(1)
  NotificationEventHive servicenotif;
  NotifWithTimeModel(this.date, this.servicenotif);

  factory NotifWithTimeModel.fromJson(Map<String, dynamic> data) {
    return NotifWithTimeModel(DateTime.parse(data['date']),
        NotificationEventHive.fromMap(data['servicenotif']));
  }

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'servicenotif': servicenotif.toMap(),
      };

  static List<NotifWithTimeModel> toList(List list) {
    return list.map((e) => NotifWithTimeModel.fromJson(e)).toList();
  }
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

  factory RoomModel.fromJson(Map<String, dynamic> data) {
    return RoomModel(
        name: data['name'],
        date: DateTime.parse(data['date']),
        lastMsg: NotifWithTimeModel.fromJson(data['lastMsg']),
        messages: NotifWithTimeModel.toList(data['messages']));
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'date': date.toIso8601String(),
        'lastMsg': lastMsg.toJson(),
        'messages': messages.map((e) => e.toJson()).toList(),
      };

}
