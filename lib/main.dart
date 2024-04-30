import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notif/core/resource/constants/theme/my_theme.dart';
import 'package:notif/domain/model/notif_event_hive/notif_event_hive.dart';
import 'package:notif/domain/model/service_whatsup_model.dart/service_whatsup_model.dart';
import 'package:notif/pressentation/route/routes.dart';
import 'package:notif/pressentation/route/screen_names.dart';
import 'package:path_provider/path_provider.dart';

 String roomBox =  'room_box';

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Hive.initFlutter();
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    
    Hive
    ..registerAdapter(NotifWithTimeModelAdapter())
    ..registerAdapter(NotificationEventHiveAdapter())
    ..registerAdapter(RoomModelAdapter());

    await Hive.openBox<RoomModel>(roomBox);
    
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
    Completer<bool> completer = Completer<bool>();
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







