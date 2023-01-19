import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kelashakti/Views/dashboard/side_navbar.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/color_utils.dart';
import '../../Utils/fontFamily_utils.dart';
import '../Model/get_all_enquiry.dart';
import '../Model/get_all_users.dart';
import '../Services/api_service.dart';

class TeamListScreen extends StatefulWidget {
  const TeamListScreen({Key? key}) : super(key: key);

  @override
  State<TeamListScreen> createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  //List<GetAllActiveData> getAllTeamData =[];
  GetAllUser? getAllUser;

  Future<void> getAlluser({
    required BuildContext context,
  }) async {
    try {
      Map<String, dynamic> formdata = ({});
      final response = await Dio().get(
        'https://tinkubhaiya.provisioningtech.com/get_ajax/get_all_users/',
        queryParameters: formdata,
      );

      print("get  Api response data :- ");
      print(response.data);

      getAllUser = GetAllUser.fromJson(response.data);
      setState(() {
        getAllUser;
      });
    } on DioError catch (e) {
      print(e.toString());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAlluser(context: context);

  }
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      color: ColorUtils.appBgColor,
      child: SafeArea(
        child: Scaffold(
           // drawer: const SideNavBar(),
            appBar: AppBar(
              leading: BackButton(
                  color: Colors.white
              ),
              title: const Text("KelaShakti Traders"),
              backgroundColor: ColorUtils.blackColor,
            ),
            body:Container(
              child: getAllUser!.users!.length == 0  ? Center(child: Text("NO found data!"),): Container(
                color:ColorUtils.skyBlueColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,right: 15, left: 15, bottom: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("Team List",style: FontTextStyle.poppinsS18W4blackColor,),
                        SizedBox(height: 2.h,),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                DataTable(
                                  dataRowHeight: 10.h,
                                  border: TableBorder.all(

                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  columns: const [

                                    DataColumn(label: Text('Name'),tooltip: "name",),
                                    DataColumn(label: Text('Phone'),tooltip: "name"),
                                    DataColumn(label: Text('Address'),tooltip: "name"),
                                   // DataColumn(label: Text('Password'),tooltip: "name"),

                                  ],
                                  rows: List.generate(getAllUser!.users!.length, (index) {

                                    // int fill=int.parse("${getAllActiveData[index].fIELDPROCESS}");
                                    // int office=int.parse("${getAllActiveData[index].oFFICEPROCESS}");
                                    // int factory=int.parse("${getAllActiveData[index].fACTORYPROCESS}");
                                    print(getAllUser!.users![index].bRANCHNAME!);
                                    //  _msgController.text = getAllCancelData[index].cUSLASTCOMMENT!;

                                    return DataRow(cells: [
                                      DataCell(
                                          Text("${getAllUser!.users![index].bRANCHNAME!}")
                                      ),
                                      DataCell(
                                        Text("${getAllUser!.users![index].bRANCHCONTACT}"),
                                      ),
                                      DataCell(
                                        Text("${getAllUser!.users![index].bRANCHADDRESS}"),
                                      ),
                                      // DataCell(
                                      //   Text("${getAllUser!.users![index].bRANCHPASSWORD}"),
                                      // ),

                                    ]);
                                  }),

                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ),

      ),
    );

  }
}
