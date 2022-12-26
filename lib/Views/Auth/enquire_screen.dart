import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Views/Services/api_service.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../Model/refer_list_model.dart';
import '../customeWidgets/custom_text_field.dart';
import '../customeWidgets/cutom_btn.dart';
import '../dashboard/bottomNavbar.dart';

class EnquireScreen extends StatefulWidget {
  const EnquireScreen({Key? key}) : super(key: key);

  @override
  State<EnquireScreen> createState() => _EnquireScreenState();
}

class _EnquireScreenState extends State<EnquireScreen> {
  //var refer = ["Ayan Sharma","Pankaj kumar","Hina"];
  String genderInitialValue = 'Ayan Sharma';

  List<ReferListData?> referListData = [];
  

  @override
  void initState() {
    // TODO: implement initState

    ApiService().referList(context).then((value) {
      setState(() {
        referListData = value.users!;
        

      });
    });
    super.initState();
  }



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
                              // FutureBuilder<List<String>>(
                              //   future: ApiService().referList(context);
                              //   builder:
                              //   <child>: Container(
                              //     width: double.infinity,
                              //     height: 12.7.w,
                              //     padding:
                              //     EdgeInsets.only(left: 4.w, right: 3.w, bottom: 1.w),
                              //     decoration: BoxDecoration(
                              //       border: Border.all(color: ColorUtils.lightGreyColor),
                              //       color: ColorUtils.whiteColor,
                              //       borderRadius: BorderRadius.circular(50),
                              //     ),
                              //     child: DropdownButton(
                              //       iconEnabledColor: ColorUtils.grey,
                              //       style: TextStyle(color: ColorUtils.grey, fontSize: 16),
                              //       dropdownColor: ColorUtils.whiteColor,
                              //       focusColor: ColorUtils.grey,
                              //       elevation: 0,
                              //       underline: SizedBox(),
                              //       value: genderInitialValue,
                              //       isExpanded: true,
                              //       icon: Icon(Icons.keyboard_arrow_down),
                              //       items:   refer.map((String items) {
                              //         return DropdownMenuItem(
                              //           value: items,
                              //           child: Text(
                              //             '${items}',
                              //             style: FontTextStyle.poppinsS14W4GreyColor,
                              //           ),
                              //         );
                              //       }).toList(),
                              //       onChanged: (String? value) {
                              //         setState(() {
                              //           genderInitialValue = value!;
                              //           print(value);
                              //           // genderValue = value;
                              //         });
                              //       },
                              //     ),
                              //   ),
                              // ),
                              ListView.builder(shrinkWrap: true,itemCount: referListData.length,itemBuilder: (BuildContext context, int index){
                                return Container(
                                  height: 200,
                                  child:
                                  Text("${referListData[index]?.bRANCHNAME}"),
                                );
                              }),
                              SizedBox(height: 2.h,),
                              CustomButton(
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomNavBar()));

                                },
                                buttonText: "Click To Add",
                                height: 5.h,
                                textStyle: FontTextStyle.poppinsS16W7WhiteColor,
                              ),
                              SizedBox(height: 18.h,),
                              Text("We Need Permission For The Service You Use", style: FontTextStyle.poppinsS14W4GreyColor,),
                              SizedBox(height: 0.5.h,),
                          Text("Learn More", style: FontTextStyle.poppinsS16W4blackColor)

                              //Text("Forgot Password?", style: FontTextStyle.poppinsS14W4blackColor,)


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
