import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notif/core/resource/constants/my_colors.dart';
import 'package:notif/core/resource/constants/my_strings.dart';
import 'package:notif/domain/model/notif_event_hive/notif_event_hive.dart';
import 'package:notif/domain/model/service_whatsup_model.dart/service_whatsup_model.dart';
import 'package:notif/main.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_bloc.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_event.dart';
import 'package:notif/pressentation/blocs/notificationbloc/home_state.dart';
import 'package:notif/pressentation/screens/notificationhistory/details_notification_history_list.dart';
import 'package:notification_listener_service/notification_listener_service.dart';
import 'package:url_launcher/url_launcher.dart';

final box = Hive.box<RoomModel>(roomBox);

class NotificationHistory extends StatefulWidget {
  const NotificationHistory({super.key});

  @override
  State<NotificationHistory> createState() => _NotificationHistoryState();
}

class _NotificationHistoryState extends State<NotificationHistory> {
  String formattedDate = '';

  final rooms = <RoomModel>[];
  @override
  void initState() {
    super.initState();
    //اولویت قرار بگیره sort
    rooms
      ..addAll(box.values)
      ..sort((a, b) => b.date.compareTo(a.date));

    NotificationListenerService.notificationsStream.listen((eventPure) {
      //برای تبدیل اون کلاسی که میخواییم استفاده میشه  fromEntity
      final NotificationEventHive event =
          NotificationEventHive.fromEntity(eventPure);

      print("Current notification: $event");
      if (event.hasRemoved ?? false) {
        return;
      }

      if (!(event.packageName == 'com.whatsapp')) {
        return;
      }

      final msg = NotifWithTimeModel(DateTime.now(), event);

      if (msg.servicenotif.title == 'WhatsApp' ||
          RegExp(r'\d+ new message').hasMatch(msg.servicenotif.content!)) {
        return;
      }

      int rIndex = rooms.indexWhere((room) => room.name == event.title);

      setState(() {
        if (rIndex == -1) {
          final room = RoomModel(
              name: event.title ?? 'Unknown',
              date: DateTime.now(),
              lastMsg: msg,
              messages: [msg]);
          // new message from a new user
          rooms.add(room);
          box
              .add(room)
              .then((value) => print('new room saved successfully'))
              .catchError(print);
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
          rooms[rIndex]
              .save()
              .then((value) => print('new room saved successfully'))
              .catchError(print);
        }
      });
      rooms.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  if (state is LoadedHomeState) {
                    var selectedItem = '';
                    return Column(
                      children: [

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
                                            child:
                                                DetailsNotificationHistoryList(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            Text(
                                              room.lastMsg.servicenotif.title!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              room.lastMsg.servicenotif
                                                  .content!,
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
                      ],
                    );
                  }
                  return Container(
                    height: 50,
                    width: 50,
                    color: Colors.amber,
                  );
                },
              )),
        ),
      ),
    );
  }

  String formatDate(DateTime date) {
    return DateFormat('HH:mm:ss a').format(date);
  }
}
