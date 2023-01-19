import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/Auth/login_screen.dart';
import 'package:kelashakti/Views/dashboard/Tabs/activeTab.dart';
import 'package:kelashakti/Views/dashboard/Tabs/cancelTab.dart';
import 'package:kelashakti/Views/dashboard/Tabs/completeTab.dart';
import 'package:kelashakti/Views/dashboard/bottomNavbar.dart';
import 'package:kelashakti/Views/dashboard/side_navbar.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../Auth/enquire_screen.dart';
import '../Model/get_all_cancel.dart';
import '../Model/get_all_complete.dart';
import '../Model/get_all_enquiry.dart';
import '../Services/Shared_preferance.dart';
import '../Services/api_service.dart';

class DashboardActive extends StatefulWidget {
  const DashboardActive({Key? key}) : super(key: key);

  @override
  State<DashboardActive> createState() => _DashboardActiveState();
}

class _DashboardActiveState extends State<DashboardActive> with SingleTickerProviderStateMixin{
  List<GetAllActiveData> getAllActiveData = [];
  List<GetAllCancelData> getAllCancelData =[];
  List<GetAllCompleteData> getAllCompleteData = [];

  @override
  void initState() {
    super.initState();
    ApiService().active(context).then((value) {
      if(value!.message == "ok"){
        if( value.users!=null){
          setState(() {
            getAllActiveData = value.users!;
          });
        }

      }
    });

    ApiService().cancel(context).then((value) {
      if(value!.message == "ok"){
        setState(() {
          getAllCancelData = value.users!;
        });
      }
    });

    ApiService().complete(context).then((value) {
      if(value!.message == "ok"){
        setState(() {
          getAllCompleteData = value.users!;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            drawer: const SideNavBar(),
            appBar: AppBar(
              title: const Text("KelaShakti Traders"),
              backgroundColor: ColorUtils.blackColor,
            ),
            body: Column(
              children:  [
                Container(
                padding: EdgeInsets.only(top: 8,bottom: 8,left: 1,right: 1),
                  color: ColorUtils.skyBlueColor,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap:(){

                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavBar(2)));
                            },
                            child: Image.asset("assets/images/new_icon.png",scale: 4,)
                          ),
                           const SizedBox(
                             height: 4,
                           ),
                           Text("New",style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
                      ),

                      Column(
                        children:[
                          Stack(
                            clipBehavior:   Clip.none,
                            children: [
                              Image.asset("assets/images/active_icon.png",scale: 4,),
                              Positioned(
                                right: -8,
                                child: CircleAvatar(
                                  radius: 10.5,
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.black,
                                  child: Text('${getAllActiveData.length}',style: FontTextStyle.poppinsS14W4WhiteColor),
                                ), //CircularAvatar
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Active",style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset("assets/images/cancel_icon.png",scale: 4,),

                              Positioned(
                                right: -8,
                                child: CircleAvatar(
                                  radius: 10.5,
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.black,
                                  child: Text('${getAllCancelData.length}',style: FontTextStyle.poppinsS14W4WhiteColor),
                                ), //CircularAvatar
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Cancel",style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset("assets/images/complete_icon.png",scale: 4,),
                              Positioned(
                                right: -8,
                                child: CircleAvatar(
                                  radius: 10.5,
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.black,
                                  child: Text('${getAllCompleteData.length}',style: FontTextStyle.poppinsS14W4WhiteColor),
                                ), //CircularAvatar
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
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



