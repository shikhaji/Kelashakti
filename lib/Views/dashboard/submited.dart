import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Views/dashboard/sidenavbar2.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../Model/acceptModel.dart';
import '../Services/api_service.dart';

class Submited extends StatefulWidget {
  const Submited({Key? key}) : super(key: key);

  @override
  State<Submited> createState() => _SubmitedState();
}

class _SubmitedState extends State<Submited> {
  List<Message> acceptData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiService().accept(context).then((value) {
      if(value!.message == "ok"){
        setState(() {
          if(value.message!=null){
            acceptData = value.message!;
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
                        child:acceptData.isEmpty?  Column(children:const [
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
                            DataColumn(label: Text('Action'),tooltip: "name",),



                          ],
                          rows: List.generate(acceptData.length, (index) {
                            int fill=int.parse("${acceptData[index].fIELDPROCESS}");
                            int office=int.parse("${acceptData[index].oFFICEPROCESS}");
                            int factory=int.parse("${acceptData[index].fACTORYPROCESS}");


                            return DataRow(cells: [
                              DataCell(
                                  Text("${acceptData[index].cUSNAME}")
                              ),
                              DataCell(
                                  Text("${acceptData[index].cUSADDRESS}")
                              ),
                              DataCell(
                                  Text("${acceptData[index].cUSPHONE}")
                              ),
                              DataCell(
                                  Text("${acceptData[index].cUSNAME}")
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
