///قبل

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:notif/core/appbar/drawer_menu.dart';
// import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';
// import 'package:notif/pressentation/blocs/notificationbloc/home_bloc.dart';
// import 'package:notif/pressentation/blocs/notificationbloc/home_event.dart';
// import 'package:notif/pressentation/blocs/notificationbloc/home_state.dart';
// import 'package:notif/pressentation/screens/notificationhistory/details_notification_history_list.dart';
// import 'package:notification_listener_service/notification_listener_service.dart';
// class NotificationHistory extends StatefulWidget {
//   const NotificationHistory({super.key});

//   @override
//   State<NotificationHistory> createState() => _NotificationHistoryState();
// }

// class _NotificationHistoryState extends State<NotificationHistory> {
//      List<NotifWithTimeModel> notificationListt =[];
//      List<userModel> Userlist =[];
// List<messageModel> messageList = [];
//      List notificationListtrrrr = <messageModel>[];
// String formattedDate = '';

//   @override
//   void initState() {
//     super.initState();
//     NotificationListenerService.notificationsStream.listen((event) {
//       print("Curent notification: $event");
//       setState(() {
//         notificationListt.add(NotifWithTimeModel(DateTime.now(), event));
//         notificationListt.forEach((element) {if(Userlist.length < notificationListt.length){
//         messageList.add(messageModel(detailsText: element.servicenotif.content!, date: element.date));

//         Userlist.add(new userModel(messageList, element.servicenotif.title!));
//       } });
//           //formattedDate = formatDate(DateTime.now());
//       });
      
//     });
//     //formattedDate = formatDate(DateTime.now());
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeBloc()..add(HomeLoadedEvent()),
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text("Notification history"),
//             backgroundColor: Colors.amber, 
//       ),
//       drawer: DrawerWidget(),
//         body:
//            BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
//             if(state is LoadedHomeState){
//                   return 
//               Column(
//   children: [
//     Expanded(
//       child: ListView.builder(
//         itemCount:notificationListt.length,
//         itemBuilder: (BuildContext context, int index) {
//          final notification = notificationListt[index];
//          //
//           if (notification.servicenotif.packageName!.startsWith("com.whatsapp")) {
//             if(notification.servicenotif.content.toString().contains("new messages")==true){
//     return Container();
//             }else{
//   return 
//   GestureDetector(
//     onTap: () {
//       print("gggggkkkllll");
//       Navigator.of(context).push(MaterialPageRoute(
//   builder: (context) => BlocProvider(
//     create: (context) => HomeBloc(),
//     child: DetailsNotificationHistoryList(
//       service: notification.servicenotif,
//       // indexx: index,
//       // formattedDatee: formattedDate,
//        formattedDatee: notification.date,
       
//       //notificationListt:notification.date,
      
//      // time: DateFormat('HH:mm:ss a').format(notification.date),
// // اضافه کردن زمان
//     ),
//   ),
// ));


//    },
//     child: Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.all(10),
//                 color: Colors.deepPurple,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           decoration: const BoxDecoration(
//                                       image: DecorationImage(
//                               image: AssetImage('assets/images/user_profile.png'), // نمایش تصویر
//                               fit: BoxFit.cover, // تنظیم حالت نمایش تصویر
//                             ),
//                             borderRadius: BorderRadius.all(Radius.circular(50))
//                           ),
//                           height: 50,
//                           width: 50,
//                          ),
                     
//                     Expanded(
//                         child: Text(notification.servicenotif.content!,
//                         maxLines: 1, // تعداد خطوط مورد نظر (در اینجا یک خط)
//                         overflow: TextOverflow.ellipsis, // نمایش سه نقطه در صورت اتمام متن
//                       ),
//                       ),
//                        // Gap(200),
                       
//                        Row(
//                         children: [
//                   Text(notification.servicenotif.title!),
//       //              Center(
//       //   child: Text('Formatted Date: $formattedDate'),
//       //  ),
//                   Text(DateFormat('HH:mm:ss a').format(notification.date)),
//                         ],
//                        ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//   );
//             }
            
//           } else {
//             return SizedBox(); // نوتیفیکیشن هایی که شروع به com.whatsapp نمی‌کنند، اینجا حذف می‌شوند
//           }
//         },
//       ),
//     ),
//   ],
// );
            
//             }
//             return Container(height:  50,width: 50,color: Colors.amber,);
//            },)
//       ),
//     );
//   }

//     String formatDate(DateTime date) {
//     return DateFormat('HH:mm:ss a').format(date);
//   }
// }






// //////بعدش 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notif/core/appbar/drawer_menu.dart';
import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_bloc.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_event.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_state.dart';
import 'package:notif/pressentation/screens/notificationhistory/details_notification_history_list.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class NotificationHistory extends StatefulWidget {
  const NotificationHistory({super.key});

  @override
  State<NotificationHistory> createState() => _NotificationHistoryState();
}

class _NotificationHistoryState extends State<NotificationHistory> {
  // List<NotifWithTimeModel> notificationListt = [];
  // List<userModel> userlist = [];
  // List<messageModel> messageList = [];
  // List notificationListtrrrr = <messageModel>[];
  final  rooms = <RoomModel>[];
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    NotificationListenerService.notificationsStream.listen((event) {
      print("Curent notification: $event");
      if(event.hasRemoved ?? false || !(event.canReply ?? false)){
        return;
      }

        final msg = NotifWithTimeModel(DateTime.now(), event);

        if(msg.servicenotif.title == 'WhatsApp'){
          return; 
        }

        int rIndex = rooms.indexWhere((room) => room.name == event.title);

      setState(() {
        if(rIndex == -1){
          // new message from a new user
           rooms.add(RoomModel(
           name: event.title ?? 'Unknown', 
           date: DateTime.now(), 
           lastMsg: msg,
           messages: [msg])
           );
        } else {

          if(rooms[rIndex].messages.isNotEmpty && rooms[rIndex].messages.last.servicenotif.content == msg.servicenotif.content){
            return;
          }
          //  new nessage from exist user
          rooms[rIndex]..messages.add(msg)..lastMsg = msg..date = DateTime.now();
        }
        //  rooms.sort((a, b) => b.date.compareTo(a.date));
       /*  notificationListt.add(NotifWithTimeModel(DateTime.now(), event));
        notificationListt.forEach((element) {
          if (userlist.length < notificationListt.length) {
            messageList.add(messageModel(
                detailsText: element.servicenotif.content!,
                date: element.date));

            userlist.add(
                new userModel(messageList, element.servicenotif.title!));
          }
        }); */
        //formattedDate = formatDate(DateTime.now());
      });
       rooms.sort((a, b) => b.date.compareTo(a.date));
    });
     
    //formattedDate = formatDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadedEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Notification history"),
            backgroundColor: Colors.amber,
          ),
          drawer: DrawerWidget(),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is LoadedHomeState) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: rooms.length,
                        itemBuilder: (BuildContext context, int index) {
                          final room = rooms[index];
                          if (room.lastMsg.servicenotif.packageName?.startsWith("com.whatsapp") ?? false) {
                            if (room.lastMsg.servicenotif.content
                                    .toString()
                                    .contains("new messages") ==
                                true) {
                              return Container();
                            } else { 
                              return GestureDetector(
                                onTap: () {
                                  print("gggggkkkllll");
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => HomeBloc(),
                                      child: DetailsNotificationHistoryList(
                                        room: room,
// // اضافه کردن زمان
//                                       ),
                                    ),
                                  )));
                                },
                                child: Container(
                                  height: 75,
                                  width: 200,
  padding: EdgeInsets.all(10),
  margin: EdgeInsets.all(10),
  color: Colors.white,
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/user_profile.png'), // نمایش تصویر
            fit: BoxFit.cover, // تنظیم حالت نمایش تصویر
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        height: 50,
        width: 50,
      ),
      SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              room.lastMsg.servicenotif.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              room.lastMsg.servicenotif.content!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
         Text(DateFormat('HH:mm:ss a')
        .format(room.lastMsg.date)),
    ],
  ),
),

//                                 child: Container(
//                                   padding: EdgeInsets.all(10),
//                                   margin: EdgeInsets.all(10),
//                                   color: Colors.deepPurple,
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Container(
//                                             decoration: const BoxDecoration(
//                                                 image: DecorationImage(
//                                                   image: AssetImage(
//                                                       'assets/images/user_profile.png'), // نمایش تصویر
//                                                   fit: BoxFit
//                                                       .cover, // تنظیم حالت نمایش تصویر
//                                                 ),
//                                                 borderRadius: BorderRadius.all(
//                                                     Radius.circular(50))),
//                                             height: 50,
//                                             width: 50,
//                                           ),
                                    
//    Column(
//   children: [
//  Row(
//   children: [
//     Padding(
//       padding: const EdgeInsets.only(right: 62),
//       child: Text(
//         "5555555555555555555555lllllllllllllllllllllhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
//         // room.lastMsg.servicenotif.content!,
//         maxLines: 1,
        
//         overflow: TextOverflow.fade,
      
//       ),
//     ),
//   ],
// ),

//     // SizedBox(height: 10), // یک فاصله‌ی عمودی بین متن و زمان
//     Row(
//       children: [
//         Text(
//           DateFormat('HH:mm:ss a').format(room.lastMsg.date),
//         ),
//       ],
//     ),
//   ],
// )

//                                         //  Text(room.lastMsg.servicenotif.title!),

//                                         //   // Expanded(
//                                         //   //   child: Text(
//                                         //   //     room.lastMsg.servicenotif.content!,
//                                         //   //     maxLines:
//                                         //   //         1, // تعداد خطوط مورد نظر (در اینجا یک خط)
//                                         //   //     overflow: TextOverflow
//                                         //   //         .ellipsis, // نمایش سه نقطه در صورت اتمام متن
//                                         //   //   ),
//                                         //   // ),

//                                         //   // Gap(200),
//                                         //     SizedBox(width: 100,),
//                                         //   Column(
//                                         //     children: [
//                                         //       Row(
//                                         //         children: [
//                                         //           // Text(room.lastMsg.servicenotif.title!),
//                                         //           //              Center(
//                                         //           //   child: Text('Formatted Date: $formattedDate'),
//                                         //           //  ),
//                                         //           Text(DateFormat('HH:mm:ss a')
//                                         //               .format(room.lastMsg.date)),
//                                         //         ],
//                                         //       ),
                                            
//                                         //       // Text("ggg"),
//                                         //     ],
//                                         //   ),
//                                         ],
//                                       ),
//                                         // Padding(
//                                         //   padding: const EdgeInsets.only(right: 250),
//                                         //   child: Text(
//                                         //     room.lastMsg.servicenotif.content!,
//                                         //     maxLines:
//                                         //         1, // تعداد خطوط مورد نظر (در اینجا یک خط)
//                                         //     overflow: TextOverflow
//                                         //         .ellipsis, // نمایش سه نقطه در صورت اتمام متن
//                                         //   ),
//                                         // ),
//                                     ],
//                                   ),
//                                 ),
                              );
                            }
                          } else {
                            return SizedBox(); // نوتیفیکیشن هایی که شروع به com.whatsapp نمی‌کنند، اینجا حذف می‌شوند
                          }
                        },
                      ),
                    ),
                  ],
                );
              }
              return Container(
                height: 50,
                width: 50,
                color: Colors.amber,
              );
            },
          )),
    );
  }

  String formatDate(DateTime date) {
    return DateFormat('HH:mm:ss a').format(date);
  }
}






























// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:notif/core/appbar/drawer_menu.dart';
// import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';
// import 'package:notif/pressentation/blocs/notificationbloc/home_bloc.dart';
// import 'package:notif/pressentation/blocs/notificationbloc/home_event.dart';
// import 'package:notif/pressentation/blocs/notificationbloc/home_state.dart';
// import 'package:notif/pressentation/screens/notificationhistory/details_notification_history_list.dart';
// import 'package:notification_listener_service/notification_listener_service.dart';
// class NotificationHistory extends StatefulWidget {
//   const NotificationHistory({super.key});

//   @override
//   State<NotificationHistory> createState() => _NotificationHistoryState();
// }

// class _NotificationHistoryState extends State<NotificationHistory> {
//      List notificationListt = <NotifWithTimeModel>[];
// String formattedDate = '';

//   @override
//   void initState() {
//     super.initState();
//     NotificationListenerService.notificationsStream.listen((event) {
//       print("Curent notification: $event");
//       setState(() {
//         notificationListt.add(NotifWithTimeModel(DateTime.now(), event));
//           //formattedDate = formatDate(DateTime.now());
//       });
      
//     });
//     //formattedDate = formatDate(DateTime.now());
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeBloc()..add(HomeLoadedEvent()),
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text("Notification history"),
//             backgroundColor: Colors.amber, 
//       ),
//       drawer: DrawerWidget(),
//         body:
//            BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
//             if(state is LoadedHomeState){
//                   return 
//               Column(
//   children: [
//     Expanded(
//       child: ListView.builder(
//         itemCount:notificationListt.length,
//         itemBuilder: (BuildContext context, int index) {
//          final notification = notificationListt[index];
//           if (notification.servicenotif.packageName!.startsWith("com.whatsapp")) {
//             if(notification.servicenotif.content.toString().contains("new messages")==true){
//     return Container();
//             }else{
//   return 
//   GestureDetector(
//     onTap: () {
//       print("gggggkkkllll");
//       Navigator.of(context).push(MaterialPageRoute(
//   builder: (context) => BlocProvider(
//     create: (context) => HomeBloc(),
//     child: DetailsNotificationHistoryList(
//       service: notification.servicenotif,
//       // indexx: index,
//       // formattedDatee: formattedDate,
//        formattedDatee: notification.date,                                                                                                                                                                                                                                                                                                                                                                                                        
//       //notificationListt:notification.date,
      
//      // time: DateFormat('HH:mm:ss a').format(notification.date),
// // اضافه کردن زمان
//     ),
//   ),
// ));


//    },
//     child: Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.all(10),
//                 color: Colors.deepPurple,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           decoration: const BoxDecoration(
//                                       image: DecorationImage(
//                               image: AssetImage('assets/images/user_profile.png'), // نمایش تصویر
//                               fit: BoxFit.cover, // تنظیم حالت نمایش تصویر
//                             ),
//                             borderRadius: BorderRadius.all(Radius.circular(50))
//                           ),
//                           height: 50,
//                           width: 50,
//                          ),
                     
//                     Expanded(
//                         child: Text(notification.servicenotif.content,
//                         maxLines: 1, // تعداد خطوط مورد نظر (در اینجا یک خط)
//                         overflow: TextOverflow.ellipsis, // نمایش سه نقطه در صورت اتمام متن
//                       ),
//                       ),
//                        // Gap(200),
                       
//                        Row(
//                         children: [
//                   Text(notification.servicenotif.title),
            
//       //              Center(
//       //   child: Text('Formatted Date: $formattedDate'),
//       //  ),
//                   Text(DateFormat('HH:mm:ss a').format(notification.date)),
//                         ],
//                        ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//   );
//             }
            
//           } else {
//             return SizedBox(); // نوتیفیکیشن هایی که شروع به com.whatsapp نمی‌کنند، اینجا حذف می‌شوند
//           }
//         },
//       ),
//     ),
//   ],
// );
            
//             }
//             return Container(height:  50,width: 50,color: Colors.amber,);
//            },)
//       ),
//     );
//   }

//     String formatDate(DateTime date) {
//     return DateFormat('HH:mm:ss a').format(date);
//   }
// }











///////////////////////////اخر درستهههههههه
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:notif/core/appbar/drawer_menu.dart';
// import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';
// import 'package:notif/pressentation/blocs/notificationbloc/home_bloc.dart';
// import 'package:notif/pressentation/blocs/notificationbloc/home_event.dart';
// import 'package:notif/pressentation/blocs/notificationbloc/home_state.dart';
// import 'package:notif/pressentation/screens/notificationhistory/details_notification_history_list.dart';
// import 'package:notification_listener_service/notification_listener_service.dart';
// class NotificationHistory extends StatefulWidget {
//   const NotificationHistory({super.key});

//   @override
//   State<NotificationHistory> createState() => _NotificationHistoryState();
// }

// class _NotificationHistoryState extends State<NotificationHistory> {
//      //List notificationListt = <NotifWithTimeModel>[];
//       final  notificationListt = <NotifWithTimeModel>[];
//       final  roomModellll = <RoomModel>[];
// String formattedDate = '';

//   @override
//   void initState() {
//     super.initState();
//     NotificationListenerService.notificationsStream.listen((event) {
//       print("Curent notification: $event");
//         if(event.hasRemoved ?? false){
//         return;
//       }
//          final msg = NotifWithTimeModel(DateTime.now(), event);

//         if(msg.servicenotif.title == 'WhatsApp'){
//           return;
//         }
//         int rIndex = notificationListt.indexWhere((room) => room.servicenotif.content == event.title);

//       setState(() {
//            if(rIndex == -1){
//         notificationListt.add(NotifWithTimeModel(DateTime.now(), event));
        
//           //formattedDate = formatDate(DateTime.now());
//            }else{
//             notificationListt[rIndex]..date = DateTime.now();
//            // notificationListt[rIndex]..messages.add(msg)..lastMsg = msg..date = DateTime.now();

//            }
//             notificationListt.sort((a, b) => b.date.compareTo(a.date));
//       });
      
//     });
//     //formattedDate = formatDate(DateTime.now());
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeBloc()..add(HomeLoadedEvent()),
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text("Notification history"),
//             backgroundColor: Colors.amber, 
//       ),
//       drawer: DrawerWidget(),
//         body:
//            BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
//             if(state is LoadedHomeState){
//                   return 
//               Column(
//   children: [
//     Expanded(
//       child: ListView.builder(
//         itemCount:notificationListt.length,
//         itemBuilder: (BuildContext context, int index) {
//          final notification = notificationListt[index];
//           if (notification.servicenotif.packageName!.startsWith("com.whatsapp")) {
//             if(notification.servicenotif.content.toString().contains("new messages")==true){
//     return Container();
//             }else{
//   return 
//   GestureDetector(
//     onTap: () {
//       print("gggggkkkllll");
//       Navigator.of(context).push(MaterialPageRoute(
//   builder: (context) => BlocProvider(
//     create: (context) => HomeBloc(),
//     child: DetailsNotificationHistoryList(
//       service: notification.servicenotif,
//       // indexx: index,
//       // formattedDatee: formattedDate,
//        formattedDatee: notification.date,
//        notificationListt: notificationListt,                                                                                                                                                                                                                                                                                                                                                                                                      
//       //notificationListt:notification.date,
      
//      // time: DateFormat('HH:mm:ss a').format(notification.date),
// // اضافه کردن زمان
//     ),
//   ),
// ));


//    },
//     child: Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.all(10),
//                 color: Colors.deepPurple,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           decoration: const BoxDecoration(
//                                       image: DecorationImage(
//                               image: AssetImage('assets/images/user_profile.png'), // نمایش تصویر
//                               fit: BoxFit.cover, // تنظیم حالت نمایش تصویر
//                             ),
//                             borderRadius: BorderRadius.all(Radius.circular(50))
//                           ),
//                           height: 50,
//                           width: 50,
//                          ),
                     
//                     Expanded(
//                         child: Text(notification.servicenotif.content!,
//                         maxLines: 1, // تعداد خطوط مورد نظر (در اینجا یک خط)
//                         overflow: TextOverflow.ellipsis, // نمایش سه نقطه در صورت اتمام متن
//                       ),
//                       ),
//                        // Gap(200),
                       
//                        Row(
//                         children: [
//                   Text(notification.servicenotif.title!),
            
//       //              Center(
//       //   child: Text('Formatted Date: $formattedDate'),
//       //  ),
//                   Text(DateFormat('HH:mm:ss a').format(notification.date)),
//                         ],
//                        ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//   );
//             }
            
//           } else {
//             return SizedBox(); // نوتیفیکیشن هایی که شروع به com.whatsapp نمی‌کنند، اینجا حذف می‌شوند
//           }
//         },
//       ),
//     ),
//   ],
// );
            
//             }
//             return Container(height:  50,width: 50,color: Colors.amber,);
//            },)
//       ),
//     );
//   }

//     String formatDate(DateTime date) {
//     return DateFormat('HH:mm:ss a').format(date);
//   }
// }

///////////////////////////////////////اخر درسته
