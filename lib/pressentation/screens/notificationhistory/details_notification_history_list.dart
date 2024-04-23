
//قبل
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';
// import 'package:notification_listener_service/notification_event.dart';

// class DetailsNotificationHistoryList extends StatefulWidget {
//        List? notificationListt = <NotifWithTimeModel>[];
       
//   final ServiceNotificationEvent? service;
//   final int? indexx;
//   final RoomModel? room;
//   //final DateTime time; // اضافه کردن پارامتر زمان

//   String? time;
//   final DateTime formattedDatee;
//   DetailsNotificationHistoryList({
//     this.room,
//     this.indexx,this.service,this.notificationListt,required this.formattedDatee});

//   @override
//   State<DetailsNotificationHistoryList> createState() => _DetailsNotificationHistoryListState();
// }

// class _DetailsNotificationHistoryListState extends State<DetailsNotificationHistoryList> {
//        List notificationListt = <NotifWithTimeModel>[];
//       // List<messageModel> notificationListDetails = [];
//   @override
//   void initState() {
//     super.initState();
    
//     // NotificationListenerService.notificationsStream.listen((event) {
//     //   print("Curent notification: $event");
//     //   setState(() {
//     //     notificationListt.add(NotifWithTimeModel(DateTime.now(), event));
//     //       //formattedDate = formatDate(DateTime.now());
//     //   });
      
//     // });
//     //formattedDate = formatDate(DateTime.now());
//   }
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details'),
//       ),
//       body: Column(
//         children: [
//         //   ListView.builder(
//         // itemCount: widget.room!.messages.length,
//         // itemBuilder: (context, index) {
//         // final msg = widget.room!.messages[index];
//         // return ListTile(
//         //   title: Text(msg.servicenotif.content ?? 'Withot content'),
//         // );
//         // }
//         //   )
//           // Expanded(
//           //   child: ListView.builder(
//           //     itemCount:notificationListDetails?.length,
//           //     shrinkWrap: true,
//           //     itemBuilder:(context, index) {
//           //     return Padding(
//           //       padding: const EdgeInsets.all(8.0),
//           //       child: Container(
//           //         height: 50,
//           //        width: 20,
//           //         color: const Color.fromARGB(255, 181, 174, 155),
//           //          child: Text(notificationListDetails[index].detailsText),
//           //         //child: Text(notification.textUser),
                  
//           //       ),
//           //     );
//           //   },
//           //    ),
//           // ),
//           Padding(
//             padding: const EdgeInsets.only(left:160,top: 20),
//             child: Container(
//               decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 176, 227, 215),
//                 borderRadius: BorderRadius.circular(10)),
//               // width: 230,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child:
//                   Text('${widget.service?.content ?? ""}'),
                  
//                     ),
                   
//                     // Padding(
//                     //   padding: const EdgeInsets.only(top: 40),
//                     //   child: Text("55"),
//                     // ),
//                   ],
//                 ),
//      Padding(
//        padding: const EdgeInsets.only(left: 90),
//        child: Text('${DateFormat('HH:mm:ss a').format(widget.formattedDatee)}'),
//      ),

//               ],
//             ),
//           ),
//           ),

//           Container(
//             height: 70,
//             width: 200,
//             color: Colors.amber,
//            child: Row(
//             children: [
//             Expanded(
//   child: Text(
//     "datahhhhhhhهههههههههههغغغغغغغغiiiiii5555uuuuuuuhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
//     overflow: TextOverflow.visible,
//     maxLines: 10,
//   ),
// ),

//               SizedBox(width: 10,),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Text("55"),
//               ),
//             ],
//            ),
//           ),
//  Text('Content: ${widget.service?.content ?? ""}'),
//            // Text('Index: ${widget.indexx ?? "No index available"}'),
//             Text("hhh"),
//            // Text('Formatted Date on Another Pagehhhhh: ${widget.formattedDatee}'),
// //             // Text('Formatted Date on Another Pagehhhhh: ${widget.formattedDatee}'),
// //        Text('Formatted Date on Another Pagehhhhh: ${DateFormat('HH:mm:ss a').format(widget.formattedDatee)}'),
        
//         ],
//       ),

//     );
//   }
// }

//////////قبل




// class DetailsNotificationHistoryList extends StatefulWidget {
//   final List<NotifWithTimeModel>? notificationListt;
//   final ServiceNotificationEvent? service;
//   final DateTime formattedDatee;

//   DetailsNotificationHistoryList({
//     required this.notificationListt,
//     required this.service,
//     required this.formattedDatee,
//   });

//   @override
//   State<DetailsNotificationHistoryList> createState() =>
//       _DetailsNotificationHistoryListState();
// }

// class _DetailsNotificationHistoryListState
//     extends State<DetailsNotificationHistoryList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: widget.notificationListt!.length,
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 final message = widget.notificationListt![index];
//                 // Assuming content is the user message
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 50,
//                     width: 20,
//                     color: const Color.fromARGB(255, 181, 174, 155),
//                     child: Text('${message.servicenotif.content ?? ""}'),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



   ///////////////////////درست
      // body: room == null ? Text('room required') :  ListView.builder(
      //   itemCount: room!.messages.length,
      //   itemBuilder: (context, index) {
      //   final msg = room!.messages[index];
      //   return ListTile(
      //     title: Text(msg.servicenotif.content ?? 'Withot content'),
      //   );
      // },),
///////////////////////////////درست
///
///بعد
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';

class DetailsNotificationHistoryList extends StatelessWidget {

  final RoomModel? room;
  const DetailsNotificationHistoryList({super.key,required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      //    body: room == null ? Text('room required') :  ListView.builder(
      //   itemCount: room!.messages.length,
      //   itemBuilder: (context, index) {
      //   final msg = room!.messages[index];
      //   return ListTile(
      //     title: Text(msg.servicenotif.content ?? 'Withot content'),
      //   );
      // },)
//       body: ListView(
//   reverse: false,
//   children: List.generate(
//     room?.messages.length ?? 0,
//     (index) {
//       final reversedIndex = room!.messages.length - 1 - index;
//       final notification = room!.messages[reversedIndex];
//       if (notification.servicenotif.packageName == "com.whatsapp" &&
//           !notification.servicenotif.content.toString().contains(RegExp(r'\d+ new message'))) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4.0),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 100, right: 10),
//               child: Card(
//                 color: Color.fromARGB(255, 209, 243, 226),
//                 elevation: 8,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(notification.servicenotif.content.toString()),
//                 ),
//               ),
//             ),
//           ),
//         );
//       } else {
//         return Container();
//       }
//     },
//   ),
// ));
   body: ListView.builder(
   reverse: true, // اینجا برای معکوس کردن لیست استفاده می‌شود
   itemCount:room?.messages.length ?? 0,
   itemBuilder: (context, index) {
    final reversedIndex = room!.messages.length - 1 - index; // معکوس کردن ایندکس
     final notification = room!.messages[reversedIndex];
     if (notification.servicenotif.packageName == "com.whatsapp" &&
     !notification.servicenotif.content.toString().contains(RegExp(r'\d+ new message'))) {
      return 
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Card(
      //       color: Colors.amber,
      //       child: Stack(
      //         children: [
      //         Column(
      //           children: [
      //            Align(
      //     alignment: Alignment.bottomRight,
      //     child: Text(
      //       notification.servicenotif.content.toString(),
      //       overflow: TextOverflow.ellipsis,
      //     ),
      //     ),
      //             Align(
      //               alignment: Alignment.centerLeft,
      //               child: Text(DateFormat('HH:mm:ss a').format(notification.date)))
      //           ],
      //         ),
      //         ],
      //       ),
      //     ),
      //   ],
      // );

    // Align(
    //     alignment: Alignment.centerRight,
    //     child: Padding(
    //       padding: const EdgeInsets.only(left: 100,right: 10),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           Card(
    //             color: Color.fromARGB(255, 209, 243, 226),
    //             elevation: 8,
    //           child: Column(
    //             children: [
    // Text(
    // notification.servicenotif.content.toString(),
    // style: TextStyle(
    // fontSize: 16,
    // fontWeight: FontWeight.bold,
    // ),
    // textAlign: TextAlign.center, // تنظیم متن در وسط
    // ),
    //                 // Text(DateFormat('HH:mm:ss a').format(notification.date)),
    //             ],
    //           ),
    //           ),


    //         ],
    //       ),
    //     ),
    //   );

    Align(
  alignment: Alignment.centerRight,
  child: Padding(
    padding: const EdgeInsets.only(left: 100, right: 10),
    child: Card(
      color: Color.fromARGB(255, 209, 243, 226),
      elevation: 8,
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.servicenotif.content.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                DateFormat('HH:mm:ss a').format(notification.date),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);
    ////////////////درستتت
      // Align(
      //   alignment: Alignment.centerRight,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 100,right: 10),
      //     child: Card(
      //       color: Color.fromARGB(255, 209, 243, 226),
      //       elevation: 8,
      //     child: Text(notification.servicenotif.content.toString()),
      //     ),
      //   ),
      // );
      }}
      ),
      );
  }}
  ///درستتتتت
  ///
  ///
  ///



//       // return Padding(
//       //   padding: const EdgeInsets.all(8.0),
//       //   child: Container(
//       //     height: 70,
//       //     width: 200,
//       //     color: Colors.amber,
//       //     child: ListTile(
//       //       title: Text(notification.servicenotif.content.toString()),
//       //       subtitle: Text(DateFormat('HH:mm:ss a').format(notification.date)),
//       //       leading:  Text(notification.servicenotif.title.toString()),
//       //     ),
//       //   ),
//       // );
//     } else {
//       return Container(); // اگر نوع سرویس پیام واتس‌اپ نبود یا پیام حاوی "X new message" بود، لیست‌تایل خالی برگردانید
//     }
   
//    },
//  ));
      
//     //   body: room == null ? Text('room required') :  ListView.builder(
//     //     itemCount: room!.messages.length,
//     //     itemBuilder: (context, index) {
//     //     final msg = room!.messages[index];
//     //     return ListTile(
//     //     // title: Text("hhhhh${msg.servicenotif.content}"),
//     //        title: Text(msg.servicenotif.content ?? 'Withot content'),
//     //     );
//     //     }
//     // ));
  //  }
  //    }));





// import 'package:flutter/material.dart';
// import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';
// class DetailsNotificationHistoryList extends StatefulWidget {
//   final RoomModel? room;

//   const DetailsNotificationHistoryList({Key? key, required this.room})
//       : super(key: key);

//   @override
//   _DetailsNotificationHistoryListState createState() =>
//       _DetailsNotificationHistoryListState();
// }

// class _DetailsNotificationHistoryListState
//     extends State<DetailsNotificationHistoryList> {
//   RoomModel? selectedMessage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details'),
//       ),
//       body: widget.room == null
//           ? Text('room required')
//           : ListView.builder(
//               itemCount: widget.room!.messages.length,
//               itemBuilder: (context, index) {
//                 final msg = widget.room!.messages[index];
//                 return
//                 Text(msg.servicenotif.content ?? 'Without content');
//               }),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';
// import 'package:notification_listener_service/notification_event.dart';

// class DetailsNotificationHistoryList extends StatefulWidget {
//        List? notificationListt = <NotifWithTimeModel>[];
       
//   final ServiceNotificationEvent? service;
//   final int? indexx;
//   //final DateTime time; // اضافه کردن پارامتر زمان

//   String? time;
//   final DateTime formattedDatee;
//    NotifWithTimeModel? selectedMessage;
//   DetailsNotificationHistoryList({this.indexx,this.service,this.notificationListt,required this.formattedDatee});

//   @override
//   State<DetailsNotificationHistoryList> createState() => _DetailsNotificationHistoryListState();
// }

// class _DetailsNotificationHistoryListState extends State<DetailsNotificationHistoryList> {
//        List notificationListt = <NotifWithTimeModel>[];
       
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details::::::${widget.service!.id}'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left:160,top: 20),
//             child: Container(
//               decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 176, 227, 215),
//                 borderRadius: BorderRadius.circular(10)),
//               width: 230,
        
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child:
//                   Text(' ${widget.service?.content ?? ""}'),
                  
//                     ),
                   
//                   ],
//                 ),
//      Padding(
//        padding: const EdgeInsets.only(left: 90),
//        child: Text('${DateFormat('HH:mm:ss a').format(widget.formattedDatee)}'),
//      ),

//               ],
//             ),
//           ),
//           ),


//  Text('Content: ${widget.service?.content ?? ""}'),
//             Text("hhh"),
//        Text('Formatted Date on Another Pagehhhhh: ${DateFormat('HH:mm:ss a').format(widget.formattedDatee)}'),

//         ],
//       ),

//     );
//   }
// }










////////////////////اخر درسته
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';
// import 'package:notification_listener_service/notification_event.dart';
// class DetailsNotificationHistoryList extends StatefulWidget {
//   final List<NotifWithTimeModel>? notificationListt; // Pass the list of notifications
//   final ServiceNotificationEvent? service;
//   final int? indexx;
//   final DateTime formattedDatee;

//   DetailsNotificationHistoryList({
//     this.indexx,
//     this.service,
//     required this.notificationListt,
//     required this.formattedDatee,
//   });

//   @override
//   State<DetailsNotificationHistoryList> createState() => _DetailsNotificationHistoryListState();
// }

// class _DetailsNotificationHistoryListState extends State<DetailsNotificationHistoryList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details::::::${widget.service!.id}'),
//       ),
//     body: ListView.builder(
//   reverse: false, // اینجا برای معکوس کردن لیست استفاده می‌شود
//   itemCount: widget.notificationListt!.length,
//   itemBuilder: (context, index) {
//     final reversedIndex = widget.notificationListt!.length - 1 - index; // معکوس کردن ایندکس
//     final notification = widget.notificationListt![reversedIndex];
    
//     // افزودن شرط برای نمایش تنها پیام‌های واتس‌اپ و نادیده گرفتن پیام‌های حاوی "X new message"
//     if (notification.servicenotif.packageName == "com.whatsapp" &&
//      !notification.servicenotif.content.toString().contains(RegExp(r'\d+ new message'))) {
//       return ListTile(
//         title: Text(notification.servicenotif.content.toString()),
//         subtitle: Text(DateFormat('HH:mm:ss a').format(notification.date)),
//         leading:  Text(notification.servicenotif.title.toString()),
//       );
//     } else {
//       return Container(); // اگر نوع سرویس پیام واتس‌اپ نبود یا پیام حاوی "X new message" بود، لیست‌تایل خالی برگردانید
//     }
//   },
// ),



// //   body: ListView.builder(
// //   reverse: false, // اینجا برای معکوس کردن لیست استفاده می‌شود
// //   itemCount: widget.notificationListt!.length,
// //   itemBuilder: (context, index) {
// //     final reversedIndex = widget.notificationListt!.length - 1 - index; // معکوس کردن ایندکس
// //     final notification = widget.notificationListt![reversedIndex];
    
// //     // افزودن شرط برای نمایش تنها پیام‌های واتس‌اپ
// //     if (notification.servicenotif.packageName == "com.whatsapp") {
// //       return ListTile(
// //         title: Text(notification.servicenotif.content.toString()),
// //         subtitle: Text(DateFormat('HH:mm:ss a').format(notification.date)),
// //       );
// //     } else {
// //       return Container(); // اگر نوع سرویس پیام واتس‌اپ نبود، لیست‌تایل خالی برگردانید
// //     }
// //   },
// // )
// );
// //       body: ListView.builder(
// //   reverse: false, // اینجا برای معکوس کردن لیست استفاده می‌شود
// //   itemCount: widget.notificationListt!.length,
// //   itemBuilder: (context, index) {
// //     final reversedIndex = widget.notificationListt!.length - 1 - index; // معکوس کردن ایندکس
// //     final notification = widget.notificationListt![reversedIndex];
// //     return ListTile(
// //       title: Text(notification.servicenotif.content.toString()),
// //       subtitle: Text(DateFormat('HH:mm:ss a').format(notification.date)),
// //     );
// //   },
// // ));
//   }}
/////////////اخر درسته