
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notif/core/resource/constants/my_strings.dart';
import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';
import 'package:notif/pressentation/blocs/detailsbloc/details_bloc.dart';
import 'package:notif/pressentation/blocs/detailsbloc/details_event.dart';
import 'package:notif/pressentation/blocs/detailsbloc/details_state.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class DetailsNotificationHistoryList extends StatefulWidget {
       List? notificationListt = <NotifWithTimeModel>[];
       
  final ServiceNotificationEvent? service;
  final int? indexx;
  //final DateTime time; // اضافه کردن پارامتر زمان

  String? time;
  final DateTime formattedDatee;
  DetailsNotificationHistoryList({this.indexx,this.service,this.notificationListt,required this.formattedDatee});

  @override
  State<DetailsNotificationHistoryList> createState() => _DetailsNotificationHistoryListState();
}

class _DetailsNotificationHistoryListState extends State<DetailsNotificationHistoryList> {
       List notificationListt = <NotifWithTimeModel>[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:160,top: 20),
            child: Container(
              decoration: BoxDecoration(
                    color: Color.fromARGB(255, 176, 227, 215),
                borderRadius: BorderRadius.circular(10)),
              width: 230,
        
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child:
                  Text(' ${widget.service?.content ?? ""}'),
                  
                    ),
                   
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 40),
                    //   child: Text("55"),
                    // ),
                  ],
                ),
     Padding(
       padding: const EdgeInsets.only(left: 90),
       child: Text('${DateFormat('HH:mm:ss a').format(widget.formattedDatee)}'),
     ),

              ],
            ),
          ),
          ),

//           Container(
//             height: 70,
//             width: 200,
//             color: Colors.amber,
//            child: Row(
//             children: [
//             Expanded(
//   child: Text(
//     "datahhhhhhhهههههههههههغغغغغغغغiiiiii5555uuuuuuuhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh",
//     overflow: TextOverflow.visible,
//     maxLines: 10,
//   ),
// ),

//               SizedBox(width: 10,),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Text("55"),
//               ),
//             ],
//            ),
//           ),
 Text('Content: ${widget.service?.content ?? ""}'),
           // Text('Index: ${widget.indexx ?? "No index available"}'),
            Text("hhh"),
           // Text('Formatted Date on Another Pagehhhhh: ${widget.formattedDatee}'),
            // Text('Formatted Date on Another Pagehhhhh: ${widget.formattedDatee}'),
       Text('Formatted Date on Another Pagehhhhh: ${DateFormat('HH:mm:ss a').format(widget.formattedDatee)}'),

        ],
      ),

    );
  }
}