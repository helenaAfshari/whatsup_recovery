import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:notif/sms_controller.dart';
import 'package:intl/intl.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    SmsController smsControllerrrrr = Get.put(SmsController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 56, 30),
      appBar: AppBar(
        title: Text("Notification Reader"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Gap(50),
          Image.asset('assets/images/smartphone.png'),
          ElevatedButton(onPressed: () {
          smsControllerrrrr.requestForPermisionnnn();
        }, child: Text("ListenNotification")),

        ],
      )

//       ListView(children: [
//         SizedBox(height: 50,),
//         ElevatedButton(onPressed: () {
//           smsControllerrrrr.requestForPermisionnnn();
//         }, child: Text("ListenNotification")),
// SizedBox(height: 20,),
// // Text("AllNotification"),
     

// // Obx(() => Column(
// //   children: smsControllerrrrr.notificationListt.value
// //   .map((element) => Container(
// //     padding: EdgeInsets.all(10),
// //     margin: EdgeInsets.all(10),
// //     color: Colors.deepPurple.withOpacity(0.2),
// //     child: Column(
// //       children: [
// //         Row(
// //           children: [
// //            Text("${element.packageName.split("com")}"),
// //         ],),
// //           Row(
// //           children: [
// //            Text(element.content),
// //         ],) ,
// //          Row(
// //           children: [
// //          Text("lllll::::$formattedDateTime"),
    
// //           // print('Current date and time: $formattedDateTime'),
// //         ],),
    
// //       ],
// //     ),
// //   ))
// //   .toList(),
// // )
// //)

//       ],),
    );
  }
}

