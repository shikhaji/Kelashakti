import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/Auth/login_screen.dart';
import 'package:kelashakti/Views/dashboard/bottomNavBar2.dart';
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
      String? type = await Preferances.getString("userType");
      print("userId:=${userid}");
      if(userid != null){
        print(type);
        if(type=="1"){
          print("1 print");
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              BottomNavBar(0)), (Route<dynamic> route) => false);
        }else if(type=="2"){
          print("2 print");
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              BottomNavBar2()), (Route<dynamic> route) => false);
        }

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
            body: Center(child:Image.asset("assets/images/logo.png",scale: 5,)),
        )
    );
  }
}
