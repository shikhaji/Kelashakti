import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/color_utils.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: ColorUtils.skyBlueColor,
        child: ListView(

          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(

                children: [
                  const SizedBox(height: 16,),
                  Divider(height: 2,
                    thickness: 2,

                    color: Colors.black,),
                  SizedBox(height: 16,),

                  buildMenuItem(
                    context,
                    text:"Privacy Policy",
                    icon:Icons.menu,
                  ),
                  const SizedBox(height: 16,),
                  Divider(height: 2,
                    thickness: 2,

                    color: Colors.black,),
                  const SizedBox(height: 16,),
                  buildMenuItem(
                    context,
                    text:"Logout",
                    icon:Icons.logout,),
                  const SizedBox(height: 16,),
                  Divider(height: 2,
                    thickness: 2,

                    color: Colors.black,),
                ],
              ),
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
        leading: Icon(icon,color: ColorUtils.primaryColor,),
        title: Text(text,style: FontTextStyle.poppinsS16W4PrimaryColor,),
        onTap: (){

        },
      ),
    );
  }
  }


