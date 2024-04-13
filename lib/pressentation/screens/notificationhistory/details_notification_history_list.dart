
import 'package:flutter/material.dart';
import 'package:notif/domain/model/service_whatsup_model.dart/model.dart';

class DetailsNotificationHistoryList extends StatelessWidget {

  final RoomModel? room;
  const DetailsNotificationHistoryList({super.key,required this.room});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: room == null ? Text('room required') :  ListView.builder(
        itemCount: room!.messages.length,
        itemBuilder: (context, index) {
        final msg = room!.messages[index];
        return ListTile(
          title: Text(msg.servicenotif.content ?? 'Withot content'),
        );
      },),
      /* body: Column(
        children: [
          // Expanded(
          //   child: ListView.builder(
          //     itemCount:notificationListDetails.length,
          //     shrinkWrap: true,
          //     itemBuilder:(context, index) {
          //     return Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Container(
          //         height: 50,
          //        width: 20,
          //         color: const Color.fromARGB(255, 181, 174, 155),
          //          child: Text(notificationListDetails[index].detailsText),
          //         //child: Text(notification.textUser),
                  
          //       ),
          //     );
          //   },
          //    ),
          // ),

          Padding(
            padding: const EdgeInsets.only(left:160,top: 20),
            child: Container(
              decoration: BoxDecoration(
                    color: Color.fromARGB(255, 176, 227, 215),
                borderRadius: BorderRadius.circular(10)),
              // width: 230,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child:
                  Text('${widget.service?.content ?? ""}'),
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
 */
    );
  }
}







// class DetailsNotificationHistoryList extends StatefulWidget {
//   final List<NotifWithTimeModel>? notificationListt;
//   final ServiceNotificationEvent? service;
//   final DateTime formattedDatee;

//   DetailsNotificationHistoryList({
//     required this.notificationListt,
//     required this.service,
//     required this.formattedDatee,
//   });

//   @override
//   State<DetailsNotificationHistoryList> createState() =>
//       _DetailsNotificationHistoryListState();
// }

// class _DetailsNotificationHistoryListState
//     extends State<DetailsNotificationHistoryList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: widget.notificationListt!.length,
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 final message = widget.notificationListt![index];
//                 // Assuming content is the user message
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 50,
//                     width: 20,
//                     color: const Color.fromARGB(255, 181, 174, 155),
//                     child: Text('${message.servicenotif.content ?? ""}'),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
