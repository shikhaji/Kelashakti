import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelashakti/Utils/color_utils.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/dashboard/alert_screen.dart';
import 'package:kelashakti/Views/dashboard/dashboard_Active_screen.dart';

import 'package:kelashakti/Views/dashboard/team_screen.dart';
import 'package:sizer/sizer.dart';

import '../Auth/enquire_screen.dart';
import 'Tabs/old_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int index;

const BottomNavBar(this.index, {Key? key}) : super(key: key);


  @override
  State<BottomNavBar> createState() => _BottomNavBarState();

}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  bool isMenuOpen = false;
 // int currentTab=0;
  final List<Widget> screen=[
   const DashboardActive(),
    const TeamScreen(),
    const EnquireScreen(),
    const AlertScreen(),
    const OldScreen(),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.index != 0) {
      _selectedIndex = widget.index;
    }
  }

  final PageStorageBucket bucket = PageStorageBucket() ;
  Widget currentScreen = const DashboardActive();



  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Container(
      color: ColorUtils.skyColor,

      child: WillPopScope(
        onWillPop: () async => showExitPopup(),
        child: Scaffold(
          body: screen.elementAt(_selectedIndex),
          // body: PageStorage(
          //   child: currentScreen,
          //   bucket: bucket,
          // ),

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
                        // setState(() {
                        //   currentScreen=const DashboardActive();
                        //   currentTab=0;
                        //
                        // });
                        setState(() {
                          _selectedIndex = 0;
                          isMenuOpen = false;
                        });
                      },
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dashboard,
                            color:  _selectedIndex == 0 ? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                          ),
                          Text("Dashboard",style: _selectedIndex == 0 ? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                        ],
                      ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      // setState(() {
                      //   currentScreen=const TeamScreen();
                      //   currentTab=1;
                      //
                      // });
                      setState(() {
                        _selectedIndex = 1;
                        isMenuOpen = false;
                      });
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people,
                          color: _selectedIndex== 1 ? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                        ),
                        Text("Team",style: _selectedIndex== 1 ? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                      ],
                    ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      // setState(() {
                      //   currentScreen=const EnquireScreen();
                      //   currentTab=2;
                      //
                      // });
                      setState(() {
                        _selectedIndex = 2;
                        isMenuOpen = false;
                      });
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: _selectedIndex== 2 ? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                        ),
                        Text("Add",style: _selectedIndex== 2 ? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                      ],
                    ),

                  ),

                  MaterialButton(
                      minWidth: 70,
                      onPressed: (){
                        // setState(() {
                        //   currentScreen=const AlertScreen();
                        //   currentTab=3;
                        //
                        // });
                        setState(() {
                          _selectedIndex = 3;
                          isMenuOpen = false;
                        });
                      },
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_alert_rounded,
                            color: _selectedIndex== 3? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                          ),
                          Text("Alert",style: _selectedIndex== 3? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                        ],
                      ),

                  ),
                  MaterialButton(
                    minWidth: 80,
                    onPressed: (){
                      // setState(() {
                      //   currentScreen=const OldScreen();
                      //   currentTab=4;
                      //
                      // });
                      setState(() {
                        _selectedIndex = 4;
                        isMenuOpen = false;
                      });
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history,
                          color: _selectedIndex== 4 ? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                        ),
                        Text("Old",style: _selectedIndex == 4 ? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                      ],
                    ),

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
      //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Do you want to exit an App?'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            //return false when click on "NO"
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            //return true when click on "Yes"
            child: const Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }
}
