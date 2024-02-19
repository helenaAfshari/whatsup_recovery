import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:notif/core/components/customwidgets/custom_button.dart';
import 'package:notif/core/resource/constants/my_colors.dart';
import 'package:notif/core/resource/constants/my_strings.dart';
import 'package:notif/core/resource/constants/theme/my_theme.dart';
import 'package:notif/pressentation/blocs/intro/intro_bloc.dart';
import 'package:notif/pressentation/blocs/intro/intro_event.dart';
import 'package:notif/pressentation/blocs/intro/intro_state.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  

  Future<bool> _checkPermission() async {
  bool isPermissionGranted = await NotificationListenerService.isPermissionGranted();
  return isPermissionGranted;
}

  @override
  Widget build(BuildContext context) {
 

  return
Scaffold(
  body:
  BlocBuilder<IntroBloc,IntroState>(
    builder: (context, state) {
   if(state is LoadingIntroState){
    return Center(child: CircularProgressIndicator(),);
   }
    if(state is LoadedIntroState){
      return 
      Center(
    child: GestureDetector(
      onTap: () {
       
        BlocProvider.of<IntroBloc>(context).add(IntroLoadedEvent(state.f));
         NotificationListenerService.isPermissionGranted();
        print("jjjkkk");
      },
      child: Container(
      height: 50,
      width: 50,
      color: Colors.amber,
      
      ),
    ));
    }
    return Container();
  },)
);

//     return
//        Scaffold(
//          // backgroundColor: Colors.amber,
//           body:
//           BlocBuilder<IntroCubit, IntroState>(
//   builder: (context, state) {
//     if (state is LoadingIntroState) {
//       return Center(child: CircularProgressIndicator());
//     } else  {
//       return ListView(
//         children: [
//           SizedBox(height: 50),
//         ElevatedButton(
//       onPressed: _buttonEnabled
//           ? () {
//               setState(() {
//                 _buttonEnabled = false; // غیرفعال کردن دکمه بعد از کلیک
//               });
//               BlocProvider.of<IntroCubit>(context).requestForPermission();
//               print("Enabled clicked");
//             }
//           : null, // اگر دکمه غیرفعال باشد، onPressed باید null باشد
//       child: Text("Request Notification"),
//     ),
//   ElevatedButton(
//   onPressed: () {
//     BlocProvider.of<IntroCubit>(context).listenForNotifications();
//     print("kkkk");
//     setState(() {
//       _notificationsListVisible = true;
//     });
//   }, 
//   child: Text("kkk")
// ),
//     //       ElevatedButton(
//     //   onPressed:
//     //      () {
              
//     //           BlocProvider.of<IntroCubit>(context).listenForNotifications();
//     //           print("Listener clicked");
//     //         }
//     //       : null, // اگر دکمه غیرفعال باشد، onPressed باید null باشد
//     //   child: Text("Listen Notification"),
//     // ),
//           SizedBox(height: 20),
//           Text("All Notifications"),
//           Column(
//             children: introCubit.h
//               .map((element) => Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.all(10),
//                 color: Colors.deepPurple.withOpacity(0.2),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text("${element.packageName!.split("com")}"),
//                       ],
//                     ),
//                        Row(
//                       children: [
//                         Text("مممممم"),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text(element.content.toString()),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         //Text("lllll::::$formattedDateTime"),
//                         // print('Current date and time: $formattedDateTime'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ))
//               .toList(),
//           ),
//         ],
//       );
//     }
//     return Container();
//   },
// )
//         );
































//     Scaffold(
//           backgroundColor: Colors.amber,
//           body: BlocConsumer<IntroCubit, IntroState>(
//             builder: (context, state) {
//                  if (state is LoadingIntroState) {
//       return Center(child: CircularProgressIndicator());
//     } else {
//       return ListView(
//         children: [
//           SizedBox(height: 50),
//           ElevatedButton(
//             onPressed: () {
//                     BlocProvider.of<IntroCubit>(context).requestForPermission();
//                        print("Enabled clicked");
//             }, 
//             child: Text("Listen Notification")
//           ),
//           SizedBox(height: 20),
//           Text("All Notifications"),
//      Column(
//   children: jh.h
//   .map((element) => Container(
//     padding: EdgeInsets.all(10),
//     margin: EdgeInsets.all(10),
//     color: Colors.deepPurple.withOpacity(0.2),
//     child: Column(
//       children: [
//         Row(
//           children: [
//            Text("${element.packageName!.split("com")}"),
//         ],),
//           Row(
//           children: [
//            Text(element.content.toString()),
//         ],) ,
//          Row(
//           children: [
//          //Text("lllll::::$formattedDateTime"),
    
//           // print('Current date and time: $formattedDateTime'),
//         ],),
    
//       ],
//     ),
//   ))
//   .toList(),
// )
//           ]);
        
    
//     }
         
//             },
//             listener: (context, state) {
//               if (state is LoadedIntroState) {
//                 print("LoadedState:::");
// //                 ListView(
// //         children: [
// //           SizedBox(height: 50),
// //           ElevatedButton(
// //             onPressed: () {
// //                     BlocProvider.of<IntroCubit>(context).requestForPermission();
// //                        print("Enabled clicked");
// //             }, 
// //             child: Text("Listen Notification")
// //           ),
// //           SizedBox(height: 20),
// //           Text("All Notifications"),
// //      Column(
// //   children: jh.h
// //   .map((element) => Container(
// //     padding: EdgeInsets.all(10),
// //     margin: EdgeInsets.all(10),
// //     color: Colors.deepPurple.withOpacity(0.2),
// //     child: Column(
// //       children: [
// //         Row(
// //           children: [
// //            Text("${element.packageName!.split("com")}"),
// //         ],),
// //           Row(
// //           children: [
// //            Text(element.content.toString()),
// //         ],) ,
// //          Row(
// //           children: [
// //          //Text("lllll::::$formattedDateTime"),
    
// //           // print('Current date and time: $formattedDateTime'),
// //         ],),
    
// //       ],
// //     ),
// //   ))
// //   .toList(),
// // )
// //           ]);
//               }
//               else if(state is ErrorIntroState){
//                 print("ErrorIntroState");
//               }
//             },
//           ),
//         );
//     return SafeArea(child: Scaffold(
//       backgroundColor: Color.fromARGB(255, 26, 48, 1),
      
//       body: Center(
//         child: Column(
//           children: [
//             Gap(250),
//             Image.asset('assets/images/smartphone.png',),
//             Gap(100),

//     Text(MyStrings.hello,style: MyTHeme.lightTheme().textTheme.titleLarge!.
//     copyWith(color: Colors.amber,fontSize: 30)),
//     const Gap(10),
//  Padding(
//   padding: EdgeInsets.only(left: 50,right: 40),
//   child:  Text("alows you to recover deleted message by reading youre Notification",
//   style:  MyTHeme.lightTheme().textTheme.titleLarge!.copyWith(color: Colors.white,fontSize: 15),),
// ),

//       Gap(size*.3/1.2),
//             Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//              BlocConsumer(
//               builder: (context, state) {
//              if (state is LoadingIntroState) {
//                return Center(child: CircularProgressIndicator(),);
//              } 
//                // return 
//               //   CustomButtonWidget(
//               //    text: "Enable",
//               //    height: 40,
//               //    width: 90,
//               //  color: Colors.white,
//               //  onPress: () {
//               //    print("Enabled clicked");
//               //  },);
//                 return 
//                 CustomButtonWidget(
//                  text: "Enable",
//                  height: 40,
//                  width: 90,
//                color: Colors.white,
//                onPress: () {
//                  print("Enabled clicked");
//                },);
//               },
//               listener: (context, state) {
//                 if (state is LoadedIntroState) {
//                   return print("LoadedState:::");
//                 } else {
                  
//                 }
//               },
            
//              ),
//              const Gap(10),
//              FittedBox(
//                child: Container(
//                  height: 40,
//                  width: 50,
//                  decoration: const BoxDecoration(
//                    color: Colors.amber,
//                    borderRadius: BorderRadius.all(Radius.circular(5)),
//                  ),
//                 child: Center(
//                   child: IconButton(
//                    icon: const Icon(Icons.arrow_right_alt_rounded,),
//                    onPressed: () {
                  
//                   },),
//                 ),
//                ),
//              )
//                 ],
//               ),

//           ],
//         ),
//       ),
      
//     ));
  }
}