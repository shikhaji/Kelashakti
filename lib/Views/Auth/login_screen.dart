import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/Services/api_service.dart';
import 'package:kelashakti/Views/dashboard/bottomNavbar.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../customeWidgets/custom_text_field.dart';
import '../customeWidgets/cutom_btn.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // void login(String phone, password,) async {
  //   try{
  //     Response response = await post(
  //         Uri.parse('https://tinkubhaiya.provisioningtech.com/get_ajax/login/'),
  //       headers: {
  //         'Client-Service': 'frontend-client',
  //         'Auth-Key' : 'simplerestapi',
  //       },
  //       body: {
  //           'user_id': phone,
  //         'password': password
  //       }
  //     );
  //     if(response.statusCode == 200){
  //       var data = jsonDecode(response.body.toString());
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
  //       print(data);
  //       print('login successfully');
  //     }else{
  //       print('Invalid Details');
  //     }
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(
            body: Container(
              color: ColorUtils.skyColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 7.h,),
                      Container(
                        child:Text("KelaShakti", style: FontTextStyle.poppinsS26W7WhiteColor,),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w,),
                        child: Column(
                          children: [
                            SizedBox(height: 22.h,),
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
                            GestureDetector(
                              child: CustomButton(
                                onTap: () {
                                  //login(phoneController.text.toString(),passwordController.text.toString());
                                  ApiService().login(context,data: data()).then((value) => {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()))
                                  });

                                },
                                buttonText: "Log in",
                                height: 5.h,
                                textStyle: FontTextStyle.poppinsS16W7WhiteColor,
                              ),
                            ),
                            SizedBox(height: 1.5.h,),
                            Text("Forgot Password?", style: FontTextStyle.poppinsS14W4blackColor,)


                          ],
                        ),
                      )


                    ],
                  ),
                ),
              ),
            )
        ),

      ),
    );
  }
  FormData data() {
    return FormData.fromMap({"user_id": phoneController.text.trim(),"password":passwordController.text.trim()});
  }
}
