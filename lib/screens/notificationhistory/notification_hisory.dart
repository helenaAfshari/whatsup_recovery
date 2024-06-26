import 'dart:convert';
import 'dart:ui';
import 'package:WhatsUp/core/resource/constants/my_dimensions.dart';
import 'package:WhatsUp/screens/notificationhistory/details_notification_history_list.dart';
import 'package:WhatsUp/screens/widgets/appbar_custom_widget.dart';
import 'package:WhatsUp/screens/widgets/checked_vpn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:WhatsUp/core/resource/constants/my_colors.dart';
import 'package:WhatsUp/core/resource/constants/my_strings.dart';
import 'package:WhatsUp/domain/model/notif_event_hive/notif_event_hive.dart';
import 'package:WhatsUp/domain/model/service_whatsup_model.dart/service_whatsup_model.dart';
import 'package:WhatsUp/pressentation/blocs/notificationbloc/notification_history_bloc.dart';
import 'package:WhatsUp/pressentation/blocs/notificationbloc/notification_history_event.dart';
import 'package:WhatsUp/pressentation/blocs/notificationbloc/notification_history_state.dart';
import 'package:notification_listener_service/notification_listener_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_connection_detector/vpn_connection_detector.dart';

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {

  final List<RoomModel> rooms = [];

  SharedPreferences preferences = await SharedPreferences.getInstance();

  List<String>? roomsStr = await preferences.getStringList('rooms');

  if (roomsStr != null) {
    for (var roomStr in roomsStr) {
      rooms.add(RoomModel.fromJson(jsonDecode(roomStr) as Map<String, dynamic>));
    }
  }

  NotificationListenerService.notificationsStream.listen((eventPure) async {
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
  final stream = VpnConnectionDetector();
  late final SharedPreferences preferences;
  final rooms = <RoomModel>[];
  
  @override
  void initState() {
    super.initState();
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
      setState(() {});
      rooms.sort((a, b) => b.date.compareTo(a.date));
    });
  }

@override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadedEvent()),
      child: SafeArea(
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: MyColors.backgroundStatuseBarColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            backgroundColor: MyColors.backgroundNotificationColor,
            appBar:AppBarCustomWidget(
              showPopupMenu: true,
              size: size, text: MyStrings.notificationHistory, textStyle:  TextStyle(
                    color: MyColors.textAppBarColor,
                    fontSize: MyDimensions.medium,
                    fontWeight: FontWeight.bold,
                  ),),
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is LoadingHomeState) {
                  return CircularProgressIndicator(
                    color: Colors.blue,
                  );
                }
                if (state is LoadedHomeState) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: rooms.length,
                          itemBuilder: (BuildContext context, int index) {
                            final room = rooms.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                          create: (context) => HomeBloc(),
                                          child: DetailsNotificationHistoryList(
                                            room: room,
                                          ),
                                        )));
                              },
                              child: Container(
                                height: MyDimensions.xlarge + 35,
                                width: MyDimensions.xxlarge,
                                padding: EdgeInsets.all(MyDimensions.light + 2),
                                margin: EdgeInsets.all(MyDimensions.light + 2),
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/user_profile.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                MyDimensions.xlarge + 10)),
                                      ),
                                      height: MyDimensions.xlarge + 10,
                                      width: MyDimensions.xlarge + 10,
                                    ),
                                    SizedBox(width: MyDimensions.light + 2),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                            );
                          },
                        ),
                      ),
                      CheckedVpn(),
                    ],
                  );
                }
                return Container(
                  height: MyDimensions.xlarge + 10,
                  width: MyDimensions.xlarge + 10,
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



