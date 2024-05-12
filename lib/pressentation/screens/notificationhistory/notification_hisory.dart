import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:WhatsUp/core/resource/constants/my_colors.dart';
import 'package:WhatsUp/core/resource/constants/my_strings.dart';
import 'package:WhatsUp/domain/model/notif_event_hive/notif_event_hive.dart';
import 'package:WhatsUp/domain/model/service_whatsup_model.dart/service_whatsup_model.dart';
import 'package:WhatsUp/main.dart';
import 'package:WhatsUp/pressentation/blocs/notificationbloc/notification_history_bloc.dart';
import 'package:WhatsUp/pressentation/blocs/notificationbloc/notification_history_event.dart';
import 'package:WhatsUp/pressentation/blocs/notificationbloc/notification_history_state.dart';
import 'package:WhatsUp/pressentation/screens/notificationhistory/details_notification_history_list.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

//  final rrrrooooms =  RoomModel(
//  name: "lll",
//  date: DateTime.now(),
//  lastMsg: NotifWithTimeModel(DateTime.now(), NotificationEventHive()),
//  messages: []);

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  // DartPluginRegistrant.ensureInitialized();

  // For flutter prior to version 3.0.0
  // We have to register the plugin manually

  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // await preferences.setString("hello", "world");

  /// OPTIONAL when use custom notification
//   if (service is AndroidServiceInstance) {
//     service!.on('setAsForeground').listen((event) {
//       service!.setAsForegroundService();
//     });

//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }

//   service!.on('stopService').listen((event) {
//     service!.stopSelf();
//   });

//   if (service is AndroidServiceInstance) {
// service!.setForegroundNotificationInfo(
//       title: "App in background...",
//       content: "gggg",
//     );
//   }

  //bring to foreground
//   Timer.periodic(const Duration(seconds: 10), (timer) async {
//   if (service is AndroidServiceInstance) {
// service.setForegroundNotificationInfo(
//       title: "App in background...",
//       content: "Update ${DateTime.now()}",
//     );
//   }

  final List<RoomModel> rooms = [];

  SharedPreferences preferences = await SharedPreferences.getInstance();

  List<String>? roomsStr = await preferences.getStringList('rooms');

//اینجا اگر داخل  فور نزاریم لیست رو نمایش نمیده 
  if (roomsStr != null) {
    for (var roomStr in roomsStr) {
      rooms.add(RoomModel.fromJson(jsonDecode(roomStr) as Map<String, dynamic>));
    }
  }



  NotificationListenerService.notificationsStream.listen((eventPure) async {
    //برای تبدیل اون کلاسی که میخواییم استفاده میشه  fromEntity
    final NotificationEventHive event =
        NotificationEventHive.fromEntity(eventPure);

    if (event.hasRemoved ?? false) {
      return;
    }

    if (!(event.packageName == 'com.whatsapp')) {
      return;
    }
    print("Current notification: $event");

    final msg = NotifWithTimeModel(DateTime.now(), event);

    if (msg.servicenotif.title == 'WhatsApp' ||
        RegExp(r'\d+ new message').hasMatch(msg.servicenotif.content!)) {
      return;
    }

    int rIndex = rooms.indexWhere((room) => room.name == event.title);

    if (rIndex == -1) {
      final room = RoomModel(
          name: event.title ?? 'Unknown',
          date: DateTime.now(),
          lastMsg: msg,
          messages: [msg]);
      // new message from a new user
      rooms.add(room);
      preferences.setStringList(
          'rooms', [...rooms.map((e) => jsonEncode(e.toJson()))]);
    service.invoke(
      'update',
      {
        "action": 'add',
        'room': room.toJson()
      },
    );
      // box
      //     .add(room)
      //     .then((value) => print('new room saved successfully'))
      //     .catchError(print);

      // FlutterBackgroundService().invoke("تتتتت");
      //  print("jhyunhgfdd${a}");
    } else {
      if (rooms[rIndex].messages.isNotEmpty &&
          rooms[rIndex].lastMsg.servicenotif.content ==
              msg.servicenotif.content) {
        return;
      }

      // new message from existing user
      rooms[rIndex]
        ..messages.add(msg)
        ..lastMsg = msg
        ..date = DateTime.now();
      preferences.setStringList(
          'rooms', [...rooms.map((e) => jsonEncode(e.toJson()))]);
      
    service.invoke(
      'update',
      {
        "action": 'update',
        "index": rIndex,
        'room': rooms[rIndex].toJson()
      },
    );
    }
  });
}

class NotificationHistory extends StatefulWidget {
  const NotificationHistory({super.key});

  @override
  State<NotificationHistory> createState() => _NotificationHistoryState();
}

class _NotificationHistoryState extends State<NotificationHistory> {
  final service = FlutterBackgroundService();
  String formattedDate = '';

  late final SharedPreferences preferences;
  final rooms = <RoomModel>[];

  @override
  void initState() {
    super.initState();
    //اولویت قرار بگیره sort

    SharedPreferences.getInstance().then((value) async {
      preferences = value;

      List<String>? roomsStr = await preferences.getStringList('rooms');

      if (roomsStr != null) {
        for (var roomStr in roomsStr) {
          rooms.add(
              RoomModel.fromJson(jsonDecode(roomStr) as Map<String, dynamic>));
        }
        setState(() {});
      }
    });

    service.on('update').listen((data) async {
      final roomMap = data?['room'];
      final RoomModel room = RoomModel.fromJson(roomMap);
      if (data?['action'] == 'add') {
        rooms.add(room);
      } else if (data?['action'] == 'update') {
        int? index = data?['index'];
        if (index != null && index >= 0) {
          rooms[index] = room;
        }
      }


      //    //برای تبدیل اون کلاسی که میخواییم استفاده میشه  fromEntity
      // final NotificationEventHive event =
      //     NotificationEventHive.fromEntity(eventPure);

      //  //برای تبدیل اون کلاسی که میخواییم استفاده میشه  fromEntity
      // final NotificationEventHive event =
      //     NotificationEventHive.fromEntity(eventPure);

      // FlutterBackgroundService().invoke(event.title.toString());

        setState(() {});
      rooms.sort((a, b) => b.date.compareTo(a.date));
    });

    // rooms
    //   ..addAll(box.values)
    //   ..sort((a, b) => b.date.compareTo(a.date));
  }

  @override
  Widget build(BuildContext context) {
    String text = "Stop Service";

    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadedEvent()),
      child: SafeArea(
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: MyColors.backgroundStatuseBarColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            backgroundColor: MyColors.backgroundAppBarColor,
            appBar: AppBar(
              backgroundColor: MyColors.backgroundAppBarColor,
              actions: [
                PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: MyColors.primaryButtonColor,
                  ),

                  offset: Offset(0, 56),
                  //padding: EdgeInsets.symmetric(vertical: 20),
                  iconSize: 28,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        child: GestureDetector(
                            onTap: () async {
                              if (await canLaunchUrl(
                                  Uri.parse(MyStrings.support))) {
                                await launchUrl(Uri.parse(MyStrings.support));
                              }
                            },
                            child: Text("پشتیبانی ")))
                  ],
                ),
              ],
              title: Text(
                MyStrings.notificationHistory,
                style: TextStyle(
                    color: MyColors.notificationHistoryTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is LoadingHomeState) {
                  CircularProgressIndicator(
                    color: Colors.blue,
                  );
                }

                if (state is LoadedHomeState) {
                  return Column(
                    children: [
                      //FlutterBackgroundService().invoke("setAsBackground");
                      ElevatedButton(
                        child: const Text("Background Mode"),
                        onPressed: () {
                          FlutterBackgroundService().invoke("setAsBackground");
                        },
                      ),

                      //    StreamBuilder<Map<String, dynamic>?>(
                      //   stream: FlutterBackgroundService().on('update'),
                      //   builder: (context, snapshot) {
                      //     if (!snapshot.hasData) {
                      //       return const Center(
                      //         child: CircularProgressIndicator(),
                      //       );
                      //     }

                      //     final data = snapshot.data!;
                      //     String? device = data["device"];
                      //     DateTime? date = DateTime.tryParse(data["current_date"]);
                      //     return Column(
                      //       children: [
                      //         Text(device ?? 'Unknown'),
                      //         Text(date.toString()),
                      //       ],
                      //     );
                      //   },
                      // ),
                      // ElevatedButton(
                      //   child: const Text("Foreground Mode"),
                      //   onPressed: () {
                      //     FlutterBackgroundService().invoke("setAsForeground");
                      //   },
                      // ),

                      //   ElevatedButton(
                      //   child: const Text("Background Mode"),
                      //   onPressed: () {
                      //     FlutterBackgroundService().invoke("setAsBackground");
                      //   },
                      // ),

                      //              ElevatedButton(
                      //   child: Text(text),
                      //   onPressed: () async {
                      //     final service = FlutterBackgroundService();
                      //     var isRunning = await service.isRunning();

                      //     if (isRunning) {
                      //       service.invoke("stopService");
                      //     } else {
                      //       service.startService();
                      //     }

                      //     if (!isRunning) {
                      //       text = 'Stop Service';
                      //     } else {
                      //       text = 'Start Service';
                      //     }
                      //     setState(() {});
                      //   },
                      // ),

                      // ElevatedButton(
                      //         child: const Text("Background Mode"),
                      //         onPressed: () {
                      //           FlutterBackgroundService().invoke("setAsBackground");
                      //         },
                      //       ),
                      //   ElevatedButton(
                      //   child: const Text("Foreground Mode"),
                      //   onPressed: () {
                      //     FlutterBackgroundService().invoke("jjjjjj");
                      //   },
                      // ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: rooms.length,
                          itemBuilder: (BuildContext context, int index) {
                            final room = rooms.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                print("gggggkkkllll");
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                          create: (context) => HomeBloc(),
                                          child: DetailsNotificationHistoryList(
                                            room: room,
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
                                          image: AssetImage(
                                              'assets/images/user_profile.png'), // نمایش تصویر
                                          fit: BoxFit
                                              .cover, // تنظیم حالت نمایش تصویر
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                      ),
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //   StreamBuilder<Map<String, dynamic>?>(
                                          //   stream: FlutterBackgroundService().on('update'),
                                          //  builder: (context, snapshot) {
                                          //     if (!snapshot.hasData) {
                                          //       return const Center(
                                          //         child: CircularProgressIndicator(),
                                          //       );
                                          //     }

                                          //     final data = snapshot.data!;
                                          //     String? device = data["device"];
                                          //     DateTime? date = DateTime.tryParse(data["current_date"]);
                                          //     return Column(
                                          //       children: [
                                          //         Text(device ?? 'Unknown'),
                                          //         Text(date.toString()),
                                          //       ],
                                          //     );
                                          //   },
                                          // ),

//      StreamBuilder<Map<String, dynamic>?>(
//   stream: FlutterBackgroundService().on('update'),
//   builder: (context, snapshot) {
//     // if (!snapshot.hasData) {
//     //   return const Center(
//     //     child: CircularProgressIndicator(),
//     //   );
//     // }

//     final data = snapshot.data!;
//     String? device = data["device"];
//     //String? title = room.lastMsg.servicenotif.content!;
//     DateTime? date = DateTime.tryParse(data["current_date"]);
//     return Column(
//       children: [
//         Text(device ?? 'Unknown'),
//         Text(date.toString()),
//         // Text(date.toString()),
//         // Text( room.lastMsg.servicenotif
//         //                               .content!,),
//       ],
//     );
//   },
// ),
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
                            );
                          },
                        ),
                      ),

                      // ElevatedButton(
                      // onPressed: () {
                      //   FlutterBackgroundService().invoke("setBackgroundService");
                      // }, child: Text("background")),
                    ],
                  );
                }
                return Container(
                  height: 50,
                  width: 50,
                  color: Colors.amber,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String formatDate(DateTime date) {
    return DateFormat('HH:mm:ss a').format(date);
  }
}
// @pragma('vm:entry-point')
// void onStart(ServiceInstance service)async{
//   if(service is AndroidServiceInstance){
//     service.on('setAsForground').listen((event) {
//       service.setAsForegroundService();
//     });
//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//     service.on('stopService').listen((event) {
//       service.stopSelf();
//     });
//     Timer.periodic(Duration(seconds: 2), (timer) async {
//      if(service is AndroidServiceInstance){
//       if(await service.isForegroundService()){
//         service.setForegroundNotificationInfo(
//         title: ,
//         content: "Updated ${DateTime.now()}");
//       }
//      }

//     });
//   }
// }
