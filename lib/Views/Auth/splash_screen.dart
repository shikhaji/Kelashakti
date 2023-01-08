import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/Auth/login_screen.dart';
import 'package:kelashakti/Views/dashboard/bottomNavbar.dart';
import 'package:kelashakti/Views/dashboard/dashboard_Active_screen.dart';

import '../Services/Shared_preferance.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   getData();
  }

  Future getData() async{
    Future.delayed(Duration(seconds: 3)).then((value) async {
      String? userid = await Preferances.getString("userId");
      print("userId:=${userid}");
      if(userid != null){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const BottomNavBar()), (Route<dynamic> route) => false);
      }else {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const LoginScreen()), (Route<dynamic> route) => false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
            body: Center(child: Text("KelaShakti",style: FontTextStyle.poppinsS24W7PrimaryColor,)),
        )
    );
  }
}
