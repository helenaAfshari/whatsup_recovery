
import 'package:WhatsUp/core/resource/constants/my_dimensions.dart';
import 'package:flutter/material.dart';
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
        SizedBox(height: MyDimensions.xlarge+10,),
        ElevatedButton(onPressed: () {
        }, child: Text("ListenNotification")),
SizedBox(height: MyDimensions.semiLarge-4,),
Text("AllNotification"),
 Column(
 children: [
   Container(
    padding: EdgeInsets.all(MyDimensions.light+2),
    margin: EdgeInsets.all(MyDimensions.light+2),
    color: Colors.deepPurple.withOpacity(0.2),
    child: Column(
      children: [
        Row(
          children: [
        ],),
          Row(
          children: [
          // Text(element.content),
        ],) ,
         Row(
          children: [
         Text("lllll::::$formattedDateTime"),
    
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

