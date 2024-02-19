
import 'package:flutter/material.dart';
import 'package:notif/sms_controller.dart';
import 'package:intl/intl.dart';
class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Reader"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(children: [
        SizedBox(height: 50,),
        ElevatedButton(onPressed: () {
          //smsControllerrrrr.requestForPermisionnnn();
        }, child: Text("ListenNotification")),
SizedBox(height: 20,),
Text("AllNotification"),
 Column(
 children: [
   Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    color: Colors.deepPurple.withOpacity(0.2),
    child: Column(
      children: [
        Row(
          children: [
          // Text("${element.packageName.split("com")}"),
        ],),
          Row(
          children: [
          // Text(element.content),
        ],) ,
         Row(
          children: [
         Text("lllll::::$formattedDateTime"),
    
          // print('Current date and time: $formattedDateTime'),
        ],),
    
      ],
    ),
  )
 ],
   
  
 )

      ],),
    );
  }
}

