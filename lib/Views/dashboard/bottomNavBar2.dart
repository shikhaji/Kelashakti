import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelashakti/Views/dashboard/accept.dart';
import 'package:kelashakti/Views/dashboard/submited.dart';
import 'package:kelashakti/Views/dashboard/visited.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';


class BottomNavBar2 extends StatefulWidget {
  const BottomNavBar2({Key? key}) : super(key: key);

  @override
  State<BottomNavBar2> createState() => _BottomNavBar2State();
}

class _BottomNavBar2State extends State<BottomNavBar2> {

  int currentTab=0;
  final List<Widget> screen=[
    const Accept(),
    const Visited(),
    const Submited(),

  ];


  final PageStorageBucket bucket = PageStorageBucket() ;
  Widget currentScreen = const Accept();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.skyColor,

      child: WillPopScope(
        onWillPop: () async => showExitPopup(),
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
                        currentScreen=const Accept();
                        currentTab=0;

                      });

                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard_outlined,
                          color:  currentTab == 0 ? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                        ),
                        Text("Accepted",style: currentTab == 0 ? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                      ],
                    ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen=const Visited();
                        currentTab=1;

                      });
                      setState(() {
                        currentTab = 1;

                      });
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people,
                          color: currentTab== 1 ? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                        ),
                        Text("Visited",style: currentTab== 1 ? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
                      ],
                    ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen=const Submited();
                        currentTab=2;

                      });
                      setState(() {
                        currentTab = 2;

                      });
                    },
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_done_rounded,
                          color: currentTab== 2 ? ColorUtils.primaryColor: ColorUtils.lightGreyColor,
                        ),
                        Text("Submited",style: currentTab== 2 ? FontTextStyle.poppinsS14W4PrimaryColor : FontTextStyle.poppinsS14W4GreyColor,)
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
