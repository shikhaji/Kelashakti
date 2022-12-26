import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Utils/color_utils.dart';
import '../../../Utils/fontFamily_utils.dart';

class CancelTab extends StatefulWidget {
  const CancelTab({Key? key}) : super(key: key);

  @override
  State<CancelTab> createState() => _CancelTabState();
}

class _CancelTabState extends State<CancelTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color:ColorUtils.skyBlueColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color:ColorUtils.whiteColor,
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
                          Text("Date Of Enquiry",
                            textAlign: TextAlign.center,
                            style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
                      ),
                      Column(
                        children: [
                          Text("Hold By",
                            textAlign: TextAlign.center,
                            style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
                      ),
                      Column(
                        children: [
                          Text("Date Of Cancel",
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
                          Text("Name Phone ",textAlign: TextAlign.center,
                            style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
                      ),
                      Column(
                        children: [
                          Text("12-02-22 ",textAlign: TextAlign.center,
                            style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
                      ),

                      Column(
                        children: [
                          Text("Pankaj Kumar ",textAlign: TextAlign.center,
                            style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
                      ),
                      Column(
                        children: [
                          Text("12-02-22 ",textAlign: TextAlign.center,
                            style: FontTextStyle.poppinsS14W4blackColor,)
                        ],
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
