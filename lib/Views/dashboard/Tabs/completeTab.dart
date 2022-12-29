import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Utils/color_utils.dart';
import 'package:kelashakti/Views/Services/api_service.dart';

import '../../../Utils/fontFamily_utils.dart';
import '../../Model/get_all_complete.dart';

class CompleteTab extends StatefulWidget {
  const CompleteTab({Key? key}) : super(key: key);

  @override
  State<CompleteTab> createState() => _CompleteTabState();
}

class _CompleteTabState extends State<CompleteTab> {
  List<GetAllCompleteData> getAllCompleteData = [];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    ApiService().complete(context).then((value) {
      if(value!.message == "ok"){
        setState(() {

          getAllCompleteData = value.users!;
         // print(getAllCompleteData);

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
                // border: TableBorder.all(
                //     color: Colors.black,
                //     style: BorderStyle.solid,
                //     width: 2),
                border: TableBorder(
                  //right: BorderSide(width: 2,color: Colors.black,),
                  bottom: BorderSide(width: 2,color: Colors.black,),
                ),
                columns: const [

                  DataColumn(label: Text('Lead'),tooltip: "name",),
                  DataColumn(label: Text('Field Process'),tooltip: "name"),
                  DataColumn(label: Text('Office process'),tooltip: "name"),
                  DataColumn(label: Text('Factory process'),tooltip: "name"),
                  DataColumn(label: Text('Status'),tooltip: "name"),

                ],
                rows: List.generate(getAllCompleteData.length, (index) {
                  // int fill=int.parse("${getAllActiveData[index].fIELDPROCESS}");
                  // int office=int.parse("${getAllActiveData[index].oFFICEPROCESS}");
                  // int factory=int.parse("${getAllActiveData[index].fACTORYPROCESS}");
                  return DataRow(cells: [
                    DataCell(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${getAllCompleteData[index].cUSNAME}"),
                            Text("${getAllCompleteData[index].cUSPHONE}"),
                            Text("${getAllCompleteData[index].cUSADDRESS}"),


                          ],
                        )
                    ),
                    DataCell(
                     Text("hi"),

                    ),
                    DataCell(
                    Text("hi"),

                  ),
                    DataCell(
                      Text("hi"),

                    ),
                    DataCell(
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
