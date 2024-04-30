
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:notif/core/resource/constants/my_strings.dart';
import 'package:notif/pressentation/blocs/intro/intro_bloc.dart';
import 'package:notif/pressentation/blocs/intro/intro_event.dart';
import 'package:notif/pressentation/blocs/intro/intro_state.dart';
import 'package:notif/pressentation/route/screen_names.dart';
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
  void initState() {
    super.initState();
    Future.microtask(() => _checkPermission().then((granted) {
      if(granted){
 Navigator.pushReplacementNamed(context, ScreenNames.notificationHistoryScreen);
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
bool permissionShown = false;

 return BlocProvider<IntroBloc>(
    create: (context) => IntroBloc()..add(IntroLoadedEvent()), // BlocProvider اینجا قرار می‌گیرد
    child: Scaffold(
        backgroundColor: Color.fromARGB(255, 2, 56, 30),
      body: BlocBuilder<IntroBloc, IntroState>(
        builder: (context, state) {
          if (state is LoadingIntroState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoadedIntroState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Gap(50),
          Image.asset('assets/images/smartphone.png'),
           const SizedBox(height: 20),
                  // محتوای اصلی صفحه در اینجا نمایش داده می‌شود
                  const Text(MyStrings.hello,style: TextStyle(color: Colors.white),),
                   const SizedBox(height: 20),
                  // محتوای اصلی صفحه در اینجا نمایش داده می‌شود
                  const Text(MyStrings.whatsUpRecovery,style: TextStyle(color: Colors.white),),
             ElevatedButton(
  onPressed: () {

    // ارسال درخواست permission از طریق Bloc
    BlocProvider.of<IntroBloc>(context).add(AddPermisionEvent(state.f,));
   //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotificationHistory()));
   Navigator.pushReplacementNamed(context, ScreenNames.notificationHistoryScreen);

   
  },
  child: Text('Enable'),
),

                 
                ],
              ),
            );
          }
          return Container();
        },
      ),
    ),
  );
   }
}
