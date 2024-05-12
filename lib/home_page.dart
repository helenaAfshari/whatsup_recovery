import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:WhatsUp/sms_controller.dart';
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
    );
  }
}

