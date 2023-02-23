import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Views/Model/team_list_model.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/color_utils.dart';
import '../../../Utils/fontFamily_utils.dart';
import '../../Services/api_service.dart';
import '../../customeWidgets/custom_text_field.dart';
import '../../customeWidgets/cutom_btn.dart';
import '../bottomNavbar.dart';
import '../side_navbar.dart';
import '../team_list_screen.dart';

class UpdateTeamList extends StatefulWidget {
  final name;
  final phone;
  final address;
  final password;

  const UpdateTeamList({Key? key, this.name, this.phone, this.address, this.password}) : super(key: key);

  @override
  State<UpdateTeamList> createState() => _UpdateTeamListState();
}

class _UpdateTeamListState extends State<UpdateTeamList> {
  TextEditingController nameController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController addressController= TextEditingController();
  TextEditingController passwordController= TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      nameController.text=widget.name;
      phoneController.text=widget.phone;
      addressController.text=widget.address;
      passwordController.text=widget.password;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(

            appBar: AppBar(

              title: const Text("KST"),
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
                        Image.asset("assets/images/logo.png",scale: 7,),
                        SizedBox(height: 4.h,),
                        Text("Team Update Screen", style: FontTextStyle.poppinsS24W7PrimaryColor,),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w,),
                          child: Column(
                            children: [
                              SizedBox(height: 8.h,),
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

                                  }else if(str.length != 10){
                                    return '* Phone number must be of 10 digit';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 2.h,),
                              CustomTextField(
                                fieldController: passwordController,
                                fieldName: "Password",
                                hintName: "Password",
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
                                fieldController: addressController,
                                fieldName: "Address",
                                hintName: " Address",
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
                              SizedBox(height: 4.h,),
                              CustomButton(
                                onTap: () async {

                                  Map<String,dynamic> data = {
                                    "name": nameController.text.trim(),"phone" : phoneController.text.trim(),"address":addressController.text.trim(),"password":passwordController.text.trim()
                                  };
                                  ApiService().addAccount(context,data: data);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar(0)));
                                },
                                buttonText: "Update",
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
