// import 'package:notification_listener_service/notification_event.dart';

// class RecoveryModel{
//   String? title;
//   String? content;
//   int? id;
// RecoveryModel({ this.title, this.content,this.id});
// // factory RecoveryModel.fromJason(Map<String,dynamic>json)=>
// // RecoveryModel(text: json['text'],poemId: json['poem_id']);
// }


// import 'package:notification_listener_service/notification_event.dart';

// class RecoveryModel extends ServiceNotificationEvent {
//   String? title;
//   String? content;
//   int? id;

//   RecoveryModel({this.title, this.content, this.id}) : super(id: id, content: content);

//   factory RecoveryModel.fromJson(Map<String, dynamic> json) {
//     return RecoveryModel(
//       title: json['title'],
//       content: json['content'],
//       id: json['id'],
//     );
//   }
// }

import 'package:notification_listener_service/notification_event.dart';

class RecoveryModel extends ServiceNotificationEvent {
  String? title;
  String? content;
  int? id;

  RecoveryModel({this.title, this.content, this.id}) : super(id: id, content: content);

  factory RecoveryModel.fromJson(Map<String, dynamic> json) {
    return RecoveryModel(
      title: json['title'],
      content: json['content'],
      id: json['id'],
    );
  }

  static  sendNotificationsToScreen(List<RecoveryModel> notifications) {
    notifications.forEach((notification) {
      ServiceNotificationEvent(
        title: notification.title,
        content: notification.content,
      );
    });
  }
}
// import 'package:notification_listener_service/notification_event.dart';

// class RecoveryModel extends ServiceNotificationEvent {
//   String? title;
//   String? content;
//   int? id;

//   RecoveryModel({this.title, this.content, this.id}) : super(id: id, content: content);

//   factory RecoveryModel.fromJson(Map<String, dynamic> json) {
//     return RecoveryModel(
//       title: json['title'],
//       content: json['content'],
//       id: json['id'],
//     );
//   }

//   static void sendNotificationsToScreen(List<RecoveryModel> notifications) {
//     notifications.forEach((notification) {
//       print("Title: ${notification.title}, Content: ${notification.content}");
//       // اینجا می‌توانید هر عملیات دلخواهی که نیاز دارید را انجام دهید
//       // مثلاً می‌توانید اطلاعات را به رابط کاربری ارسال کنید
//     });
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:notification_listener_service/notification_event.dart';

// // تعریف مدل
// class RecoveryModel extends ServiceNotificationEvent {
//   String? title;
//   String? content;
//   int? id;

//   RecoveryModel({this.title, this.content, this.id})
//       : super(id: id, content: content);

//   factory RecoveryModel.fromJson(Map<String, dynamic> json) {
//     return RecoveryModel(
//       title: json['title'],
//       content: json['content'],
//       id: json['id'],
//     );
//   }

//   // تابع برای نمایش اطلاعات در اسکرین
//   static void showNotificationsOnScreen(BuildContext context, List<RecoveryModel> notifications) {
//     // نمایش هر اطلاعات با یک دیالوگ ساده
//     notifications.forEach((notification) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(notification.title ?? ""),
//             content: Text(notification.content ?? ""),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     });
//   }
// }

// // یک ویجت فرضی که از مدل استفاده می‌کند
// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // در اینجا یک لیست از اطلاعات مدل تعریف می‌کنیم
//     List<RecoveryModel> notifications = [
//       RecoveryModel(title: "Notification 1", content: "Content 1"),
//       RecoveryModel(title: "Notification 2", content: "Content 2"),
//     ];

//     // نمایش اطلاعات بر روی اسکرین
//     RecoveryModel.showNotificationsOnScreen(context, notifications);

//     // در اینجا می‌توانید ویجت خود را بسازید
//     return Container();
//   }
// }

// // اجرای برنامه
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Notification Screen'),
//       ),
//       body: MyWidget(),
//     ),
//   ));
// }
