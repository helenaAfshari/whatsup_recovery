
import 'dart:io';
import 'dart:async';
import 'package:WhatsUp/pressentation/screens/notificationhistory/notification_hisory.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
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
import 'firebase_options.dart';

String roomBox =  'room_box';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
      SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(MyApp());
}

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
      isForegroundMode: false,
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
























