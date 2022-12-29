import 'dart:convert';

//import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kelashakti/Views/Services/api_service.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../Services/Shared_preferance.dart';
import '../customeWidgets/custom_text_field.dart';
import '../customeWidgets/cutom_btn.dart';
import 'bottomNavbar.dart';
class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();

}

class _TeamScreenState extends State<TeamScreen> {
  TextEditingController nameController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  // void add() async {
  //     try{
  //       String? userid = await Preferances.getString("userId");
  //       String? token = await Preferances.getString("userToken");
  //       String? type = await Preferances.getString("userType");
  //         Response response = await post(
  //
  //           Uri.parse('https://tinkubhaiya.provisioningtech.com/post_ajax/add_account/'),
  //
  //         headers: {
  //           'Client-Service': 'frontend-client',
  //           'Auth-Key' : 'simplerestapi',
  //           "User-ID":userid.toString(),
  //           "Authorization":token.toString(),
  //           "type":type.toString(),
  //         },
  //         body: {
  //             'name' : nameController.text,
  //             'phone': phoneController.text,
  //           'password': phoneController.text,
  //         }
  //       );
  //       if(response.statusCode == 200){
  //         var data = jsonDecode(response.body.toString());
  //         Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
  //         print(data);
  //         print('login successfully');
  //       }else{
  //         print('Invalid Details');
  //         print('error${response.statusCode}');
  //         print('error${response.body}');
  //
  //       }
  //     }catch(e){
  //       print(e.toString());
  //     }
  //   }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.list),
              title: Text("KelaShakti"),
              backgroundColor: ColorUtils.blackColor,
            ),
            body: Container(
              height: double.maxFinite,
              color: ColorUtils.skyBlueColor,
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 7.h,),
                        Text("Team", style: FontTextStyle.poppinsS24W7PrimaryColor,),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w,),
                          child: Column(
                            children: [
                              SizedBox(height: 18.h,),
                              CustomTextField(
                                fieldController: nameController,

                                fieldName: "Name",
                                hintName: " Name",
                                keyboard: TextInputType.visiblePassword,
                                maxLines: 1,
                                textInputAction:TextInputAction.done,
                                validator: (str) {
                                  if (str!.isEmpty) {

                                    return '* Is Required';

                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 2.h,),
                              CustomTextField(
                                fieldController: phoneController,
                                fieldName: "Phone Number",
                                hintName: " Phone Number",
                                keyboard: TextInputType.phone,
                                maxLines: 1,
                                textInputAction:TextInputAction.done,
                                validator: (str) {
                                  if (str!.isEmpty) {

                                    return '* Is Required';

                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 2.h,),

                              CustomTextField(
                                fieldController: passwordController,
                                fieldName: "Password",
                                hintName: " Password",
                                keyboard: TextInputType.visiblePassword,
                                maxLines: 1,
                                textInputAction:TextInputAction.done,
                                validator: (str) {
                                  if (str!.isEmpty) {

                                    return '* Is Required';

                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 2.h,),
                              CustomButton(
                                onTap: () {
                                  print("name:= ${nameController.text.trim()}");
                                  print("phone:= ${phoneController.text.trim()}");
                                  print("name:= ${passwordController.text.trim()}");
                                  Map<String,dynamic> data = {
                                    "name": nameController.text.trim(),"phone" : phoneController.text.trim(),"password":passwordController.text.trim()
                                  };
                                 ApiService().addAccount(context,data: data);

                                },
                                buttonText: "Click To Add",
                                height: 5.h,
                                textStyle: FontTextStyle.poppinsS16W7WhiteColor,
                              ),
                              SizedBox(height: 1.5.h,),



                            ],
                          ),
                        )


                      ],
                    ),
                  ),
                ),
              ),
            )
        ),

      ),
    );
  }




}



