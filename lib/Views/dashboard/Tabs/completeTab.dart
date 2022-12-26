import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/color_utils.dart';

import '../../../Utils/fontFamily_utils.dart';

class CompleteTab extends StatefulWidget {
  const CompleteTab({Key? key}) : super(key: key);

  @override
  State<CompleteTab> createState() => _CompleteTabState();
}

class _CompleteTabState extends State<CompleteTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.skyBlueColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color:ColorUtils.whiteColor,
            child: Table(

              border: TableBorder(horizontalInside: BorderSide(width: 1, color: Colors.blue, style: BorderStyle.solid)),
              children: [
                TableRow(children: [
                  Column(
                    children: [
                      Text(
                        "Lead",
                        textAlign: TextAlign.center,
                        style: FontTextStyle.poppinsS14W4blackColor,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Field Process",
                        textAlign: TextAlign.center,
                        style: FontTextStyle.poppinsS14W4blackColor,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Office Process",
                        textAlign: TextAlign.center,
                        style: FontTextStyle.poppinsS14W4blackColor,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Factory Process",
                        textAlign: TextAlign.center,
                        style: FontTextStyle.poppinsS14W4blackColor,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Status",
                        textAlign: TextAlign.center,
                        style: FontTextStyle.poppinsS14W4blackColor,
                      )
                    ],
                  ),
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      Text(
                        "Name Phone ",
                        textAlign: TextAlign.center,
                        style: FontTextStyle.poppinsS14W4blackColor,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "12-02-22 ",
                        textAlign: TextAlign.center,
                        style: FontTextStyle.poppinsS14W4blackColor,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "12-02-22 ",
                        textAlign: TextAlign.center,
                        style: FontTextStyle.poppinsS14W4blackColor,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "12-02-22 ",
                        textAlign: TextAlign.center,
                        style: FontTextStyle.poppinsS14W4blackColor,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Comment Here",
                        textAlign: TextAlign.center,
                        style: FontTextStyle.poppinsS14W4blackColor,
                      )
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
