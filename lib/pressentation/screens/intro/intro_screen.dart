import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:notif/core/components/customwidgets/custom_button.dart';
import 'package:notif/core/resource/constants/my_colors.dart';
import 'package:notif/core/resource/constants/my_strings.dart';
import 'package:notif/core/resource/constants/theme/my_theme.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    var sizee = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 48, 1),
      
      body: Center(
        child: Column(
          children: [
            Gap(250),
            Image.asset('assets/images/smartphone.png',),
            Gap(100),

    Text(MyStrings.hello,style: MyTHeme.lightTheme().textTheme.titleLarge!.
    copyWith(color: Colors.amber,fontSize: 30)),
    const Gap(10),
 Padding(
  padding: EdgeInsets.only(left: 50,right: 40),
  child:  Text("alows you to recover deleted message by reading youre Notification",
  style:  MyTHeme.lightTheme().textTheme.titleLarge!.copyWith(color: Colors.white,fontSize: 15),),
),

      Gap(size*.3/1.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomButtonWidget(
                  text: "Enable",
                  height: 40,
                  width: 90,
                color: Colors.white,
                onPress: () {
                  
                },),
                Gap(10),
                FittedBox(
                  child: Container(
                    height: 40,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                   child: Center(
                     child: IconButton(
                      icon: const Icon(Icons.arrow_right_alt_rounded,),
                      onPressed: () {
                       
                     },),
                   ),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
      
    ));
  }
}