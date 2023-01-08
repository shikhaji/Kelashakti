import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/Auth/login_screen.dart';
import 'package:kelashakti/Views/dashboard/Tabs/activeTab.dart';
import 'package:kelashakti/Views/dashboard/Tabs/cancelTab.dart';
import 'package:kelashakti/Views/dashboard/Tabs/completeTab.dart';
import 'package:kelashakti/Views/dashboard/bottomNavbar.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../Auth/enquire_screen.dart';
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
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  const LoginScreen()), (Route<dynamic> route) => false);
                }, icon:Icon(Icons.logout))
              ],
              backgroundColor: ColorUtils.blackColor,
            ),
            body: Column(
              children:  [
                Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 1),
                  color: ColorUtils.skyBlueColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnquireScreen()));
                            },
                            child: Image.asset("assets/images/new_icon.png",scale: 4,)
                          ),
                           SizedBox(
                             height: 4,
                           ),
                           Text("New",style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
                      ),
                      Column(
                        children: [

                          Stack(
                            children: [
                              GestureDetector(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnquireScreen()));
                                  },
                                  child: Image.asset("assets/images/active_icon.png",scale: 4,)
                              ),
                              Positioned.fill(child: Align(alignment: Alignment.topRight,
                                child:Container(
                                decoration: BoxDecoration(
                                  color: ColorUtils.whiteColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 1.0,
                                      spreadRadius: 0.5,

                                    )
                                  ]
                                ),
                                 child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text("2",style: FontTextStyle.poppinsS14W4blackColor,),
                               ),
                              ),))
                            ],
                          ),
                          Text("Active",style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnquireScreen()));
                                  },
                                  child: Image.asset("assets/images/cancel_icon.png",scale: 4,)
                              ),
                              Positioned.fill(child: Align(alignment: Alignment.topRight,
                                child:Container(

                                  decoration: BoxDecoration(
                                      color: ColorUtils.whiteColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 1.0,
                                          spreadRadius: 0.5,

                                        )
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("2",style: FontTextStyle.poppinsS14W4blackColor,),
                                  ),
                                ),))
                            ],
                          ),
                          Text("Cancel",style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnquireScreen()));
                                  },
                                  child: Image.asset("assets/images/complete_icon.png",scale: 4,)
                              ),
                              Positioned.fill(child: Align(alignment: Alignment.topRight,
                                child:Container(

                                  decoration: BoxDecoration(
                                      color: ColorUtils.whiteColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 1.0,
                                          spreadRadius: 0.5,

                                        )
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("2",style: FontTextStyle.poppinsS14W4blackColor,),
                                  ),
                                ),))
                            ],
                          ),
                          Text("Complete",style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
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
                const Expanded(
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



