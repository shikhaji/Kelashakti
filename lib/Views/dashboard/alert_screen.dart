import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/Model/alert_model.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../Services/api_service.dart';
import '../customeWidgets/custom_text_field.dart';
class AlertScreen extends StatefulWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  List<GetAllAlertData> getAllAlertData =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiService().alert(context).then((value) {
      if(value!.message == "ok"){
        setState(() {
          getAllAlertData = value.alert!;
        });
      }

    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color:ColorUtils.skyBlueColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/images/logo.png",scale: 12,),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Alert screen",style: FontTextStyle.poppinsS18W4blackColor,)
              ),

              getAllAlertData.isEmpty ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(height: 100,),
                  Center(child: Text("No data Found!!"),),
                ],
              )  : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    dataRowHeight: 10.h,
                    border: TableBorder.all(

                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                    columns: const [

                      DataColumn(label: Text('Lead'),tooltip: "name",),
                      DataColumn(label: Text('Date Of Enquiry'),tooltip: "name"),
                      DataColumn(label: Text('Hold By'),tooltip: "name"),
                      DataColumn(label: Text('Date of Cancel'),tooltip: "name"),


                    ],
                    rows: List.generate(getAllAlertData.length, (index) {
                      var cdate="${getAllAlertData[index].cUSTT}";
                      var date=  DateFormat('dd-MM-yyy').format(DateTime.parse("${cdate}"));


                      return DataRow(cells: [
                        DataCell(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${getAllAlertData[index].cUSNAME}"),
                                Text("${getAllAlertData[index].cUSPHONE}"),
                                Text("${getAllAlertData[index].cUSADDRESS}"),
                              ],
                            )
                        ),
                        DataCell(
                          Text(date),
                        ),
                        DataCell(
                          Text(date),
                        ),
                        DataCell(
                          Text(date),
                        ),

                      ]);
                    }),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
