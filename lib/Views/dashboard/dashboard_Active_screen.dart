import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/Auth/login_screen.dart';
import 'package:kelashakti/Views/dashboard/Tabs/activeTab.dart';
import 'package:kelashakti/Views/dashboard/Tabs/cancelTab.dart';
import 'package:kelashakti/Views/dashboard/Tabs/completeTab.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../Services/Shared_preferance.dart';

class DashboardActive extends StatefulWidget {
  const DashboardActive({Key? key}) : super(key: key);

  @override
  State<DashboardActive> createState() => _DashboardActiveState();
}

class _DashboardActiveState extends State<DashboardActive> with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.list),
              title: Text("KelaShakti"),
              actions: [
                IconButton(onPressed: (){
                  Preferances.removeStoredData("userId");
                  Preferances.removeStoredData("userToken");
                  Preferances.removeStoredData("userType");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                }, icon:Icon(Icons.logout))
              ],
              backgroundColor: ColorUtils.blackColor,
            ),
            body: Column(
              children:  [
                Container(

                  color: ColorUtils.skyBlueColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 10.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                color: ColorUtils.blackColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.people_outline,
                                color: ColorUtils.whiteColor,
                                size: 6.h,

                              ),
                            ),
                             Text("New",style: FontTextStyle.poppinsS18W4blackColor,)
                          ],
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 10.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                color: ColorUtils.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.list_alt_outlined,
                                color: ColorUtils.blackColor,
                                size: 6.h,

                              ),
                            ),
                            Text("Active",style: FontTextStyle.poppinsS18W4blackColor,)
                          ],
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 10.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                color: ColorUtils.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.cancel,
                                color: ColorUtils.blackColor,
                                size: 6.h,

                              ),
                            ),
                            Text("Cancel",style: FontTextStyle.poppinsS18W4blackColor,)
                          ],
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 10.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                color: ColorUtils.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.done,
                                color: ColorUtils.blackColor,
                                size: 6.h,

                              ),
                            ),
                            Text("Complete",style: FontTextStyle.poppinsS18W4blackColor,)
                          ],
                        ),

                      ),



                    ],
                  ),
                ),

                TabBar(

                    labelColor: ColorUtils.blackColor,
                    tabs: const [
                      Tab(
                        text: 'Active',
                      ),
                      Tab(
                        text: 'Cancel',
                      ),
                      Tab(
                        text: 'Complete',
                      )
                    ]),
                Expanded(
                  child: TabBarView(children: [
                    ActiveTab(),
                    CancelTab(),
                    CompleteTab(),
                  ]),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



