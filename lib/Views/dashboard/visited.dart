import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Views/Model/visited_model.dart';
import 'package:kelashakti/Views/dashboard/sidenavbar2.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../Model/acceptModel.dart';
import '../Services/api_service.dart';

class Visited extends StatefulWidget {
  const Visited({Key? key}) : super(key: key);

  @override
  State<Visited> createState() => _VisitedState();
}

class _VisitedState extends State<Visited> {
  List<VisitedData> visitedData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiService().visited(context).then((value) {
      if(value!.status==200){
        setState(() {
          if(value.message!=null){
            visitedData = value.message!;
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
                      child: Center(child: Text("Visited Pending",style: FontTextStyle.poppinsS24W7PrimaryColor,)),
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
                        child:visitedData.isEmpty?  Column(children:const [
                          SizedBox(height: 50,),
                          Text("No Data Found!!"),

                        ] ) :
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: DataTable(
                            dataRowHeight: 10.h,
                            border: TableBorder.all(

                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 2),
                            columns:  const [

                              DataColumn(label: Text('Name'),tooltip: "name",),
                              DataColumn(label: Text('Address'),tooltip: "name",),
                              DataColumn(label: Text('Phone'),tooltip: "name",),




                            ],
                            rows: List.generate(visitedData.length, (index) {
                              int fill=int.parse("${visitedData[index].fIELDPROCESS}");
                              int office=int.parse("${visitedData[index].oFFICEPROCESS}");
                              int factory=int.parse("${visitedData[index].fACTORYPROCESS}");


                              return DataRow(cells: [
                                DataCell(
                                    Text("${visitedData[index].cUSNAME}")
                                ),
                                DataCell(
                                    Text("${visitedData[index].cUSADDRESS}")
                                ),
                                DataCell(
                                    Text("${visitedData[index].cUSPHONE}")
                                ),



                              ]);
                            }),

                          ),
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
