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
     List notificationListt = <NotifWithTimeModel>[];


  @override
  void initState() {
    super.initState();
    NotificationListenerService.notificationsStream.listen((event) {
      print("Curent notification: $event");
      setState(() {
        notificationListt.add(NotifWithTimeModel(DateTime.now(), event));
     
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadedEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Notification history"),
            backgroundColor: Colors.amber,
          
      ),
      drawer: DrawerWidget(),
        body:
           BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
       
            if(state is LoadedHomeState){

                  return 
           
              Column(
  children: [
    Expanded(
      child: ListView.builder(
        itemCount:notificationListt.length,
        itemBuilder: (BuildContext context, int index) {
         final notification = notificationListt[index];
          if (notification.event.packageName!.startsWith("com.whatsapp")) {
            if(notification.event.content.toString().contains("new messages")==true){
    return Container();
            }else{
  return 
  GestureDetector(
    onTap: () {
      print("gggggkkkllll");
    Navigator.of(context).push(MaterialPageRoute(  
      
                              builder: (context) => BlocProvider(
                                create: (context) => HomeBloc(),
                                child: DetailsNotificationHistoryList(
                              service:notification.event,
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
                     
                    Expanded(
                        child: Text( notification.event.content,
                        maxLines: 1, // تعداد خطوط مورد نظر (در اینجا یک خط)
                        overflow: TextOverflow.ellipsis, // نمایش سه نقطه در صورت اتمام متن
                      ),
                      ),
                       // Gap(200),
                       
                       Row(
                        children: [
                  Text(notification.event.title),
                       Text(DateFormat('HH:mm:ss a').format(notification.date)),
                        ],
                       )
                      ],
                    )
                    ,
                  
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
            
            }
            return Container(height:  50,width: 50,color: Colors.amber,);
           },)
      ),
    );
  }
}