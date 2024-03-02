
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notif/core/resource/constants/my_strings.dart';
import 'package:notif/pressentation/blocs/detailsbloc/details_bloc.dart';
import 'package:notif/pressentation/blocs/detailsbloc/details_event.dart';
import 'package:notif/pressentation/blocs/detailsbloc/details_state.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';
class DetailsNotificationHistoryList extends StatefulWidget {
  final int? indexx;
final ServiceNotificationEvent? service;
  DetailsNotificationHistoryList({this.indexx,this.service});

  @override
  State<DetailsNotificationHistoryList> createState() => _DetailsNotificationHistoryListState();
}

class _DetailsNotificationHistoryListState extends State<DetailsNotificationHistoryList> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
  child: Column(
    children: [
      Container(
      ),
 Text('Content: ${widget.service?.content ?? ""}'),
       // Text('Index: ${widget.indexx ?? "No index available"}'),
    ],
  ),
),

    );
  }
}

// class DetailsNotificationHistoryList extends StatefulWidget {
//     int? indexx;
//    DetailsNotificationHistoryList({this.indexx});

//   @override
//   State<DetailsNotificationHistoryList> createState() => _DetailsNotificationHistoryListState();
// }

// class _DetailsNotificationHistoryListState extends State<DetailsNotificationHistoryList> {
//        List notificationListt = <ServiceNotificationEvent>[];
// // @override
// //   void initState() {
// //     super.initState();
// //     NotificationListenerService.notificationsStream.listen((event) {
// //       print("Curent notification: $event");
// //       setState(() {
// //         notificationListt.add(event);
// //       });
// //     });
// //   }
//   @override
//   Widget build(BuildContext context) {
//     final mobileArg = ModalRoute.of(context)!.settings.arguments as String;
//     return BlocProvider(
//       create: (context) => DetailBloc()..add(DetailLoadedEvent()),
//       child: SafeArea(child: Scaffold(
//         body: BlocBuilder<DetailBloc,DetailState>(builder: (context, state) {
//        if(state is LoadingDetailState){
//         return const CircularProgressIndicator();
//        }
//        if(state is LoadedDetailState){
//          return
//          SafeArea(child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.amber,
//             // actions: [
              
//             //   Text("ggg"),
//             // ],
//           ),
//         body: ListView.builder(
//           itemCount: notificationListt.length,
//           itemBuilder: (context, index) {
//                  final notification = notificationListt[index];
//             return
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child:   Expanded(
//                         child: Text(
//                           "gggg".replaceAll(MyStrings.replace, mobileArg),
//                          // mobileArg.toString(),
//                         // notification.content,
//                         maxLines: 1, // تعداد خطوط مورد نظر (در اینجا یک خط)
//                         overflow: TextOverflow.ellipsis, // نمایش سه نقطه در صورت اتمام متن
//                       ),
//                       ),
//              );
//           },
    
//         )
//         ));
//        }
//        return Container(height: 50,width: 50,color: Colors.amber,);
//       },),
//         ),)
//     );
//   }
// }





















// import 'package:flutter/material.dart';
// import 'package:notification_listener_service/notification_event.dart';

// class DetailsNotificationHistoryList extends StatefulWidget {
//   const DetailsNotificationHistoryList({super.key});

//   @override
//   State<DetailsNotificationHistoryList> createState() => _DetailsNotificationHistoryListState();
// }

// class _DetailsNotificationHistoryListState extends State<DetailsNotificationHistoryList> {
//               List notificationListt = <ServiceNotificationEvent>[];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//      body:              Column(
//   children: [
//     Expanded(
//       child: ListView.builder(
//         itemCount: notificationListt.length,
//         itemBuilder: (BuildContext context, int index) {
//           final notification = notificationListt[index];
//           if (notification.packageName.startsWith("com.whatsapp")) {
//             if(notification.content.toString().contains("new messages")==true){
//     return Container();
//             }else{
//   return 
//   GestureDetector(
//     onTap: () {
//       print("gggggkkkllll");
//     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailsNotificationHistoryList()));
//    //Navigator.pushNamed(context, ScreenNames.detailsNotificationHistoryListScreen);

//     },
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
//                          // Gap(20),
//                       //  Text(notification.content,
//                       //  softWrap: true,
//                       //  overflow: TextOverflow.clip,
//                       //  maxLines: 3,),
//                     Expanded(
//                         child: Text(
//                         notification.content,
//                         maxLines: 1, // تعداد خطوط مورد نظر (در اینجا یک خط)
//                         overflow: TextOverflow.ellipsis, // نمایش سه نقطه در صورت اتمام متن
//                       ),
//                       ),
//                        // Gap(200),
                       
//                        Row(
//                         children: [
//                   Text(notification.title),
//                        // Gap(10),
//                       // Text("$formattedDateTime"),
//                         ],
//                        )
//                       ],
//                     )
//                     // Row(
//                     //   children: [
//                     //     Text("${notification.packageName.split("com")}"),
//                     //   ],
//                     // ),
//                     // Row(
//                     //   children: [
//                     //     Text(notification.content),
//                     //   ],
//                     // ),
//                     // Row(
//                     //   children: [
//                     //     // Text("lllll::::$formattedDateTime"),
//                     //   ],
//                     // ),
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
// )
//      )
//      );
//   }
// }