import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/Services/api_service.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/color_utils.dart';
import '../../Model/get_all_enquiry.dart';
import 'package:http/http.dart' as http;

class ActiveTab extends StatefulWidget {
  const ActiveTab({Key? key}) : super(key: key);

  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {

  List<GetAllActiveData> getAllActiveData = [];
  @override
  void initState() {
    print("active screen");
    // TODO: implement initState
    super.initState();
    ApiService().active(context).then((value) {
     if(value!.message == "ok"){
       setState(() {
         getAllActiveData = value.users!;

       });
     }

    });
  }



  @override
  Widget build(BuildContext context) {


    return Container(
      color: ColorUtils.skyBlueColor,
      child:

      Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              dataRowHeight: 9.h,
              border: TableBorder.all(

                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2),
              columns:  [


                DataColumn(label: SizedBox( width:50, child: Text('Lead')),tooltip: "name",),
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
                DataColumn(label: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h,),
                  child: Column(
                    children: [
                      Text('Status', style: FontTextStyle.poppinsS14W4blackColor, ),
                      Text('Process',style: FontTextStyle.poppinsS14W4blackColor,),
                    ],
                  ),
                ),tooltip: "name"),

              ],
              rows: List.generate(getAllActiveData.length, (index) {

                // if(int.parse("${getAllActiveData[index].fIELDPROCESS}")>0){
                //   String FieldProcess1= 'green';
                // }else{
                //   String FieldProcess1='red';
                // }
                //
                // if(int.parse("${getAllActiveData[index].fIELDPROCESS}")>1){
                //   String FieldProcess2= 'green';
                // }else{
                //   String FieldProcess2='red';
                // }
                //
                // if(int.parse("${getAllActiveData[index].fIELDPROCESS}")>2){
                //   String FieldProcess3= 'green';
                // }else{
                //   String FieldProcess3='red';
                // }
                //
                // if(int.parse("${getAllActiveData[index].fIELDPROCESS}")>3){
                //   String FieldProcess4= 'green';
                // }else{
                //   String FieldProcess4='red';
                //}




                int fill=int.parse("${getAllActiveData[index].fIELDPROCESS}");
                int office=int.parse("${getAllActiveData[index].oFFICEPROCESS}");
                int factory=int.parse("${getAllActiveData[index].fACTORYPROCESS}");

                return DataRow(cells: [

                  DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${getAllActiveData[index].cUSNAME}"),
                        Text("${getAllActiveData[index].cUSPHONE}"),
                        Text("${getAllActiveData[index].cUSADDRESS}"),


                      ],
                    )
                  ),
                   DataCell(
                     ///// Field Process///////
                     Row(
                       children:[
                         // for (var i=0;i<4;i++)...[
                         //   if(i<=fill)
                         //     Container(
                         //       margin:EdgeInsets.only(right: 0.5.h),
                         //       height: 3.h,
                         //       width: 5.w,
                         //       decoration: BoxDecoration(
                         //         color: ColorUtils.green,
                         //         shape: BoxShape.circle,
                         //       ),)
                         //   else
                         //     Container(
                         //       margin:EdgeInsets.only(right: 0.5.h),
                         //       height: 3.h,
                         //       width: 5.w,
                         //       decoration: BoxDecoration(
                         //         color: ColorUtils.blackColor,
                         //         shape: BoxShape.circle,
                         //       ),)
                         // ],
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 5),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   Container(
                                     margin:EdgeInsets.only(right: 0.5.h),
                                     height: 3.h,
                                     width: 5.w,
                                     decoration: BoxDecoration(
                                       color: fill>=0 ? ColorUtils.green : ColorUtils.blackColor,
                                       shape: BoxShape.circle,
                                     ),),
                                   Container(
                                     margin:EdgeInsets.only(right: 0.5.h),
                                     height: 3.h,
                                     width: 5.w,
                                     decoration: BoxDecoration(
                                       color: fill>=1 ? ColorUtils.green : ColorUtils.blackColor,
                                       shape: BoxShape.circle,
                                     ),)
                                 ],

                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   Container(
                                     margin:EdgeInsets.only(right: 0.5.h),
                                     height: 3.h,
                                     width: 5.w,
                                     decoration: BoxDecoration(
                                       color: fill>=2 ? ColorUtils.green : ColorUtils.blackColor,
                                       shape: BoxShape.circle,
                                     ),),
                                   Container(
                                     margin:EdgeInsets.only(right: 0.5.h),
                                     height: 3.h,
                                     width: 5.w,
                                     decoration: BoxDecoration(
                                       color: fill>=3 ? ColorUtils.green : ColorUtils.blackColor,
                                       shape: BoxShape.circle,
                                     ),)
                                 ],

                               )
                             ],
                           ),
                         )
                       ]
                     ),
                  ),
                  DataCell(
                    ///// Office Process///////
                    Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin:EdgeInsets.only(right: 0.5.h),
                                      height: 3.h,
                                      width: 5.w,
                                      decoration: BoxDecoration(
                                        color: office>=0 ? ColorUtils.green : ColorUtils.blackColor,
                                        shape: BoxShape.circle,
                                      ),),
                                    Container(
                                      margin:EdgeInsets.only(right: 0.5.h),
                                      height: 3.h,
                                      width: 5.w,
                                      decoration: BoxDecoration(
                                        color: office>=1 ? ColorUtils.green : ColorUtils.blackColor,
                                        shape: BoxShape.circle,
                                      ),)
                                  ],

                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin:EdgeInsets.only(right: 0.5.h),
                                      height: 3.h,
                                      width: 5.w,
                                      decoration: BoxDecoration(
                                        color: office>=2 ? ColorUtils.green : ColorUtils.blackColor,
                                        shape: BoxShape.circle,
                                      ),),

                                  ],

                                )
                              ],
                            ),
                          )
                        ]
                    ),
                  ),
                  DataCell(
                    ///// Factory Process///////
                    Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin:EdgeInsets.only(right: 0.5.h),
                                      height: 3.h,
                                      width: 5.w,
                                      decoration: BoxDecoration(
                                        color: factory>=0 ? ColorUtils.green : ColorUtils.blackColor,
                                        shape: BoxShape.circle,
                                      ),),
                                    Container(
                                      margin:EdgeInsets.only(right: 0.5.h),
                                      height: 3.h,
                                      width: 5.w,
                                      decoration: BoxDecoration(
                                        color: factory>=1 ? ColorUtils.green : ColorUtils.blackColor,
                                        shape: BoxShape.circle,
                                      ),)
                                  ],

                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin:EdgeInsets.only(right: 0.5.h),
                                      height: 3.h,
                                      width: 5.w,
                                      decoration: BoxDecoration(
                                        color: factory>=2 ? ColorUtils.green : ColorUtils.blackColor,
                                        shape: BoxShape.circle,
                                      ),),

                                  ],

                                )
                              ],
                            ),
                          )
                        ],
                    ),
                  ), DataCell(
                    Text("Comment Here")
                  ),
                ]);
              }),

            ),

          ),
        ),
      )
    );
  }

}
//SingleChildScrollView(
//   child: Padding(
//     padding: const EdgeInsets.all(5.0),
//     child: Container(
//       color: ColorUtils.whiteColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Table(
//             border: TableBorder.all(
//                 color: Colors.black,
//                 style: BorderStyle.solid,
//                 width: 2),
//             children: [
//               TableRow(
//                   children: [
//                     Column(
//                       children: [
//                         Text("Lead",
//                           textAlign: TextAlign.center,
//                           style: FontTextStyle.poppinsS14W4blackColor,)
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text("Field Process",
//                           textAlign: TextAlign.center,
//                           style: FontTextStyle.poppinsS14W4blackColor,)
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text("Office Process",
//                           textAlign: TextAlign.center,
//                           style: FontTextStyle.poppinsS14W4blackColor,)
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text("Factory Process",
//                           textAlign: TextAlign.center,
//                           style: FontTextStyle.poppinsS14W4blackColor,)
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text("Status",
//                           textAlign: TextAlign.center,
//                           style: FontTextStyle.poppinsS14W4blackColor,)
//                       ],
//                     ),
//                   ]
//               ),
//             ],
//           ),
//           Row(
//
//             children: List.generate(getAllActiveData.length, (index) {
//               return Table(
//
//                 border: TableBorder.all(
//                     color: Colors.black,
//                     style: BorderStyle.solid,
//                     width: 2),
//                 children: [
//
//                   TableRow(
//
//                       children: [
//                         Container(
//                           color: Colors.black,
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           child: Column(
//
//                             children: [
//                               Text("${getAllActiveData[index].cUSNAME}",textAlign: TextAlign.center,
//                                 style: FontTextStyle.poppinsS14W4blackColor,),
//                               Text("${getAllActiveData[index].cUSPHONE}",textAlign: TextAlign.center,
//                                 style: FontTextStyle.poppinsS14W4blackColor,),
//                               Text("${getAllActiveData[index].cUSADDRESS}",textAlign: TextAlign.center,
//                                 style: FontTextStyle.poppinsS14W4blackColor,)
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Column(
//
//                             children: [
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Container(
//                                         height: 3.h,
//                                         width: 5.w,
//                                         decoration: BoxDecoration(
//                                           color: ColorUtils.blackColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 3.h,
//                                         width: 5.w,
//                                         decoration: BoxDecoration(
//                                           color: ColorUtils.blackColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Container(
//                                         height: 3.h,
//                                         width: 5.w,
//                                         decoration: BoxDecoration(
//                                           color: ColorUtils.blackColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 3.h,
//                                         width: 5.w,
//                                         decoration: BoxDecoration(
//                                           color: ColorUtils.blackColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Column(
//
//                             children: [
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Container(
//                                         height: 3.h,
//                                         width: 5.w,
//                                         decoration: BoxDecoration(
//                                           color: ColorUtils.blackColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 3.h,
//                                         width: 5.w,
//                                         decoration: BoxDecoration(
//                                           color: ColorUtils.blackColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Container(
//                                         height: 3.h,
//                                         width: 5.w,
//                                         decoration: BoxDecoration(
//                                           color: ColorUtils.blackColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Column(
//
//                             children: [
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Container(
//                                         height: 3.h,
//                                         width: 5.w,
//                                         decoration: BoxDecoration(
//                                           color: ColorUtils.blackColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 3.h,
//                                         width: 5.w,
//                                         decoration: BoxDecoration(
//                                           color: ColorUtils.blackColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Container(
//                                         height: 3.h,
//                                         width: 5.w,
//                                         decoration: BoxDecoration(
//                                           color: ColorUtils.blackColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             Text("Comment Here",textAlign: TextAlign.center,
//                               style: FontTextStyle.poppinsS14W4blackColor,)
//                           ],
//                         ),
//                       ]
//                   ),
//
//
//
//
//
//                 ],
//               );
//             }),
//           ),
//
//         ],
//       )
//     ),
//   ),
// ),