
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

part 'notif_event_hive.g.dart';


/////این اطلاعات خود کلاس نوتیف هست  که در هایو ذخیره کردیم  و در این کلاس گذاشتیم 
@HiveType(typeId: 2)
class NotificationEventHive extends HiveObject{
  /// the notification id
  @HiveField(0)
  int? id;

  /// check if we can reply the Notification
  @HiveField(1)
  bool? canReply;

  /// if the notification has an extras image
  @HiveField(2)
  bool? haveExtraPicture;

  /// if the notification has been removed
  @HiveField(3)
  bool? hasRemoved;

  /// notification extras image
  /// To display an image simply use the [Image.memory] widget.
  /// Example:
  ///
  /// ```
  /// Image.memory(notif.extrasPicture)
  /// ```
  @HiveField(4)
  Uint8List? extrasPicture;

  /// notification package name
 @HiveField(5)
  String? packageName;
@HiveField(6)
  /// notification title
  String? title;

  /// the notification app icon
  /// To display an image simply use the [Image.memory] widget.
  /// Example:
  ///
  /// ```
  /// Image.memory(notif.appIcon)
  /// ```
  @HiveField(7)
  Uint8List? appIcon;

  /// the notification large icon (ex: album covers)
  /// To display an image simply use the [Image.memory] widget.
  /// Example:
  ///
  /// ```
  /// Image.memory(notif.largeIcon)
  /// ```
  @HiveField(8)
  Uint8List? largeIcon;

  /// the content of the notification
  @HiveField(9)
  String? content;

  NotificationEventHive({
    this.id,
    this.canReply,
    this.haveExtraPicture,
    this.hasRemoved,
    this.extrasPicture,
    this.packageName,
    this.title,
    this.appIcon,
    this.largeIcon,
    this.content,
  });

  NotificationEventHive.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    canReply = map['canReply'];
    haveExtraPicture = map['haveExtraPicture'];
    hasRemoved = map['hasRemoved'];
    // extrasPicture = map['notificationExtrasPicture'];
    packageName = map['packageName'];
    title = map['title'];
    // appIcon = map['appIcon'];
    // largeIcon = map['largeIcon'];
    content = map['content'];
  }

  /// send a direct message reply to the incoming notification
  Future<bool> sendReply(String message) async {
    if (!canReply!) throw Exception("The notification is not replyable");
    try {
      return await methodeChannel.invokeMethod<bool>("sendReply", {
            'message': message,
            'notificationId': id,
          }) ??
          false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  String toString() {
    return '''ServiceNotificationEvent(
      id: $id
      can reply: $canReply
      packageName: $packageName
      title: $title
      content: $content
      hasRemoved: $hasRemoved
      haveExtraPicture: $haveExtraPicture
      ''';
  }

  static NotificationEventHive fromEntity(ServiceNotificationEvent eventPure) {
    return NotificationEventHive(
        id: eventPure.id,
        canReply: eventPure.canReply,
        haveExtraPicture: eventPure.haveExtraPicture,
        hasRemoved: eventPure.hasRemoved,
        extrasPicture: eventPure.extrasPicture,
        packageName: eventPure.packageName,
        title: eventPure.title,
        appIcon: eventPure.appIcon,
        largeIcon: eventPure.largeIcon,
        content: eventPure.content,
      );
  }


  // static NotificationEventHive fromMap( Map<String, dynamic> data) {
  //   return NotificationEventHive(
  //       id: data['id'],
  //       canReply: data['canReply'],
  //       haveExtraPicture: data['haveExtraPicture'],
  //       hasRemoved: data['hasRemoved'],
  //       extrasPicture: data['extrasPicture'],
  //       packageName: data['packageName'],
  //       title: data['title'],
  //       appIcon: data['appIcon'],
  //       largeIcon: data['largeIcon'],
  //       content: data['content'],
  //     );
  // }

  Map<String, dynamic> toMap() => {
        'id': id,
        'canReply': canReply,
        'haveExtraPicture': haveExtraPicture,
        'hasRemoved': hasRemoved,
        'extrasPicture': extrasPicture,
        'packageName': packageName,
        'title': title,
        'appIcon': appIcon,
        'largeIcon': largeIcon,
        'content': content,
  };
}
