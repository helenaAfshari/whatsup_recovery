import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:notif/core/appbar/drawer_menu.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_bloc.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_event.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_state.dart';
import 'package:notif/pressentation/route/screen_names.dart';
import 'package:notif/pressentation/screens/notificationhistory/details_notification_history_list.dart';
import 'package:notif/pressentation/screens/notificationhistory/ggg.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class NotificationHistory extends StatefulWidget {
  const NotificationHistory({super.key});

  @override
  State<NotificationHistory> createState() => _NotificationHistoryState();
}

class _NotificationHistoryState extends State<NotificationHistory> {
     List notificationListt = <ServiceNotificationEvent>[];
     int? k ;
     DateTime currentTime = DateTime.now();

//  String formattedDateTime = DateFormat('HH:mm:ss a').format(DateTime.now());
String formattedDateTime = DateFormat('HH:mm:ss a').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    NotificationListenerService.notificationsStream.listen((event) {
      print("Curent notification: $event");
      setState(() {
        notificationListt.add(event);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Text("hhh"),
    // );
    

    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadedEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Notification history"),
            backgroundColor: Colors.amber,
          
      ),
      drawer: DrawerWidget(),
        // appBar:  AppBar(
        //   backgroundColor: Colors.amber,
        //   actions: [
            
        //   ],
      
        // ),
        body:
           BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
            // if(state is LoadingHomeState){
            //   return Center(child: const CircularProgressIndicator(backgroundColor: Colors.amber,));
            // }
            if(state is LoadedHomeState){

                  return 
              // Column(
              //   children: [
              //     Center(child: ElevatedButton(onPressed: () {
              //     BlocProvider.of<HomeBloc>(context).add(GetPermisionEvent());
              //         NotificationListenerService.notificationsStream.listen((event) {
              //         print("Curent notification: $event");
              //         notificationListt.add(event);
              //       });
              //               }, child: Text("kkk"))),
              //   ],
              // );
              Column(
  children: [
    Expanded(
      child: ListView.builder(
        itemCount:notificationListt.length,
        itemBuilder: (BuildContext context, int index) {
        //  final notification = notificationListt[index];
          if (notificationListt[index].packageName!.startsWith("com.whatsapp")) {
            if(notificationListt[index].content.toString().contains("new messages")==true){
    return Container();
            }else{
  return 
  GestureDetector(
    onTap: () {
      print("gggggkkkllll");
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailsNotificationHistoryList()));
    //if (state.notificationListt.isNotEmpty && index < state.notificationListt.length) {
//   Navigator.pushNamed(
//     context,
//     ScreenNames.detailsNotificationHistoryListScreen,
//     arguments: state.notificationListt[index].title,
//   );
// }

//                       print("hhjjkkkddhjgugk::::${state.notificationListt[index].title}");
//    print("HHHHHHHHHHHFSSS::::::$index");
int adjustedIndex = index<0 ? index-1:index;
         // List<> k = state.notificationListt;
List<ServiceNotificationEvent> k = notificationListt.cast<ServiceNotificationEvent>();

    Navigator.of(context).push(MaterialPageRoute(  
      
                              builder: (context) => BlocProvider(
                                create: (context) => HomeBloc(),
                                child: DetailsNotificationHistoryList(
                              service:notificationListt[index],
      indexx: index,
      
                                 
                                ),
                              ),
                            ));

   },
    child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.deepPurple,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                                      image: DecorationImage(
                              image: AssetImage('assets/images/user_profile.png'), // نمایش تصویر
                              fit: BoxFit.cover, // تنظیم حالت نمایش تصویر
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          height: 50,
                          width: 50,
                         ),
                         // Gap(20),
                      //  Text(notification.content,
                      //  softWrap: true,
                      //  overflow: TextOverflow.clip,
                      //  maxLines: 3,),
                    Expanded(
                        child: Text( notificationListt[index].content,
                    // state.notificationListt[index].content,
                    // state.notificationListt[index].title??"gggggg",
                        maxLines: 1, // تعداد خطوط مورد نظر (در اینجا یک خط)
                        overflow: TextOverflow.ellipsis, // نمایش سه نقطه در صورت اتمام متن
                      ),
                      ),
                       // Gap(200),
                       
                       Row(
                        children: [
                  Text(notificationListt[index].title),
                       // Gap(10),
                       Text("$formattedDateTime"),
                        ],
                       )
                      ],
                    )
                    // Row(
                    //   children: [
                    //     Text("${notification.packageName.split("com")}"),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text(notification.content),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     // Text("lllll::::$formattedDateTime"),
                    //   ],
                    // ),
                  ],
                ),
              ),
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

    //           Column(
    //   children: [
    //     Expanded(
    //       child: ListView.builder(
    //         itemCount: notificationListt.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           final notification = notificationListt[index];
    //           return Container(
    //             padding: EdgeInsets.all(10),
    //             margin: EdgeInsets.all(10),
    //             color: Colors.deepPurple,
    //             child: Column(
    //               children: [
    //                 Row(
    //                   children: [
    //                     Text("${notification.packageName.split("com")}"),
    //                   ],
    //                 ),
    //                 Row(
    //                   children: [
    //                     Text(notification.content),
    //                   ],
    //                 ),
    //                 Row(
    //                   children: [
    //                     // Text("lllll::::$formattedDateTime"),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //   ],
    // );
            
            }
            //  return 
            //   Center(child: ElevatedButton(onPressed: () {
            //   BlocProvider.of<HomeBloc>(context).add(GetPermisionEvent());
            // }, child: Text("kkk"))),
            return Container(height:  50,width: 50,color: Colors.amber,);
           },)
      ),
    );
  }
}
