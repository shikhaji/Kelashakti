import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/customeWidgets/custom_text_field.dart';
import 'package:kelashakti/Views/customeWidgets/cutom_btn.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/color_utils.dart';
class OldScreen extends StatefulWidget {
  const OldScreen({Key? key}) : super(key: key);

  @override
  State<OldScreen> createState() => _OldScreenState();
}

class _OldScreenState extends State<OldScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.list),
              // default is 56
              title: Text("KelaShakti"),

              backgroundColor: ColorUtils.blackColor,
            ),
            body: Container(
              color: ColorUtils.skyBlueColor,
              child: Column(
                children: [
                  Container(
                    color: ColorUtils.skyBlueColor,
                    height:22.h,
                    width: double.infinity,
                    child :Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         // SizedBox(height: 2.h),
                          SizedBox(width: 80.w,
                            child: CustomTextField(
                              fieldName: "Form",
                              hintName: "From",
                            ),),
                        //  SizedBox(height: 2.h,),
                          SizedBox(width: 80.w,
                            child: CustomTextField(
                              fieldName: "To",
                              hintName: "To",
                            ),),
                         // SizedBox(height: 2.h,),
                          CustomButton(
                            buttonText: "SEARCH",
                            btnColor: ColorUtils.primaryColor,
                            height: 5.h,
                            width: 40.w,
                          )
                        ],
                      ),
                    ),
                  ),
                 Expanded(child:  SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: Container(
                       color: ColorUtils.whiteColor,
                       child: Table(
                         border: TableBorder.all(
                             color: Colors.black,
                             style: BorderStyle.solid,
                             width: 2),
                         children: [
                           TableRow(
                               children: [
                                 Column(
                                   children: [
                                     Text("Lead",
                                       textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                                 Column(
                                   children: [
                                     Text("Field Process",
                                       textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                                 Column(
                                   children: [
                                     Text("Office Process",
                                       textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                                 Column(
                                   children: [
                                     Text("Factory Process",
                                       textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                                 Column(
                                   children: [
                                     Text("Status",
                                       textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                               ]
                           ),
                           TableRow(
                               children: [
                                 Column(
                                   children: [
                                     Text("Name Phone Address",textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),

                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),

                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Column(
                                   children: [
                                     Text("Comment Here",textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                               ]
                           ),
                           TableRow(
                               children: [
                                 Column(
                                   children: [
                                     Text("Name Phone Address",textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),

                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),

                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Column(
                                   children: [
                                     Text("Comment Here",textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                               ]
                           ),
                           TableRow(
                               children: [
                                 Column(
                                   children: [
                                     Text("Name Phone Address",textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),

                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),

                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Column(
                                   children: [
                                     Text("Comment Here",textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                               ]
                           ),
                           TableRow(
                               children: [
                                 Column(
                                   children: [
                                     Text("Name Phone Address",textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),

                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Column(

                                     children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: [
                                               Container(
                                                 height: 3.h,
                                                 width: 5.w,
                                                 decoration: BoxDecoration(
                                                   color: ColorUtils.blackColor,
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),

                                             ],
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Column(
                                   children: [
                                     Text("Comment Here",textAlign: TextAlign.center,
                                       style: FontTextStyle.poppinsS14W4blackColor,)
                                   ],
                                 ),
                               ]
                           ),




                         ],
                       ),
                     ),
                   ),
                 ))
                ],
              ),
            )

        ),

      ),
    );
  }
}
