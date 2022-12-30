import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Views/Auth/enquire_screen.dart';
import 'package:sizer/sizer.dart';

import 'Utils/scrren_utils.dart';
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
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.system,
              home: const LoginScreen(),
              builder: (context, child) {
                return ScrollConfiguration(  behavior: const _ScrollBehaviorModified(),
                child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                  ScreenUtil.init(constraints,
                      designSize:
                      Size(constraints.maxWidth, constraints.maxHeight));
                  child = botToastBuilder(context, child);
                  return child ?? const SizedBox.shrink();
                },

                ),

                );
              }
              );
          //  const MaterialApp(
          //   debugShowCheckedModeBanner: false,
          //   //home: TeamScreen(),
          //   home: LoginScreen(),
          //   //home: BottomNavBar(),
          //  // home: EnquireScreen(),
          //
          //
          // );

        }

    );
  }
}

  class _ScrollBehaviorModified extends ScrollBehavior {
  const _ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
  switch (getPlatform(context)) {
  case TargetPlatform.iOS:
  case TargetPlatform.macOS:
  case TargetPlatform.android:
  case TargetPlatform.fuchsia:
  case TargetPlatform.linux:
  case TargetPlatform.windows:
  return const ClampingScrollPhysics();
  }
  }
  }


