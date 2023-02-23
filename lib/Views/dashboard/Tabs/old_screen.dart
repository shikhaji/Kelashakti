import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/customeWidgets/custom_text_field.dart';
import 'package:kelashakti/Views/customeWidgets/cutom_btn.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/color_utils.dart';
import '../../Model/search_model.dart';
import '../../Services/Shared_preferance.dart';
import '../../Services/api_service.dart';
import '../side_navbar.dart';

class OldScreen extends StatefulWidget {
  const OldScreen({Key? key}) : super(key: key);

  @override
  State<OldScreen> createState() => _OldScreenState();
}

class _OldScreenState extends State<OldScreen> {
  String processValue = 'Active';
  var selectedStatus;
  List<SearchData> searchData = [];
  DateTimeRange selectedDates =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  @override
  Widget build(BuildContext context) {
    var process = ["Active", "Complete", "Cancel"];

    final start = selectedDates.start;
    final end = selectedDates.end;
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(
            drawer: const SideNavBar(),
            appBar: AppBar(
              title: const Text("KST"),
              backgroundColor: ColorUtils.blackColor,
            ),
            body: Container(
              color: ColorUtils.skyBlueColor,
              child: Column(
                children: [
                  Container(
                    color: ColorUtils.skyBlueColor,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 10, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Date:",
                                      style: FontTextStyle
                                          .poppinsS16W4PrimaryColor,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      "Select Process:",
                                      style: FontTextStyle
                                          .poppinsS16W4PrimaryColor,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: pickDateRange,
                                          child: CustomButton(
                                            buttonText:
                                                '${start.year}/${start.month}/${start.day}',
                                            textStyle: FontTextStyle
                                                .poppinsS14W4PrimaryColor,
                                            btnColor: ColorUtils.whiteColor,
                                            borderColor:
                                                ColorUtils.lightGreyColor,
                                            height: 5.h,
                                            width: 25.w,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        GestureDetector(
                                          onTap: pickDateRange,
                                          child: CustomButton(
                                            buttonText:
                                                '${end.year}/${end.month}/${end.day}',
                                            textStyle: FontTextStyle
                                                .poppinsS14W4PrimaryColor,
                                            btnColor: ColorUtils.whiteColor,
                                            borderColor:
                                                ColorUtils.lightGreyColor,
                                            height: 5.h,
                                            width: 25.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      width: 51.w,
                                      height: 10.w,
                                      padding: EdgeInsets.only(
                                          left: 4.w, right: 3.w, bottom: 1.w),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorUtils.lightGreyColor),
                                        color: ColorUtils.whiteColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: DropdownButton(
                                        iconEnabledColor: ColorUtils.grey,
                                        style: TextStyle(
                                            color: ColorUtils.grey,
                                            fontSize: 16),
                                        dropdownColor: ColorUtils.whiteColor,
                                        focusColor: ColorUtils.grey,
                                        elevation: 0,
                                        underline: SizedBox(),
                                        value: processValue,
                                        isExpanded: true,
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        items: process.map((String items) {
                                          return DropdownMenuItem(
                                            value: items != null ? items : "",
                                            child: Center(
                                              child: Text(
                                                items,
                                                style: FontTextStyle
                                                    .poppinsS14W4PrimaryColor,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            processValue = value!;
                                            print(value);
                                            if (processValue == "Active") {
                                              selectedStatus = 1;
                                            }
                                            if (processValue == "Complete") {
                                              selectedStatus = 2;
                                            }
                                            if (processValue == "Cancel") {
                                              selectedStatus = 3;
                                            }

                                            // genderValue = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              String? userid =
                                  await Preferances.getString("userId");
                              String? type =
                                  await Preferances.getString("userType");
                              FormData data() {
                                print("selectedStatus:=$selectedStatus");
                                return FormData.fromMap({
                                  'type': userid
                                      ?.replaceAll('"', '')
                                      .replaceAll('"', '')
                                      .toString(),
                                  'id': type
                                      ?.replaceAll('"', '')
                                      .replaceAll('"', '')
                                      .toString(),
                                  'status': selectedStatus,
                                  'from': '${start.year}-${start.month}-${start.day}',
                                  'to': '${end.year}-${end.month}-${end.day}'
                                });
                              }

                              print(data);
                              ApiService().search(context, data: data()).then((value){
                                if(value!.message == "ok"){
                                  if(value.users!=null){
                                 setState(() {
                                   searchData = value.users!;
                                 });}
                               }
                              });
                            },
                            child: CustomButton(
                              buttonText: "Search",
                              btnColor: ColorUtils.primaryColor,
                              height: 5.h,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child:searchData.isEmpty?  Column(children:const [
                        SizedBox(height: 50,),
                        Text("No Data Found!!"),

                      ] ) : DataTable(
                        dataRowHeight: 10.h,
                        border: TableBorder.all(

                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2),
                        columns:  [

                          const DataColumn(label: Text('Lead'),tooltip: "name",),
                          DataColumn(label: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h,),
                            child: Column(
                              children: [
                                Text('Field', style: FontTextStyle.poppinsS14W4blackColor, ),
                                Text('Process',style: FontTextStyle.poppinsS14W4blackColor,),
                              ],
                            ),
                          ),tooltip: "name"),
                          DataColumn(label: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h,),
                            child: Column(
                              children: [
                                Text('Office', style: FontTextStyle.poppinsS14W4blackColor, ),
                                Text('Process',style: FontTextStyle.poppinsS14W4blackColor,),
                              ],
                            ),
                          ),tooltip: "name"),
                          DataColumn(label: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h,),
                            child: Column(
                              children: [
                                Text('Factory', style: FontTextStyle.poppinsS14W4blackColor, ),
                                Text('Process',style: FontTextStyle.poppinsS14W4blackColor,),
                              ],
                            ),
                          ),tooltip: "name"),


                        ],
                        rows: List.generate(searchData.length, (index) {
                          int fill=int.parse("${searchData[index].fIELDPROCESS}");
                          int office=int.parse("${searchData[index].oFFICEPROCESS}");
                          int factory=int.parse("${searchData[index].fACTORYPROCESS}");


                          return DataRow(cells: [
                            DataCell(
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${searchData[index].cUSNAME}"),
                                    Text("${searchData[index].cUSPHONE}"),
                                    Text("${searchData[index].cUSADDRESS}"),
                                  ],
                                )
                            ),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          // Preferances.setString("userId", response.wPSID);
                                          margin:EdgeInsets.only(right: 1.h),
                                          height: 5.h,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color: fill>=1 ? ColorUtils.green  : ColorUtils.blackColor,
                                            shape: BoxShape.circle,
                                          ),),
                                        Container(
                                          // Preferances.setString("userId", response.wPSID);
                                          margin:EdgeInsets.only(right: 1.h),
                                          height: 5.h,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color: fill>=2 ? ColorUtils.green  : ColorUtils.blackColor,
                                            shape: BoxShape.circle,
                                          ),),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          // Preferances.setString("userId", response.wPSID);
                                          margin:EdgeInsets.only(right: 1.h),
                                          height: 5.h,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color: fill>=3 ? ColorUtils.green  : ColorUtils.blackColor,
                                            shape: BoxShape.circle,
                                          ),),
                                        Container(
                                          // Preferances.setString("userId", response.wPSID);
                                          margin:EdgeInsets.only(right: 1.h),
                                          height: 5.h,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color: fill>=4 ? ColorUtils.green  : ColorUtils.blackColor,
                                            shape: BoxShape.circle,
                                          ),),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          // Preferances.setString("userId", response.wPSID);
                                          margin:EdgeInsets.only(right: 1.h),
                                          height: 5.h,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color: office>=1 ? ColorUtils.green  : ColorUtils.blackColor,
                                            shape: BoxShape.circle,
                                          ),),
                                        Container(
                                          // Preferances.setString("userId", response.wPSID);
                                          margin:EdgeInsets.only(right: 1.h),
                                          height: 5.h,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color: office>=2 ? ColorUtils.green  : ColorUtils.blackColor,
                                            shape: BoxShape.circle,
                                          ),),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          // Preferances.setString("userId", response.wPSID);
                                          margin:EdgeInsets.only(right: 1.h),
                                          height: 5.h,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color: office>=3 ? ColorUtils.green  : ColorUtils.blackColor,
                                            shape: BoxShape.circle,
                                          ),),


                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          // Preferances.setString("userId", response.wPSID);
                                          margin:EdgeInsets.only(right: 1.h),
                                          height: 5.h,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color: factory>=1 ? ColorUtils.green  : ColorUtils.blackColor,
                                            shape: BoxShape.circle,
                                          ),),
                                        Container(
                                          // Preferances.setString("userId", response.wPSID);
                                          margin:EdgeInsets.only(right: 1.h),
                                          height: 5.h,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color: factory>=2 ? ColorUtils.green  : ColorUtils.blackColor,
                                            shape: BoxShape.circle,
                                          ),),

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(

                                          margin:EdgeInsets.only(right: 1.h),
                                          height: 5.h,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color: factory>=3 ? ColorUtils.green  : ColorUtils.blackColor,
                                            shape: BoxShape.circle,
                                          ),),


                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),

                          ]);
                        }),

                      ),
                    ),
                  ),),
                ],
              ),
            )),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2050));

    if (newDateRange == null) return;
    setState(() {
      selectedDates = newDateRange;
    });
  }
}
