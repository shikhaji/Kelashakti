import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../customeWidgets/custom_text_field.dart';
import '../customeWidgets/cutom_btn.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
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
                            SizedBox(height: 12.h,),
                            Icon(
                              Icons.lock,
                              color: ColorUtils.primaryColor,
                              size: 10.h,),
                            SizedBox(height: 2.h,),
                            Text("Enter Your Email, Phone or User Name and we'll send you the link to change new password",
                              style: FontTextStyle.poppinsS16W4blackColor,
                              textAlign: TextAlign.center,),
                            SizedBox(height: 4.h,),
                            CustomTextField(

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
                            CustomButton(
                              onTap: () {

                              },
                              buttonText: "Forgot Password",
                              height: 5.h,
                              textStyle: FontTextStyle.poppinsS16W7WhiteColor,
                            ),




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
}

