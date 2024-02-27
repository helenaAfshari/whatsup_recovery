import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notif/core/components/customwidgets/custom_button.dart';
import 'package:notif/core/resource/constants/theme/my_theme.dart';
import 'package:notif/home_page.dart';
import 'package:notif/pressentation/blocs/intro/intro_bloc.dart';
import 'package:notif/pressentation/blocs/intro/intro_event.dart';
import 'package:notif/pressentation/blocs/intro/intro_state.dart';
import 'package:notif/pressentation/route/routes.dart';
import 'package:notif/pressentation/route/screen_names.dart';
import 'package:notif/pressentation/screens/notificationhistory/notification_hisory.dart';
import 'package:notif/pressentation/screens/home_page_screen.dart';
import 'package:notif/pressentation/screens/intro/intro_screen.dart';
import 'package:notification_listener_service/notification_listener_service.dart';


// void main() async {
//   await Hive.initFlutter();
//   await Hive.openBox('notifications');

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Save to Hive'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               final notificationsBox = await Hive.openBox('notifications');
//               String title = 'Notification Title';
//               notificationsBox.add(title);
//               print('Title added to Hive: $title');
//             },
//             child: Text('Save Title to Hive'),
//           ),
//         ),
//       ),
//     );
//   }
// }
void main() {
  runApp( MyApp());

}
// class MyApp extends StatelessWidget {
//   Completer<bool> completer = Completer<bool>();
//   // Completer<bool> completer = Completer<bool>();

// void checkPermission() async {
//   bool isPermissionGranted = await NotificationListenerService.isPermissionGranted();
//   completer.complete(isPermissionGranted);
// }

// void fetchData() async {
//   bool result = await false;
//   completer.complete(result);
// }
//   @override
//   Widget build(BuildContext context) {
//     return 
//       MaterialApp(
//         theme: MyTHeme.lightTheme(),
//         home: HomePage(),
//         // home:  SamplePageView(),
//         // initialRoute: ScreenNames.homeScreen,
//         // routes: routes,
//       );
    
//   }
// }
///555555555555555555555555555555555555555555555
class MyApp extends StatelessWidget {
    Completer<bool> completer = Completer<bool>();
  
//     void checkPermission() async {
//   bool isPermissionGranted = await NotificationListenerService.isPermissionGranted();
//   completer.complete(isPermissionGranted);
// }
  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      theme: MyTHeme.lightTheme(),
      initialRoute: ScreenNames.introRoot,
      routes: routes,
      //home: const IntroScreen(),
    );
  }
}

















/////55555555555555555555555555555555555555555555555
// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:notification_listener_service/notification_event.dart';
// import 'package:notification_listener_service/notification_listener_service.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   StreamSubscription<ServiceNotificationEvent>? _subscription;
//   List<ServiceNotificationEvent> events = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       onPressed: () async {
//                         final res = await NotificationListenerService
//                             .requestPermission();
//                         log("Is enabled: $res");
//                       },
//                       child: const Text("Request Permission"),
//                     ),
//                     const SizedBox(height: 20.0),
//                     TextButton(
//                       onPressed: () async {
//                         final bool res = await NotificationListenerService
//                             .isPermissionGranted();
//                         log("Is enabled: $res");
//                       },
//                       child: const Text("Check Permission"),
//                     ),
//                     const SizedBox(height: 20.0),
//                     TextButton(
//                       onPressed: () {
//                         _subscription = NotificationListenerService
//                             .notificationsStream
//                             .listen((event) {
//                           log("$event");
//                           setState(() {
//                             events.add(event);
//                           });
//                         });
//                       },
//                       child: const Text("Start Stream"),
//                     ),
//                     const SizedBox(height: 20.0),
//                     TextButton(
//                       onPressed: () {
//                         _subscription?.cancel();
//                       },
//                       child: const Text("Stop Stream"),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: events.length,
//                   itemBuilder: (_, index) => Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: ListTile(
//                       onTap: () async {
//                         try {
//                           await events[index]
//                               .sendReply("This is an auto response");
//                         } catch (e) {
//                           log(e.toString());
//                         }
//                       },
//                       trailing: events[index].hasRemoved!
//                           ? const Text(
//                               "Removed",
//                               style: TextStyle(color: Colors.red),
//                             )
//                           : const SizedBox.shrink(),
//                       leading: events[index].appIcon == null
//                           ? const SizedBox.shrink()
//                           : Image.memory(
//                               events[index].appIcon!,
//                               width: 35.0,
//                               height: 35.0,
//                             ),
//                       title: Text(events[index].title ?? "No title"),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             events[index].content ?? "no content",
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(height: 8.0),
//                           events[index].canReply!
//                               ? const Text(
//                                   "Replied with: This is an auto reply",
//                                   style: TextStyle(color: Colors.purple),
//                                 )
//                               : const SizedBox.shrink(),
//                           events[index].largeIcon != null
//                               ? Image.memory(
//                                   events[index].largeIcon!,
//                                 )
//                               : const SizedBox.shrink(),
//                         ],
//                       ),
//                       isThreeLine: true,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }