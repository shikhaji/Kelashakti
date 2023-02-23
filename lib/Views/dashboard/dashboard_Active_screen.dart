import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kelashakti/Views/dashboard/Tabs/activeTab.dart';
import 'package:kelashakti/Views/dashboard/Tabs/cancelTab.dart';
import 'package:kelashakti/Views/dashboard/Tabs/completeTab.dart';
import 'package:kelashakti/Views/dashboard/side_navbar.dart';


import '../../Utils/color_utils.dart';
import '../Model/get_all_cancel.dart';
import '../Model/get_all_complete.dart';
import '../Model/get_all_enquiry.dart';

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
              title: const Text("KST"),
              backgroundColor: ColorUtils.blackColor,
            ),
            body: Column(
              children:  [
                Container(
                padding: EdgeInsets.only(bottom: 8,left: 1,right: 1),
                  color: ColorUtils.skyBlueColor,
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



