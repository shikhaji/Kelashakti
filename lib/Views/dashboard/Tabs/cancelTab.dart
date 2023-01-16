import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../Utils/color_utils.dart';
import '../../../Utils/fontFamily_utils.dart';
import '../../Model/get_all_cancel.dart';
import '../../Services/api_service.dart';
import '../../customeWidgets/custom_text_field.dart';

class CancelTab extends StatefulWidget {
  const CancelTab({Key? key}) : super(key: key);

  @override
  State<CancelTab> createState() => _CancelTabState();
}

class _CancelTabState extends State<CancelTab> {
  List<GetAllCancelData> getAllCancelData =[];
  final TextEditingController _msgController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiService().cancel(context).then((value) {
      if(value!.message == "ok"){
        setState(() {
          getAllCancelData = value.users!;
        });
      }

    });

  }
  @override
  Widget build(BuildContext context) {
    return getAllCancelData.length == 0  ? Center(child: Text("NO found data!"),): Container(
        color:ColorUtils.skyBlueColor,
      child: SingleChildScrollView(
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
              DataColumn(label: Text('Status'),tooltip: "name"),

            ],
            rows: List.generate(getAllCancelData.length, (index) {
              var cdate="${getAllCancelData[index].cUSTT}";
              var date=  DateFormat('dd-MM-yyy').format(DateTime.parse("${cdate}"));
              // int fill=int.parse("${getAllActiveData[index].fIELDPROCESS}");
              // int office=int.parse("${getAllActiveData[index].oFFICEPROCESS}");
              // int factory=int.parse("${getAllActiveData[index].fACTORYPROCESS}");
              print(getAllCancelData[index].cUSLASTCOMMENT);
            //  _msgController.text = getAllCancelData[index].cUSLASTCOMMENT!;
              print("msgcontroller:=${_msgController.text}");
              return DataRow(cells: [
                DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${getAllCancelData[index].cUSNAME}"),
                        Text("${getAllCancelData[index].cUSPHONE}"),
                        Text("${getAllCancelData[index].cUSADDRESS}"),
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
                DataCell(
                  //Text("${getAllCancelData[index].cUSLASTCOMMENT}"),
                  TextButton(onPressed: (){
                    showDialog(

                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Comment here..."),

                        actions: <Widget>[

                          Column(
                            children: [
                              CustomTextField(
                                fieldController: _msgController,
                                fieldName: "Comment",
                                hintName: " comment here...",
                                //keyboard: TextInputType.phone,
                                maxLines: 1,
                                textInputAction:TextInputAction.done,
                                validator: (str) {
                                  if (str!.isEmpty) {

                                    return '* Is Required';

                                  }
                                  return null;
                                },
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
                                    onPressed: () async {

                                      Map<String,dynamic> data = {
                                        "id" : getAllCancelData[index].cUSID,"message" : _msgController.text ,
                                      };
                                        ApiService().updateComment(context,data: data).then((value) {
                                          ApiService().cancel(context).then((value) {
                                            if(value!.message == "ok"){
                                              setState(() {
                                                getAllCancelData = value.users!;
                                                  _msgController.clear();
                                              });
                                            }
                                            Navigator.of(ctx).pop();



                                          });
                                        });

                                      ///update msg api call
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
                  },child:  Text("${getAllCancelData[index].cUSLASTCOMMENT != "" ? getAllCancelData[index].cUSLASTCOMMENT : "comment here"}",style:  FontTextStyle.poppinsS14W4blackColor.copyWith(fontWeight: FontWeight.w400),),),
                ),
              ]);
            }),

          ),
        ),
      ),
    );
  }
}
