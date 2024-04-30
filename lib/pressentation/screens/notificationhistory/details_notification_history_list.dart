
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notif/domain/model/service_whatsup_model.dart/service_whatsup_model.dart';

class DetailsNotificationHistoryList extends StatelessWidget {
  final RoomModel? room;
  const DetailsNotificationHistoryList({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(room!.lastMsg.servicenotif.title.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pop(),
  ),
        backgroundColor: Colors.white,

      ),
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/background.png"),
          ),
        ),
        child: ListView.builder(
            reverse: false, // اینجا برای معکوس کردن لیست استفاده می‌شود
            itemCount: room?.messages.length,
            itemBuilder: (context, index) {
              final chat = room!.messages[index];
// return ListTile(
//   title: Text(chat.servicenotif.content ?? ''),
// );
return 
Align(
     alignment: Alignment.centerRight,
     child: Padding(
      padding: const EdgeInsets.only(left: 100, right: 10,bottom: 12),
      child: Card(
        color: Color.fromARGB(255, 209, 243, 226),
        elevation: 8,
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 8),
                child: Text(
                  chat.servicenotif.content.toString(),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
             
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    DateFormat('HH:mm:ss a').format(chat.date),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,)
            ],
          ),
        ),
      ),
     ),
   );

            }),
      ),
    );
  }
}