import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/color_utils.dart';

class ActiveTab extends StatefulWidget {
  const ActiveTab({Key? key}) : super(key: key);

  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.skyBlueColor,
      child: SingleChildScrollView(
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
      ),
    );
  }
}
