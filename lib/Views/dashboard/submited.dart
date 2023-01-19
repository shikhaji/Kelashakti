import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kelashakti/Views/dashboard/sidenavbar2.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../Model/acceptModel.dart';
import '../Model/submited_model.dart';
import '../Services/Shared_preferance.dart';
import '../Services/api_service.dart';
import '../customeWidgets/custom_text_field.dart';

class Submited extends StatefulWidget {
  const Submited({Key? key}) : super(key: key);

  @override
  State<Submited> createState() => _SubmitedState();
}

class _SubmitedState extends State<Submited> {
  final TextEditingController msg1Controller = TextEditingController();
  final TextEditingController msg2Controller = TextEditingController();
  List<SubmitedData> submitedData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    submitedApiCall();
  }

  void submitedApiCall(){
    ApiService().submited(context).then((value) {
      if(value!.status == 200){
        setState(() {
          if(value.message!=null){
            submitedData = value.message!;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(
            drawer: const SideNavBar2(),
            appBar: AppBar(

              // default is 56
              title: const Text("KelaShakti Traders"),

              backgroundColor: ColorUtils.blackColor,
            ),
            body: Container(
              color: ColorUtils.skyBlueColor,
              child: Column(
                children: [
                  Container(
                    color: ColorUtils.skyBlueColor,
                    width: double.infinity,
                    child:  Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      child: Center(child: Text("Submitted Pending",style: FontTextStyle.poppinsS24W7PrimaryColor,)),
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
                        child:submitedData.isEmpty?  Column(children:const [
                          SizedBox(height: 50,),
                          Text("No Data Found!!"),

                        ] ) :
                        DataTable(
                          dataRowHeight: 10.h,
                          border: TableBorder.all(

                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 2),
                          columns:  const [

                            DataColumn(label: Text('Name'),tooltip: "name",),
                            DataColumn(label: Text('Address'),tooltip: "name",),
                            DataColumn(label: Text('Phone'),tooltip: "name",),
                            DataColumn(label: Text('Last Message'),tooltip: "name",),
                            DataColumn(label: Text('Action'),tooltip: "name",),



                          ],
                          rows: List.generate(submitedData.length, (index) {
                            int fill=int.parse("${submitedData[index].fIELDPROCESS}");
                            int office=int.parse("${submitedData[index].oFFICEPROCESS}");
                            int factory=int.parse("${submitedData[index].fACTORYPROCESS}");


                            return DataRow(cells: [
                              DataCell(
                                  Text("${submitedData[index].cUSNAME}")
                              ),
                              DataCell(
                                  Text("${submitedData[index].cUSADDRESS}")
                              ),
                              DataCell(
                                  Text("${submitedData[index].cUSPHONE}")
                              ),
                              DataCell(
                                  Text("${submitedData[index].cUSLASTCOMMENT}")
                              ),
                              DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children:  [
                                      GestureDetector(
                                          onTap: () async{
                                            String? userid = await Preferances.getString("userId");
                                            showDialog(
                                              context: context,
                                              builder: (ctx) =>
                                                  AlertDialog(
                                                    title: Text("Confirm!!",style: FontTextStyle.poppinsS18W4blackColor,),
                                                    // content: const Text("Are You Sure ?"),
                                                    actions: <Widget>[

                                                      Column(
                                                        children: [
                                                          CustomTextField(
                                                            fieldName: "Confirm",
                                                            hintName: "Write Your Message Here..",
                                                            validator: (str) {
                                                              if (str!.isEmpty) {
                                                                return '* Is Required';
                                                              }
                                                            },
                                                            fieldController: msg1Controller,
                                                            maxLines: 3,
                                                            contentPadding: const EdgeInsets.only(left: 20,top: 20),
                                                          ),

                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(ctx).pop();
                                                                },
                                                                child: Container(
                                                                  color: Colors.white,
                                                                  padding: const EdgeInsets.all(14),
                                                                  child: const Text("Cancel"),
                                                                ),
                                                              ),
                                                              TextButton(
                                                                onPressed: ()async {
                                                                  Map<String,dynamic> data = {
                                                                    "id" :"${submitedData[index].cUSID}" ,
                                                                    "message" : msg1Controller.text,
                                                                    "loginid" : userid?.replaceAll('"', '').replaceAll('"', '').toString(),
                                                                    "status" : '2',
                                                                    "fieldprocess":'4'
                                                                  };
                                                                  ApiService().confirmMessage(context,data: data).then((value) {
                                                                    submitedApiCall();
                                                                    Fluttertoast.showToast(
                                                                      msg: "Data Submitted",
                                                                      backgroundColor: Colors.grey,
                                                                    );

                                                                  });
                                                                  Navigator.of(ctx).pop();
                                                                },
                                                                child: Container(
                                                                  color: Colors.white,
                                                                  padding: const EdgeInsets.all(14),
                                                                  child: const Text("okay"),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                            );
                                          },
                                          child: Icon(Icons.check_circle, color: ColorUtils.green,size: 40,)),
                                      SizedBox(width: 1.h,),
                                      GestureDetector(
                                          onTap: () async{
                                            String? userid = await Preferances.getString("userId");
                                            showDialog(
                                              context: context,
                                              builder: (ctx) =>
                                                  AlertDialog(
                                                    title: Text("Cancel!!",style: FontTextStyle.poppinsS18W4blackColor,),
                                                    // content: const Text("Are You Sure ?"),
                                                    actions: <Widget>[

                                                      Column(
                                                        children: [
                                                          CustomTextField(
                                                            fieldName: "Cancel",
                                                            hintName: "Write Your Message Here..",
                                                            validator: (str) {
                                                              if (str!.isEmpty) {
                                                                return '* Is Required';
                                                              }
                                                            },
                                                            fieldController: msg1Controller,
                                                            maxLines: 3,
                                                            contentPadding: const EdgeInsets.only(left: 20,top: 20),
                                                          ),

                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(ctx).pop();
                                                                },
                                                                child: Container(
                                                                  color: Colors.white,
                                                                  padding: const EdgeInsets.all(14),
                                                                  child: const Text("Cancel"),
                                                                ),
                                                              ),
                                                              TextButton(
                                                                onPressed: ()async {
                                                                  Map<String,dynamic> data = {
                                                                    "id" :"${submitedData[index].cUSID}" ,
                                                                    "message" : msg1Controller.text,
                                                                    "loginid" : userid?.replaceAll('"', '').replaceAll('"', '').toString(),
                                                                    "status" : '3',
                                                                    "fieldprocess":'3'
                                                                  };
                                                                  ApiService().cancelMessage(context,data: data).then((value) {
                                                                    submitedApiCall();
                                                                  });
                                                                  Navigator.of(ctx).pop();
                                                                },
                                                                child: Container(
                                                                  color: Colors.white,
                                                                  padding: const EdgeInsets.all(14),
                                                                  child: const Text("okay"),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                            );
                                          },
                                          child: Icon(Icons.cancel,color: ColorUtils.redColor,size: 40,)),
                                    ],
                                  )
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
}
