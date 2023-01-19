import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/color_utils.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/dashboard/bottomNavBar2.dart';
import 'package:kelashakti/Views/dashboard/team_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../Auth/login_screen.dart';
import '../Model/team_list_model.dart';
import '../Services/Shared_preferance.dart';
import 'bottomNavbar.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  var id=Preferances.getString("userId");
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: ColorUtils.skyBlueColor,
        child: ListView(

          children: <Widget>[
            const SizedBox(height: 24,),
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("assets/images/logo.png",scale: 10,),
                    ),
                    SizedBox(height: 20,),
                    const Divider(height: 2, thickness: 1, color: Colors.grey,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10,left: 25,right: 25),
                  child: Column(
                    children: [

                      const SizedBox(height: 8,),
                      buildMenuItem(
                        context,
                        text:"Home",
                        icon:Icons.home,
                      ),
                      const SizedBox(height: 8,),
                      buildMenuItem(
                        context,
                        text:"Team",
                        icon:Icons.people,
                      ),
                      const SizedBox(height: 8,),
                      buildMenuItem(
                        context,
                        text:"Add Lead",
                        icon:Icons.add,
                      ),

                      const SizedBox(height: 8,),
                      buildMenuItem(
                        context,
                        text:"Old",
                        icon:Icons.history,
                      ),
                      const SizedBox(height: 8,),
                      buildMenuItem(
                        context,
                        text:"Team List",
                        icon:Icons.history,
                      ),


                      const SizedBox(height: 8,),
                      buildMenuItem(
                        context,
                        text:"Privacy Policy",
                        icon:Icons.menu,
                      ),

                      const SizedBox(height: 8,),
                      buildMenuItem(
                        context,
                        text:"Logout",
                        icon:Icons.logout,),

                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),

    );

  }

  buildMenuItem(BuildContext context, {required String text, required IconData icon}) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: Icon(icon,color: ColorUtils.primaryColor,size: 25,),
        title: Text(text,style: FontTextStyle.poppinsS16W4PrimaryColor,),
        onTap: (){
          if(text=="Team List"){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                TeamListScreen()));
          }
          if(text=="Logout") {
            showDialog(
              context: context,
              builder: (ctx) =>
                  AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are You Sure ?"),
                    actions: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(14),
                              child: const Text("Cancel"),
                            ),
                          ),
                          TextButton(
                            onPressed: ()async {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.clear();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) =>
                                  const LoginScreen()), (
                                  Route<dynamic> route) => false);
                            },
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(14),
                              child: const Text("okay"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
            );
          }
            if(text=="Home"){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavBar(0)));
            }
            if(text=="Team"){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavBar(1)));
            }
            if(text=="Add Lead"){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavBar(2)));
            }
            if(text=="Old"){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavBar(4)));
            }

          }

      ),
    );
  }
  }


