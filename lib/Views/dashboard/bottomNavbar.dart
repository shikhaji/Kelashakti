import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/color_utils.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/dashboard/alert_screen.dart';
import 'package:kelashakti/Views/dashboard/dashboard_Active_screen.dart';

import 'package:kelashakti/Views/dashboard/team_screen.dart';
import 'package:sizer/sizer.dart';

import '../Auth/enquire_screen.dart';
import 'Tabs/old_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);


  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentTab=0;
  final List<Widget> screen=[
   const DashboardActive(),
    const TeamScreen(),
    const EnquireScreen(),
    const AlertScreen(),
    const OldScreen(),
  ];



  final PageStorageBucket bucket = PageStorageBucket() ;
  Widget currentScreen = const DashboardActive();



  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Container(
      color: ColorUtils.skyColor,
      child: Scaffold(

        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),

        bottomNavigationBar: BottomAppBar(
          shape:const CircularNotchedRectangle(),
          notchMargin: 7,
          child: Container(

            height: 60,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen=const DashboardActive();
                        currentTab=0;

                      });
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab== 0 ? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                        ),
                        Text("Dashboard",style: currentTab== 0 ? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                      ],
                    ),

                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen=const TeamScreen();
                      currentTab=1;

                    });
                  },
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people,
                        color: currentTab== 1 ? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                      ),
                      Text("Team",style: currentTab== 1 ? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                    ],
                  ),

                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen=const EnquireScreen();
                      currentTab=2;

                    });
                  },
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: currentTab== 2 ? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                      ),
                      Text("Add",style: currentTab== 2 ? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                    ],
                  ),

                ),

                MaterialButton(
                    minWidth: 70,
                    onPressed: (){
                      setState(() {
                        currentScreen=const AlertScreen();
                        currentTab=3;

                      });
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_alert_rounded,
                          color: currentTab== 3? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                        ),
                        Text("Alert",style: currentTab== 3? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                      ],
                    ),

                ),
                MaterialButton(
                  minWidth: 80,
                  onPressed: (){
                    setState(() {
                      currentScreen=const OldScreen();
                      currentTab=4;

                    });
                  },
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history,
                        color: currentTab== 4 ? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                      ),
                      Text("Old",style: currentTab== 4 ? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                    ],
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
