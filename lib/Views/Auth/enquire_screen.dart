import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kelashakti/Views/Services/api_service.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../Model/get_all_users.dart';
import '../Model/refer_list_model.dart';
import '../Services/Shared_preferance.dart';
import '../customeWidgets/custom_text_field.dart';
import '../customeWidgets/cutom_btn.dart';
import '../dashboard/bottomNavbar.dart';
import 'package:http/http.dart';

class EnquireScreen extends StatefulWidget {
  const EnquireScreen({Key? key}) : super(key: key);

  @override
  State<EnquireScreen> createState() => _EnquireScreenState();
}

class _EnquireScreenState extends State<EnquireScreen> {
  TextEditingController nameController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController addressController= TextEditingController();
  //TextEditingController referController= TextEditingController();





  //

  GetAllUser? getAllUser;
  String dropdowncategory = "";
  Future<void> getAlluser({
    required BuildContext context,
  }) async {
    try {
      Map<String, dynamic> formdata = ({});
      final response = await Dio().get(
        'https://tinkubhaiya.provisioningtech.com/get_ajax/get_all_users/',
        queryParameters: formdata,
      );

      print("get  Api response data :- ");
      print(response.data);

      getAllUser = GetAllUser.fromJson(response.data);
      setState(() {
        getAllUser;
      });
    } on DioError catch (e) {
      print(e.toString());
    }
  }
  @override
  void initState() {
    super.initState();
    getAlluser(context: context);
  }

  String? selectedRefer;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(
            body: Container(
              height: double.infinity,
              color: ColorUtils.skyBlueColor,
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 7.h,),
                        Column(
                          children: [
                          Text("Enquire", style: FontTextStyle.poppinsS24W7PrimaryColor,),
                            SizedBox(height: 2.h,),
                          Text("Please Record Enquire Here", style: FontTextStyle.poppinsS18W4blackColor,),
                          ]

                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w,),
                          child: Column(
                            children: [
                              SizedBox(height: 15.h,),
                              CustomTextField(
                                fieldController: phoneController,
                                fieldName: "Phone Number",
                                hintName: "Enter Phone Number",
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
                                fieldController: nameController,
                                fieldName: "Full Name",
                                hintName: "Full Name",
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
                                fieldController: addressController,
                                fieldName: "Address",
                                hintName: "Address",
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

                          Container(
                                width: double.infinity,
                                height: 12.7.w,
                                padding:
                                EdgeInsets.only(left: 4.w, right: 3.w, bottom: 1.w),
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorUtils.lightGreyColor),
                                  color: ColorUtils.whiteColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: dropdowncategorybutton(),
                                ),

                              SizedBox(height: 2.h,),
                              CustomButton(
                                onTap: () {
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomNavBar()));
                                  print("name:= ${nameController.text.trim()}");
                                  print("phone:= ${phoneController.text.trim()}");
                                  print("name:= ${addressController.text.trim()}");
                                  // FormData data() {
                                  //   return FormData.fromMap({"name": nameController.text.trim(),"phone" : phoneController.text.trim(),"address":addressController.text.trim(),"referto":selectedRefer.toString()});
                                  // }
                                  Map<String,dynamic> data = {
                                    "name": nameController.text.trim(),
                                    "phone" : phoneController.text.trim(),
                                    "address":addressController.text.trim(),"referto":selectedRefer.toString()
                                  };
                                  ApiService().enquire(context,data: data).then((value){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
                                  });

                                },
                                buttonText: "Click To Add",
                                height: 5.h,
                                textStyle: FontTextStyle.poppinsS16W7WhiteColor,
                              ),
                              SizedBox(height: 18.h,),
                              Text("We Need Permission For The Service You Use", style: FontTextStyle.poppinsS14W4GreyColor,),
                              SizedBox(height: 0.5.h,),
                          Text("Learn More", style: FontTextStyle.poppinsS16W4blackColor)
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
  Widget dropdowncategorybutton() {
    List<DropdownMenuItem<String>>? dropdownList = [];
if(getAllUser != null && getAllUser?.users != null){
    for (int i = 0; i < getAllUser!.users!.length; i++) {
      DropdownMenuItem<String> item = DropdownMenuItem<String>(
        child: Row(
          children: <Widget>[
            Text(getAllUser!.users![i].bRANCHNAME!),
          ],
        ),
        value: getAllUser!.users![i].bRANCHNAME!.toString(),
      );

      dropdownList.add(item);
    }}
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //   color: Colors.grey.shade300,
          // ),
          color: Colors.white),
      child: DropdownButton<String>(
        value: dropdowncategory.isEmpty ? null: dropdowncategory,
        isExpanded: true,
        underline: Container(),
        hint:  Text("${selectedRefer == "" ?'Select categories' : selectedRefer}"),
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
        ),

        // Array list of items
        items: dropdownList,

        onChanged: (newValue) {
          setState(() {
            print("newvalue:=$newValue");

            selectedRefer = newValue;
            print("selectedRefer:=$selectedRefer");
           // dropdowncategory = newValue!;
          });
        },
      ),
    );
  }
}

