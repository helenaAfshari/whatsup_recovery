

// import 'dart:async';
// import 'dart:io';
// import 'dart:ui';
// import 'package:WhatsUp/domain/model/notif_event_hive/notif_event_hive.dart';
// import 'package:WhatsUp/domain/model/service_whatsup_model.dart/service_whatsup_model.dart';
// import 'package:WhatsUp/pressentation/blocs/notificationbloc/notification_history_bloc.dart';
// import 'package:WhatsUp/pressentation/screens/notificationhistory/details_notification_history_list.dart';
// import 'package:WhatsUp/pressentation/screens/notificationhistory/notification_hisory.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:intl/intl.dart';
// import 'package:notification_listener_service/notification_listener_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initializeService();
//   runApp(const MyApp());
// }

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();

//   /// OPTIONAL, using custom notification channel id
//   const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'my_foreground', // id
//     'MY FOREGROUND SERVICE', // title
//     description:
//         'This channel is used for important notifications.', // description
//     importance: Importance.low, // importance must be at low or higher level
//   );

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   if (Platform.isIOS || Platform.isAndroid) {
//     await flutterLocalNotificationsPlugin.initialize(
//       const InitializationSettings(
//         iOS: DarwinInitializationSettings(),
//         android: AndroidInitializationSettings('ic_bg_service_small'),
//       ),
//     );
//   }

//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       // this will be executed when app is in foreground or background in separated isolate
//       onStart: onStart,

//       // auto start service
//       autoStart: true,
//       isForegroundMode: false,

//       // notificationChannelId: 'my_foreground',
//       // initialNotificationTitle: 'AWESOME SERVICE',
//       // initialNotificationContent: "555",
//       foregroundServiceNotificationId: 888,
//     ),
//     iosConfiguration: IosConfiguration(
//       // auto start service
//       autoStart: false,

//       // this will be executed when app is in foreground in separated isolate
//       onForeground: onStart,

//       // you have to enable background fetch capability on xcode project
//       onBackground: onIosBackground,
//     ),
//   );
// }

// // to ensure this is executed
// // run app from xcode, then from xcode menu, select Simulate Background Fetch

// @pragma('vm:entry-point')
// Future<bool> onIosBackground(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();

//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   await preferences.reload();
//   final log = preferences.getStringList('log') ?? <String>[];
//   log.add(DateTime.now().toIso8601String());
//   await preferences.setStringList('log', log);

//   return true;
// }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   // Only available for flutter 3.0.0 and later
//   DartPluginRegistrant.ensureInitialized();

//   // For flutter prior to version 3.0.0
//   // We have to register the plugin manually

//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   await preferences.setString("hello", "world");

//   /// OPTIONAL when use custom notification
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   if (service is AndroidServiceInstance) {
//     service.on('setAsForeground').listen((event) {
//       service.setAsForegroundService();
//     });

//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }

//   service.on('stopService').listen((event) {
//     service.stopSelf();
//   });

//   // bring to foreground
//   Timer.periodic(const Duration(seconds: 1), (timer) async {
//     if (service is AndroidServiceInstance) {
//       if (await service.isForegroundService()) {
//         /// OPTIONAL for use custom notification
//         /// the notification id must be equals with AndroidConfiguration when you call configure() method.
//         // flutterLocalNotificationsPlugin.show(
//         //   888,
//         //   'COOL SERVICE',
//         //   'Awesome ${DateTime.now()}',
//         //   const NotificationDetails(
//         //     android: AndroidNotificationDetails(
//         //       'my_foreground',
//         //       'MY FOREGROUND SERVICE',
//         //       icon: 'ic_bg_service_small',
//         //       ongoing: true,
//         //     ),
//         //   ),
//         // );

//         // if you don't using custom notification, uncomment this
//         // service.setForegroundNotificationInfo(
//         //   title: "My App Service",
//         //   content: "Updated at ${DateTime.now()}",
//         // );
//       }
//     }

//     /// you can see this log in logcat
//    // print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

//     // test using external plugin
//     final deviceInfo = DeviceInfoPlugin();
//     String? device;
//     if (Platform.isAndroid) {
//       final androidInfo = await deviceInfo.androidInfo;
//       device = androidInfo.model;
//     }

//     if (Platform.isIOS) {
//       final iosInfo = await deviceInfo.iosInfo;
//       device = iosInfo.model;
//     }

//     service.invoke(
//       'update',
//       {
//         "current_date": DateTime.now().toIso8601String(),
//         "device": device,
//       },
//     );
//   });
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   String text = "Stop Service";
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Service App'),
//         ),
//         body: Column(
//           children: [
//             StreamBuilder<Map<String, dynamic>?>(
//               stream: FlutterBackgroundService().on('update'),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 final data = snapshot.data!;
//                 String? device = data["device"];
//                 DateTime? date = DateTime.tryParse(data["current_date"]);
//                 return Column(
//                   children: [
//                     Text(device ?? 'Unknown'),
//                     Text(date.toString()),
//                   ],
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: const Text("Foreground Mode"),
//               onPressed: () {
//                 FlutterBackgroundService().invoke("setAsForeground");
//               },
//             ),
//             ElevatedButton(
//               child: const Text("Background Mode"),
//               onPressed: () {
//                 FlutterBackgroundService().invoke("setAsBackground");
//               },
//             ),
//             ElevatedButton(
//               child: Text(text),
//               onPressed: () async {
//                 final service = FlutterBackgroundService();
//                 var isRunning = await service.isRunning();
//                 if (isRunning) {
//                   service.invoke("stopService");
//                 } else {
//                   service.startService();
//                 }

//                 if (!isRunning) {
//                   text = 'Stop Service';
//                 } else {
//                   text = 'Start Service';
//                 }
//                 setState(() {});
//               },
//             ),
//             const Expanded(
//               child: LogView(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LogView extends StatefulWidget {
//   const LogView({Key? key}) : super(key: key);

//   @override
//   State<LogView> createState() => _LogViewState();
// }

// class _LogViewState extends State<LogView> {
//   late final Timer timer;
//   List<String> logs = [];

//   @override
//   void initState() {
//     super.initState();
//     // timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
//     //   final SharedPreferences sp = await SharedPreferences.getInstance();
//     //   await sp.reload();
//     //   logs = sp.getStringList('log') ?? [];
//     //   if (mounted) {
//     //     setState(() {
          
//     //     });
//     //   }
//     // });


//   NotificationListenerService.notificationsStream.listen((eventPure) async {
    
//               // print("dd: $dd");
//          //برای تبدیل اون کلاسی که میخواییم استفاده میشه  fromEntity
//       final NotificationEventHive event =
//           NotificationEventHive.fromEntity(eventPure);

//   AndroidNotificationChannel(
//     'my_foreground', // id
//     event.content.toString(), // title
//     description:
//         'This channel is used for important notifications.', // description
//     importance: Importance.low, // importance must be at low or higher level
//   );
//       //  //برای تبدیل اون کلاسی که میخواییم استفاده میشه  fromEntity
//       // final NotificationEventHive event =
//       //     NotificationEventHive.fromEntity(eventPure);
          
//   // FlutterBackgroundService().invoke(event.title.toString());

//       print("Current notification: $event");
//       if (event.hasRemoved ?? false) {
//         return; 
//       }

//       if (!(event.packageName == 'com.whatsapp')) {
//         return;
//       }

//       final msg = NotifWithTimeModel(DateTime.now(), event);

//       if (msg.servicenotif.title == 'WhatsApp' ||
//           RegExp(r'\d+ new message').hasMatch(msg.servicenotif.content!)) {
//         return;
//       }

//      int rIndex = rooms.indexWhere((room) => room.name == event.title);
//         final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//       setState(()  {

//         //    flutterLocalNotificationsPlugin.show(
//         //   10,
//         //   'COOL SERVICE',
//         //   'Awesome ${rooms[rIndex].lastMsg.servicenotif.content}',
//         //   const NotificationDetails(
//         //     android: AndroidNotificationDetails(
//         //       'my_foreground',
//         //       'MY FOREGROUND SERVICE',
//         //       icon: 'ic_bg_service_small',
//         //       ongoing: true,
//         //     ),
//         //   ),
//         // );


        




// //   await flutterLocalNotificationsPlugin
// //       .resolvePlatformSpecificImplementation<
// //           AndroidFlutterLocalNotificationsPlugin>()
// //       ?.createNotificationChannel(channel);

// //   await service.configure(
// //     androidConfiguration: AndroidConfiguration(
// //       // this will be executed when app is in foreground or background in separated isolate
// //       onStart: onStart,
// //       // auto start service
// //       autoStart: true,
// //       isForegroundMode: true,
// //       notificationChannelId: 'my_foreground',
// //       initialNotificationTitle: 'kkkkk',
// //       initialNotificationContent: 'Initializing',
// //       foregroundServiceNotificationId: 888,
// //     ),
// //     iosConfiguration: IosConfiguration(
// //       // auto start service
// //       autoStart: true,

// //       // this will be executed when app is in foreground in separated isolate
// //       onForeground: onStart,

// //       // you have to enable background fetch capability on xcode project
// //       //onBackground: onIosBackground,
// //     ),
// //   );
// // }


//         if (rIndex == -1) {
//     //   timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
//     //   final SharedPreferences sp = await SharedPreferences.getInstance();
//     //   await sp.reload();
//     //   logs = sp.getStringList('log') ?? [];
//     //   if (mounted) {
//     //     setState(() {
          
//     //     });
//     //   }
//     // });


//           final room = RoomModel(
//               name: event.title ?? 'Unknown',
//               date: DateTime.now(),
//               lastMsg: msg,
//               messages: [msg]);
//           // new message from a new user
//           rooms.add(room);
//           box 
//               .add(room)
//               .then((value) => print('new room saved successfully'))
//               .catchError(print);

//     // FlutterBackgroundService().invoke("تتتتت");
//     //  print("jhyunhgfdd${a}");
  
//         } 
//         else {
//           if (rooms[rIndex].messages.isNotEmpty &&
//               rooms[rIndex].lastMsg.servicenotif.content ==
//                   msg.servicenotif.content) {
//             return;
//           }

//           // new message from existing user
//           rooms[rIndex]
//             ..messages.add(msg)
//             ..lastMsg = msg
//             ..date = DateTime.now();
//           rooms[rIndex]
//               .save()
//               .then((value) => print('new room saved successfully'))
//               .catchError(print);              
//               //  FlutterBackgroundService().invoke(msg.toString());
//         }
//       });

//       rooms.sort((a, b) => b.date.compareTo(a.date));
//     });
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//       Expanded(
//                           child: ListView.builder(
//                             itemCount: rooms.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               final room = rooms.elementAt(index);
//                               return GestureDetector(
//                                 onTap: () {
//                                   print("gggggkkkllll");
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                       builder: (context) => BlocProvider(
//                                             create: (context) => HomeBloc(),
//                                             child:
//                                                 DetailsNotificationHistoryList(
//                                               room: room,
//                                             ),
//                                           )));
//                                 },
//                                 child: Container(
//                                   height: 75,
//                                   width: 200,
//                                   padding: EdgeInsets.all(10),
//                                   margin: EdgeInsets.all(10),
//                                   color: Colors.white,
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         decoration: const BoxDecoration(
//                                           image: DecorationImage(
//                                             image: AssetImage(
//                                                 'assets/images/user_profile.png'), // نمایش تصویر
//                                             fit: BoxFit
//                                                 .cover, // تنظیم حالت نمایش تصویر
//                                           ),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(50)),
//                                         ),
//                                         height: 50,
//                                         width: 50,
//                                       ),
//                                       SizedBox(width: 10),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
                                            
//             //   StreamBuilder<Map<String, dynamic>?>(
//             //   stream: FlutterBackgroundService().on('update'),
//             //  builder: (context, snapshot) {
//             //     if (!snapshot.hasData) {
//             //       return const Center(
//             //         child: CircularProgressIndicator(),
//             //       );
//             //     }

//             //     final data = snapshot.data!;
//             //     String? device = data["device"];
//             //     DateTime? date = DateTime.tryParse(data["current_date"]);
//             //     return Column(
//             //       children: [
//             //         Text(device ?? 'Unknown'),
//             //         Text(date.toString()),
//             //       ],
//             //     );
//             //   },
//             // ),





// //      StreamBuilder<Map<String, dynamic>?>(
// //   stream: FlutterBackgroundService().on('update'),
// //   builder: (context, snapshot) {
// //     // if (!snapshot.hasData) { 
// //     //   return const Center(
// //     //     child: CircularProgressIndicator(),
// //     //   );
// //     // }

// //     final data = snapshot.data!;
// //     String? device = data["device"];
// //     //String? title = room.lastMsg.servicenotif.content!; 
// //     DateTime? date = DateTime.tryParse(data["current_date"]);
// //     return Column(
// //       children: [
// //         Text(device ?? 'Unknown'),
// //         Text(date.toString()),
// //         // Text(date.toString()),
// //         // Text( room.lastMsg.servicenotif
// //         //                               .content!,),
// //       ],
// //     );
// //   },
// // ),
//                                             Text(
//                                               room.lastMsg.servicenotif.title!,
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                             Text(
//                                               room.lastMsg.servicenotif
//                                                   .content!,
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Text(DateFormat('HH:mm:ss a')
//                                           .format(room.lastMsg.date)),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//   }
// }


import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:WhatsUp/pressentation/screens/notificationhistory/notification_hisory.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:WhatsUp/core/resource/constants/theme/my_theme.dart';
import 'package:WhatsUp/domain/model/notif_event_hive/notif_event_hive.dart';
import 'package:WhatsUp/domain/model/service_whatsup_model.dart/service_whatsup_model.dart';
import 'package:WhatsUp/pressentation/route/routes.dart';
import 'package:WhatsUp/pressentation/route/screen_names.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';


String roomBox =  'room_box';

// class ServiceInitializer {
//   static Future<void> initializeService() async {
//     // Your initialization code here
//   }
// }


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  await initializeService();
  // Hive.initFlutter();

  await initializeService();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  
  Hive
    ..registerAdapter(NotifWithTimeModelAdapter())
    ..registerAdapter(NotificationEventHiveAdapter())
    ..registerAdapter(RoomModelAdapter());
    
  await Hive.openBox<RoomModel>(roomBox);


  runApp(MyApp());
}



//   Future<void> main() async {
//     WidgetsFlutterBinding.ensureInitialized();
//   await initializeService();
//     // await initializeService();
//     // Hive.initFlutter();
//     Directory directory = await getApplicationDocumentsDirectory();
//     Hive.init(directory.path);
    
//     Hive
//     ..registerAdapter(NotifWithTimeModelAdapter())
//     ..registerAdapter(NotificationEventHiveAdapter())
//     ..registerAdapter(RoomModelAdapter());

//     await Hive.openBox<RoomModel>(roomBox);

//   runApp( MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTHeme.lightTheme(),
      initialRoute: ScreenNames.introRoot,
      routes: routes,
      //home:  YourWidget(),
    );
  }
}






// // import 'dart:async';
// // import 'dart:io';
// // import 'dart:ui';

// // import 'package:device_info_plus/device_info_plus.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_background_service/flutter_background_service.dart';
// // import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // Future<void> main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await initializeService();
  
// //   // final service = FlutterBackgroundService();
// //   // var isRunning = await service.isRunning();
// //   // if (!isRunning) {
// //   //   service.startService();
// //   // }
  
// //   runApp(const MyApp());
// // }



Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  // final NotificationHistory notificationHistory = NotificationHistory();
  
  /// OPTIONAL, using custom notification channel id
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_foreground', // id
    'MY FOREGROUND SERVICE', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.low, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (Platform.isIOS || Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('ic_bg_service_small'),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
      
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,

      notificationChannelId: 'my_foreground',
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      //  onBackground: onIosBackground,
    ),
  );
}
 

//   /// OPTIONAL, using custom notification channel id
//   // const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   //   'my_foreground', // id
//   //   'MY FOREGROUND SERVICE', // title
//   //   description:
//   //       'This channel is used for important notifications.', // description
//   //   importance: Importance.low, // importance must be at low or higher level
//   // );

//   // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   //     FlutterLocalNotificationsPlugin();

//   // if (Platform.isIOS || Platform.isAndroid) {
//   //   await flutterLocalNotificationsPlugin.initialize(
//   //     const InitializationSettings(
//   //       iOS: DarwinInitializationSettings(),
//   //       android: AndroidInitializationSettings('ic_bg_service_small'),
//   //     ),
//   //   );
//   // }
// }
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       // this will be executed when app is in foreground or background in separated isolate
//       onStart: onStart,
//       // auto start service
//       autoStart: true,
//       isForegroundMode: true,
//       notificationChannelId: 'my_foreground',
//       initialNotificationTitle: 'l',
//       initialNotificationContent: 'Initializing',
//       foregroundServiceNotificationId: 888,
//     ),
//     iosConfiguration: IosConfiguration(
//       // auto start service
//       autoStart: true,

//       // this will be executed when app is in foreground in separated isolate
//       onForeground: onStart,

//       // you have to enable background fetch capability on xcode project
//       //onBackground: onIosBackground,
//     ),
//   );
// }

// // to ensure this is executed
// // run app from xcode, then from xcode menu, select Simulate Background Fetch

// // @pragma('vm:entry-point')
// // Future<bool> onIosBackground(ServiceInstance service) async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   DartPluginRegistrant.ensureInitialized();

// //   SharedPreferences preferences = await SharedPreferences.getInstance();
// //   await preferences.reload();
// //   final log = preferences.getStringList('log') ?? <String>[];
// //   log.add(DateTime.now().toIso8601String());
// //   await preferences.setStringList('log', log);

// //   return true;
// // }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   // Only available for flutter 3.0.0 and later
//   DartPluginRegistrant.ensureInitialized();

//   // For flutter prior to version 3.0.0
//   // We have to register the plugin manually

//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   await preferences.setString("hello", "world");

//   /// OPTIONAL when use custom notification
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   if (service is AndroidServiceInstance) {
//      service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });

//     // service.on('setAsForeground').listen((event) {
//     //   service.setAsForegroundService();
//     // });

//     // service.on('setAsBackground').listen((event) {
//     //   service.setAsBackgroundService();
//     // });
//   }

//   service.on('stopService').listen((event) {
//     service.stopSelf();
//   });

//   // bring to foreground
//   Timer.periodic(const Duration(seconds: 1), (timer) async {
//     if (service is AndroidServiceInstance) {
//       if (await service.isForegroundService()) {
//         /// OPTIONAL for use custom notification
//         /// the notification id must be equals with AndroidConfiguration when you call configure() method.
//         flutterLocalNotificationsPlugin.show(
          
//           888,
//           'COOL SERVICE',
//           'Awesome ${DateTime.now()}',
//           const NotificationDetails(
//             android: AndroidNotificationDetails(
//               'my_foreground',
//               'MY FOREGROUND SERVICE',
//               icon: 'ic_bg_service_small',
//               ongoing: true,
//             ),
//           ),
//         );

//         // if you don't using custom notification, uncomment this
//         service.setForegroundNotificationInfo(
//           title: "My App Service",
//           content: "Updated at ${DateTime.now()}",
//         );
//       }
//     }

//     /// you can see this log in logcat
//     print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

//     // test using external plugin
//     final deviceInfo = DeviceInfoPlugin();
//     String? device;
//     if (Platform.isAndroid) {
//       final androidInfo = await deviceInfo.androidInfo;
//       device = androidInfo.model;
//     }

//     if (Platform.isIOS) {
//       final iosInfo = await deviceInfo.iosInfo;
//       device = iosInfo.model;
//     }

//     service.invoke(
//       'update',
//       {
//         "current_date": DateTime.now().toIso8601String(),
//         "device": device,
//       },
//     );
//   });
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String text = "Stop Service";
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Service App'),
//         ),
//         body: Column(
//           children: [
//             StreamBuilder<Map<String, dynamic>?>(
//               stream: FlutterBackgroundService().on('update'),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) { 
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 final data = snapshot.data!;
//                 String? device = data["device"];
//                 DateTime? date = DateTime.tryParse(data["current_date"]);
//                 return Column(
//                   children: [
//                     Text(device ?? 'Unknown'),
//                     Text(date.toString()),
//                   ],
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: const Text("Foreground Mode"),
//               onPressed: () {
//                 FlutterBackgroundService().invoke("setAsForeground");
//               },
//             ),
//             ElevatedButton(
//               child: const Text("Background Mode"),
//               onPressed: () {
//                 FlutterBackgroundService().invoke("setAsBackground");
//               },
//             ),
      
//           ],
//         ),
       
//       ),
//     );
//   }
// }




























// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();
//   /// OPTIONAL, using custom notification channel id
//   const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'my_foreground', // id
//     'MY FOREGROUND SERVICE', // title
//     description:
//      'This channel is used for important notifications.', // description
//     importance: Importance.low, // importance must be at low or higher level
//   );
//   ///////////////////
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
// ///////////////////////

// ///////////////////////////////////////////////////
//   if (Platform.isIOS || Platform.isAndroid) {
//     await flutterLocalNotificationsPlugin.initialize(
//       const InitializationSettings(
//         iOS: DarwinInitializationSettings(),
//         android: AndroidInitializationSettings('ic_bg_service_small'),
//       ),
//     );
//   }
//     await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       // this will be executed when app is in foreground or background in separated isolate
//       onStart: onStart,

//       // auto start service
//       autoStart: true,
//       isForegroundMode: true,
//       notificationChannelId: 'my_foreground',
//       initialNotificationTitle: 'AWESOME SERVICE',
//       initialNotificationContent: 'Initializing',
//       foregroundServiceNotificationId: 888,
//     ),

//     iosConfiguration: IosConfiguration(
//       // auto start service
//       autoStart: true,

//       // this will be executed when app is in foreground in separated isolate
//       onForeground: onStart,

//       // you have to enable background fetch capability on xcode project
//       onBackground: onIosBackground,
//     ),
//   );
// }
//   @pragma('vm:entry-point')
// Future<bool> onIosBackground(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();

//   await Hive.initFlutter();
//   await Hive.openBox('log');

//   final logBox = Hive.box('log');
//   logBox.add(DateTime.now().toIso8601String());

//   return true;
// }
// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   // Only available for flutter 3.0.0 and later
//   DartPluginRegistrant.ensureInitialized();

//   // For flutter prior to version 3.0.0
//   // We have to register the plugin manually

//   // SharedPreferences preferences = await SharedPreferences.getInstance();
//   // await preferences.setString("hello", "world");

//   /// OPTIONAL when use custom notification
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   if (service is AndroidServiceInstance) {
//     service.on('setAsForeground').listen((event) {
//       service.setAsForegroundService();
//     });

//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }

//   service.on('stopService').listen((event) {
//     service.stopSelf();
//   });

//   //bring to foreground
//   Timer.periodic(const Duration(seconds: 1), (timer) async {
//     if (service is AndroidServiceInstance) {
//       if (await service.isForegroundService()) {
//         /// OPTIONAL for use custom notification
//         /// the notification id must be equals with AndroidConfiguration when you call configure() method.
//         flutterLocalNotificationsPlugin.show(
//           888,
//           'COOL SERVICE',
//           'Awesome ${DateTime.now()}',
//           const NotificationDetails(
//             android: AndroidNotificationDetails(
//               'my_foreground',
//               'MY FOREGROUND SERVICE',
//               icon: 'ic_bg_service_small',
//               ongoing: true,
//             ),
//           ),
//         );

//         // if you don't using custom notification, uncomment this
//         service.setForegroundNotificationInfo(
//           title: "My App Service",
//           content: "Updated at ${DateTime.now()}",
//         );
//       }
//     }

//     /// you can see this log in logcat
//     print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

//     // test using external plugin
//     final deviceInfo = DeviceInfoPlugin();
//     String? device;
//     if (Platform.isAndroid) {
//       final androidInfo = await deviceInfo.androidInfo;
//       device = androidInfo.model;
//     }

//     if (Platform.isIOS) {
//       final iosInfo = await deviceInfo.iosInfo;
//       device = iosInfo.model;
//     }

//     service.invoke(
//       'update',
//       {
//         "current_date": DateTime.now().toIso8601String(),
//         "device": device,
//       },
//     );
//   });
// }








// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initializeService();
//   runApp(const MyApp());
// }

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();

//   /// OPTIONAL, using custom notification channel id
//   const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'my_foreground', // id
//     'MY FOREGROUND SERVICE', // title
//     description:
//         'This channel is used for important notifications.', // description
//     importance: Importance.low, // importance must be at low or higher level
//   );




// /////////////////
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
// ///////////////////////

// ///////////////////////////////////////////////////
//   if (Platform.isIOS || Platform.isAndroid) {
//     await flutterLocalNotificationsPlugin.initialize(
//       const InitializationSettings(
//         iOS: DarwinInitializationSettings(),
//         android: AndroidInitializationSettings('ic_bg_service_small'),
//       ),
//     );
//   }
// //////////////////////////////////////////////////////
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       // this will be executed when app is in foreground or background in separated isolate
//       onStart: onStart,

//       // auto start service
//       autoStart: true,
//       isForegroundMode: true,
//       notificationChannelId: 'my_foreground',
//       initialNotificationTitle: "jjjj",
//       initialNotificationContent: roomBox,
//       foregroundServiceNotificationId: 888,
//     ),

//     iosConfiguration: IosConfiguration(
//       // auto start service
//       autoStart: true,

//       // this will be executed when app is in foreground in separated isolate
//       onForeground: onStart,

//       // you have to enable background fetch capability on xcode project
//       onBackground: onIosBackground,
//     ),
//   );
// }
// ///////////////////////////////////////////
// // to ensure this is executed
// // run app from xcode, then from xcode menu, select Simulate Background Fetch
// //////////////////////////////////////////////
// @pragma('vm:entry-point')
// Future<bool> onIosBackground(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();

//   await Hive.initFlutter();
//   await Hive.openBox('log');

//   final logBox = Hive.box('log');
//   logBox.add(DateTime.now().toIso8601String());

//   return true;
// }
// //////////////////////////////////////////

// // @pragma('vm:entry-point')
// // Future<bool> onIosBackground(ServiceInstance service) async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   DartPluginRegistrant.ensureInitialized();

// //   SharedPreferences preferences = await SharedPreferences.getInstance();
// //   await preferences.reload();
// //   final log = preferences.getStringList('log') ?? <String>[];
// //   log.add(DateTime.now().toIso8601String());
// //   await preferences.setStringList('log', log);
// //   return true;
// // }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   // Only available for flutter 3.0.0 and later
//   DartPluginRegistrant.ensureInitialized();

//   // For flutter prior to version 3.0.0
//   // We have to register the plugin manually

//   // SharedPreferences preferences = await SharedPreferences.getInstance();
//   // await preferences.setString("hello", "world");

//   /// OPTIONAL when use custom notification
//   // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   //     FlutterLocalNotificationsPlugin();

//   if (service is AndroidServiceInstance) {
//     service.on('setAsForeground').listen((event) {
//       service.setAsForegroundService();
//     });

//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }

//   service.on('stopService').listen((event) {
//     service.stopSelf();
//   });

//   // bring to foreground
//   // Timer.periodic(const Duration(seconds: 1), (timer) async {
//   //   if (service is AndroidServiceInstance) {
//   //     if (await service.isForegroundService()) {
//   //       /// OPTIONAL for use custom notification
//   //       /// the notification id must be equals with AndroidConfiguration when you call configure() method.
//   //       flutterLocalNotificationsPlugin.show(
//   //         888,
//   //         'COOL SERVICE',
//   //         'Awesome ${DateTime.now()}',
//   //         const NotificationDetails(
//   //           android: AndroidNotificationDetails(
//   //             'my_foreground',
//   //             'MY FOREGROUND SERVICE',
//   //             icon: 'ic_bg_service_small',
//   //             ongoing: true,
//   //           ),
//   //         ),
//   //       );

//   //       // if you don't using custom notification, uncomment this
//   //       service.setForegroundNotificationInfo(
//   //         title: "My App Service",
//   //         content: "Updated at ${DateTime.now()}",
//   //       );
//   //     }
//   //   }

//   //   /// you can see this log in logcat
//   //   print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

//   //   // test using external plugin
//   //   final deviceInfo = DeviceInfoPlugin();
//   //   String? device;
//   //   if (Platform.isAndroid) {
//   //     final androidInfo = await deviceInfo.androidInfo;
//   //     device = androidInfo.model;
//   //   }

//   //   if (Platform.isIOS) {
//   //     final iosInfo = await deviceInfo.iosInfo;
//   //     device = iosInfo.model;
//   //   }

//   //   service.invoke(
//   //     'update',
//   //     {
//   //       "current_date": DateTime.now().toIso8601String(),
//   //       "device": device,
//   //     },
//   //   );
//   // });
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String text = "Stop Service";
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Service App'),
//         ),
//         body: Column(
//           children: [
//             StreamBuilder<Map<String, dynamic>?>(
//               stream: FlutterBackgroundService().on('update'),
//               builder: (context, snapshot) {
              
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 final data = snapshot.data!;
//                 String? device = data["device"];
//                 DateTime? date = DateTime.tryParse(data["current_date"]);
//                 return Column(
//                   children: [
//                     Text(device ?? 'Unknown'),
//                     Text(date.toString()),
//                   ],
//                 );
//               },
//             ),
//             ElevatedButton(
//               child: const Text("Foreground Mode"),
//               onPressed: () {
//                 FlutterBackgroundService().invoke("setAsForeground");
//               },
//             ),
//             ElevatedButton(
//               child: const Text("Background Mode"),
//               onPressed: () {
//                 FlutterBackgroundService().invoke("setAsBackground");
//               },
//             ),
//             ElevatedButton(
//               child: Text(text),
//               onPressed: () async {
//                 final service = FlutterBackgroundService();
//                 var isRunning = await service.isRunning();

//                 if (isRunning) {
//                   service.invoke("stopService");
//                 } else {
//                   service.startService();
//                 }

//                 if (!isRunning) {
//                   text = 'Stop Service';
//                 } else {
//                   text = 'Start Service';
//                 }
//                 setState(() {});
//               },
//             ),
//             // const Expanded(
//             //   child: LogView(),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LogView extends StatefulWidget {
//   const LogView({Key? key}) : super(key: key);

//   @override
//   State<LogView> createState() => _LogViewState();
// }

// class _LogViewState extends State<LogView> {
//   late final Timer timer;
//   List<String> logs = [];

//   @override
//   void initState() {
//     super.initState();
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
//       final SharedPreferences sp = await SharedPreferences.getInstance();
//       await sp.reload();
//       logs = sp.getStringList('log') ?? [];
//       if (mounted) {
//         setState(() {});
//       }
//     });
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: logs.length,
//       itemBuilder: (context, index) {
//         final log = logs.elementAt(index);
//         return Text(log);
//       },
//     );
//   }
// }







