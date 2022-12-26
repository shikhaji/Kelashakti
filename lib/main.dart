import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Views/Auth/enquire_screen.dart';
import 'package:sizer/sizer.dart';

import 'Views/Auth/forgotPassword_screen.dart';
import 'Views/Auth/login_screen.dart';
import 'Views/dashboard/bottomNavbar.dart';
import 'Views/dashboard/dashboard_Active_screen.dart';

import 'Views/dashboard/team_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return Sizer(
        builder: (context, orientation, deviceType){
          return
           const MaterialApp(
            debugShowCheckedModeBanner: false,
            //home: TeamScreen(),
            home: LoginScreen(),
            //home: BottomNavBar(),
           // home: EnquireScreen(),


          );
        }

    );
  }
}

