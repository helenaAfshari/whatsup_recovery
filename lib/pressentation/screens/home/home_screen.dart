import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notif/pressentation/blocs/homebloc/home_bloc.dart';
import 'package:notif/pressentation/blocs/homebloc/home_event.dart';
import 'package:notif/pressentation/blocs/homebloc/home_state.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
            List notificationListt = <ServiceNotificationEvent>[];

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
            itemCount: notificationListt.length,
            itemBuilder: (BuildContext context, int index) {
              final notification = notificationListt[index];
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.deepPurple,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("${notification.packageName.split("com")}"),
                      ],
                    ),
                    Row(
                      children: [
                        Text(notification.content),
                      ],
                    ),
                    Row(
                      children: [
                        // Text("lllll::::$formattedDateTime"),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
            
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
