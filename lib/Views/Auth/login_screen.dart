import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/Services/api_service.dart';
import 'package:kelashakti/Views/dashboard/bottomNavbar.dart';
import 'package:sizer/sizer.dart';
import '../../Utils/color_utils.dart';
import '../Services/Shared_preferance.dart';
import '../customeWidgets/custom_text_field.dart';
import '../customeWidgets/cutom_btn.dart';
import '../dashboard/bottomNavBar2.dart';
import 'forgotPassword_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword=true;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(
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
                        SizedBox(height: 10.h,),
                        Image.asset("assets/images/logo.png",scale: 7,),
                        SizedBox(height: 2.h,),
                        Container(
                          child: Text("Login Screen",style: FontTextStyle.poppinsS24W7PrimaryColor,),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w,),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(height: 10.h,),
                                CustomTextField(
                                  prefixIcon: Icon(Icons.phone),
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
                                    // else if(str.length != 10){
                                    //   return '* Phone number must be of 10 digit';
                                    // }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 2.h,),
                                CustomTextField(
                                  suffixIcon: GestureDetector
                                    (onTap: (){
                                    setState(() {
                                      obscurePassword=! obscurePassword;
                                    });

                                  },
                                      child: obscurePassword? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                                  obscureText: obscurePassword,
                                  prefixIcon: Icon(Icons.password),
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
                                    onTap: () async{
                                      String? type = await Preferances.getString("userType");
                                      if(_formKey.currentState!.validate()) {
                                        ApiService().login(
                                            context, data: data());
                                      }
                                    },
                                    buttonText: "Log in",
                                    height: 5.h,
                                    textStyle: FontTextStyle.poppinsS16W7WhiteColor,
                                  ),
                                ),
                                SizedBox(height: 1.5.h,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Forgot()));
                                  },
                                    child: Text("Forgot Password?", style: FontTextStyle.poppinsS14W4blackColor,)),

// IconButton(onPressed: (){}, icon: Icon(Icons.circle,size: 10,))
                              ],
                            ),
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
  FormData data() {
    return FormData.fromMap({"user_id": phoneController.text.trim(),"password":passwordController.text.trim()});
  }
}
