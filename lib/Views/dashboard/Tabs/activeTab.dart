import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kelashakti/Utils/fontFamily_utils.dart';
import 'package:kelashakti/Views/Services/api_service.dart';
import 'package:sizer/sizer.dart';
import '../../../Utils/color_utils.dart';
import '../../Model/get_all_enquiry.dart';
import '../../Services/Shared_preferance.dart';

class ActiveTab extends StatefulWidget {
  const ActiveTab({Key? key}) : super(key: key);

  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {

  List<GetAllActiveData> getAllActiveData = [];

  @override
  void initState() {
    super.initState();
    ApiService().active(context).then((value) {
     if(value!.message == "ok"){
       setState(() {
         getAllActiveData = value.users!;
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
              dataRowHeight: 12.h,
              border: TableBorder.all(

                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2),
              columns:  [
                DataColumn(label: SizedBox(  child: Text('Lead')),tooltip: "name",),
                DataColumn(label: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h,),
                  child: Column(
                    children: [
                      Text('Field', style: FontTextStyle.poppinsS14W4blackColor, ),
                      Text('Process',style: FontTextStyle.poppinsS14W4blackColor,),
                    ],
                  ),
                ),tooltip: "name"),
                DataColumn(label: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h,),
                  child: Column(
                    children: [
                      Text('Office', style: FontTextStyle.poppinsS14W4blackColor, ),
                      Text('Process',style: FontTextStyle.poppinsS14W4blackColor,),
                    ],
                  ),
                ),tooltip: "name"),
                DataColumn(label: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h,),
                  child: Column(
                    children: [
                      Text('Factory', style: FontTextStyle.poppinsS14W4blackColor, ),
                      Text('Process',style: FontTextStyle.poppinsS14W4blackColor,),
                    ],
                  ),
                ),tooltip: "name"),

              ],
              rows: List.generate(getAllActiveData.length, (index) {
                int fill=int.parse("${getAllActiveData[index].fIELDPROCESS}");
                int office=int.parse("${getAllActiveData[index].oFFICEPROCESS}");
                int factory=int.parse("${getAllActiveData[index].fACTORYPROCESS}");
                return DataRow(cells: [
                  DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${getAllActiveData[index].cUSNAME}"),
                        Text("${getAllActiveData[index].cUSPHONE}"),
                        Text("${getAllActiveData[index].cUSADDRESS}"),
                        Row(
                          children: [
                            Text("${getAllActiveData[index].fIELDPROCESS}"),
                            Text("${getAllActiveData[index].oFFICEPROCESS}"),
                            Text("${getAllActiveData[index].fACTORYPROCESS}"),
                          ],
                        ),
                      ],
                    )
                  ),
                  DataCell(
                     ///// Field Process///////
                     Row(
                       children:[
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 5),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   ////container 1/////
                                   GestureDetector(
                                     onTap: (){
                                       ////api//
                                       setState(() {
                                         if(fill>=1)
                                         getAllActiveData[index].isSelected0=true;
                                       });

                                       ///ALert box

                                       if(fill==0){
                                         showDialog(
                                           context: context,
                                           builder: (ctx) => AlertDialog(
                                             title: const Text("Update Field Process"),
                                             content: const Text("Are You Sure ?"),
                                             actions: <Widget>[

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
                                                       int message=fill+1;
                                                       String msg=message.toString();
                                                       var cusid=getAllActiveData[index].cUSID.toString();
                                                       String? userid = await Preferances.getString("userId");
                                                       Map<String,dynamic> data = {
                                                         "id" : cusid,"message" : msg ,"loginid" :userid
                                                       };
                                                       print("cusid:-" "${cusid}");
                                                       print("message::-" "${msg}");
                                                       print("login id::-" "${userid}");
                                                       if(fill==0){
                                                      await   ApiService().updateField(context,data: data);
                                                        await ApiService().active(context).then((value) {
                                                           if(value!.message == "ok"){
                                                             setState(() {
                                                               getAllActiveData = value.users!;
                                                               print("1st done");
                                                             });
                                                           }
                                                         });
                                                       }
                                                       else{
                                                         print("api not called");
                                                       }
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
                                         );
                                       }
                                       else if(fill>0){
                                         Fluttertoast.showToast(
                                             msg: 'Already Updated',
                                             backgroundColor: Colors.grey,
                                         );
                                       }else{
                                         Fluttertoast.showToast(
                                           msg: 'First Update Above Process',
                                           backgroundColor: Colors.grey,
                                         );
                                       }

                                       ///ok click per change api call  , get active data api call
                                     },
                                     child: Container(
                                       // Preferances.setString("userId", response.wPSID);
                                       margin:EdgeInsets.only(right: 1.h),
                                       height: 5.h,
                                       width: 8.w,
                                       decoration: BoxDecoration(
                                         color: fill>=1 ? ColorUtils.green : getAllActiveData[index].isSelected0 == true ? ColorUtils.green : ColorUtils.blackColor,
                                       //  color: fill>=0 ? ColorUtils.green : ColorUtils.blackColor,
                                         shape: BoxShape.circle,
                                       ),),
                                   ),
                                   ////container 2/////
                                   GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        if(fill>=2){
                                        getAllActiveData[index].isSelected1=true;
                                        }
                                      });
                                      if(fill==1){
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: const Text("Update Field Process"),
                                            content: const Text("Are You Sure ?"),
                                            actions: <Widget>[

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
                                                      int message=fill+1;
                                                      String msg=message.toString();
                                                      var cusid=getAllActiveData[index].cUSID.toString();
                                                      String? userid = await Preferances.getString("userId");
                                                      Map<String,dynamic> data = {
                                                        "id" : cusid,"message" : msg ,"loginid" :userid
                                                      };
                                                      print("wps:-" "${cusid}");
                                                      print("message" "${message}");
                                                      print("login id" "${userid}");
                                                      if(fill==1){
                                                       await ApiService().updateField(context,data: data);
                                                       await ApiService().active(context).then((value) {
                                                          if(value!.message == "ok"){
                                                            setState(() {
                                                              getAllActiveData = value.users!;
                                                              print("2 done");

                                                            });
                                                          }

                                                        });
                                                      }

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
                                        );
                                      }
                                      else if(fill>1){
                                        Fluttertoast.showToast(
                                          msg: 'Already Updated',
                                          backgroundColor: Colors.grey,
                                        );
                                      }
                                      else{
                                        Fluttertoast.showToast(
                                          msg: 'First Update Above Process',
                                          backgroundColor: Colors.grey,
                                        );
                                      }
                                    },
                                     child: Container(

                                      // margin:EdgeInsets.only(right: 0.5.h),
                                       height: 5.h,
                                       width: 8.w,
                                       decoration: BoxDecoration(
                                         color: fill>=2? ColorUtils.green : getAllActiveData[index].isSelected1== true ? ColorUtils.green : ColorUtils.blackColor,
                                         shape: BoxShape.circle,
                                       ),),
                                   )
                                 ],

                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         if(fill>=3){
                                           getAllActiveData[index].isSelected2=true;
                                         }
                                       });
                                       if(fill==2){
                                         showDialog(
                                           context: context,
                                           builder: (ctx) => AlertDialog(
                                             title: const Text("Update Field Process"),
                                             content: const Text("Are You Sure ?"),
                                             actions: <Widget>[

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
                                                       int message=fill+1;
                                                       String msg=message.toString();
                                                       var cusid=getAllActiveData[index].cUSID.toString();
                                                       String? userid = await Preferances.getString("userId");
                                                       Map<String,dynamic> data = {
                                                         "id" : cusid,"message" : msg ,"loginid" :userid
                                                       };
                                                       print("wps:-" "${cusid}");
                                                       print("message" "${message}");
                                                       print("login id" "${userid}");
                                                       if(fill==2){
                                                        await ApiService().updateField(context,data: data);
                                                         await ApiService().active(context).then((value) {
                                                           if(value!.message == "ok"){
                                                             setState(() {
                                                               getAllActiveData = value.users!;
                                                               print("3 done");

                                                             });
                                                           }

                                                         });
                                                       }

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
                                         );
                                       }
                                       else if(fill>2){
                                         Fluttertoast.showToast(
                                           msg: 'Already Updated',
                                           backgroundColor: Colors.grey,
                                         );
                                       }
                                       else{
                                         Fluttertoast.showToast(
                                           msg: 'First Update Above Process',
                                           backgroundColor: Colors.grey,
                                         );
                                       }
                                     },
                                     child: Container(
                                       margin:EdgeInsets.only(right: 1.h),
                                       height: 5.h,
                                       width: 8.w,
                                       decoration: BoxDecoration(
                                         color: fill>=3 ? ColorUtils.green : getAllActiveData[index].isSelected2== true ? ColorUtils.green : ColorUtils.blackColor,
                                         shape: BoxShape.circle,
                                       ),),
                                   ),
                                   GestureDetector( onTap: (){
                                     setState(() {
                                       if(fill>=4){
                                         getAllActiveData[index].isSelected3=true;
                                       }
                                     });
                                     if(fill==3){
                                       showDialog(
                                         context: context,
                                         builder: (ctx) => AlertDialog(
                                           title: const Text("Update Field Process"),
                                           content: const Text("Are You Sure ?"),
                                           actions: <Widget>[

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
                                                     int message=fill+1;
                                                     String msg=message.toString();
                                                     var cusid=getAllActiveData[index].cUSID.toString();
                                                     String? userid = await Preferances.getString("userId");
                                                     Map<String,dynamic> data = {
                                                       "id" : cusid,"message" : msg ,"loginid" :userid
                                                     };
                                                     print("wps:-" "${cusid}");
                                                     print("message" "${message}");
                                                     print("login id" "${userid}");
                                                     if(fill==3){
                                                      await ApiService().updateField(context,data: data);
                                                      await ApiService().active(context).then((value) {
                                                         if(value!.message == "ok"){
                                                           setState(() {
                                                             getAllActiveData = value.users!;
                                                             print("4 done");

                                                           });
                                                         }

                                                       });
                                                     }

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
                                       );
                                     }
                                     else if(fill>3){
                                       Fluttertoast.showToast(
                                         msg: 'Already Updated',
                                         backgroundColor: Colors.grey,
                                       );
                                     }
                                     else{
                                       Fluttertoast.showToast(
                                         msg: 'First Update Above Process',
                                         backgroundColor: Colors.grey,
                                       );
                                     }

                                   },
                                     child: Container(
                                      // margin:EdgeInsets.only(right: 0.5.h),
                                       height: 5.h,
                                       width: 8.w,
                                       decoration: BoxDecoration(
                                         color: fill>=4? ColorUtils.green : getAllActiveData[index].isSelected3== true ? ColorUtils.green : ColorUtils.blackColor,
                                         shape: BoxShape.circle,
                                       ),),
                                   )
                                 ],

                               )
                             ],
                           ),
                         )
                       ]
                     ),
                  ),
                  DataCell(
                    ///// Office Process///////
                    Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        ////api//
                                        setState(() {
                                          if(fill==4 && office>=1)
                                            getAllActiveData[index].isOffice0=true;
                                        });

                                        ///ALert box

                                        if(fill==4 && office==0){
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text("Update Field Process"),
                                              content: const Text("Are You Sure ?"),
                                              actions: <Widget>[

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
                                                        int message=office+1;
                                                        String msg=message.toString();
                                                        var cusid=getAllActiveData[index].cUSID.toString();
                                                        String? userid = await Preferances.getString("userId");
                                                        Map<String,dynamic> data = {
                                                          "id" : cusid,"message" : msg ,"loginid" :userid
                                                        };
                                                        print("cusid:-" "${cusid}");
                                                        print("message::-" "${msg}");
                                                        print("login id::-" "${userid}");
                                                        if(fill==4 && office==0){
                                                        await  ApiService().updateOffice(context,data: data);
                                                         await ApiService().active(context).then((value) {
                                                            if(value!.message == "ok"){
                                                              setState(() {
                                                                getAllActiveData = value.users!;
                                                                print("1st done");
                                                              });
                                                            }
                                                          });
                                                        }
                                                        else{
                                                          print("api not called");
                                                        }
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
                                          );
                                        }
                                        else if(fill==4 && office>0){
                                          Fluttertoast.showToast(
                                            msg: 'Already Updated',
                                            backgroundColor: Colors.grey,
                                          );
                                        }else{
                                          Fluttertoast.showToast(
                                            msg: 'First Update Above Process',
                                            backgroundColor: Colors.grey,
                                          );
                                        }

                                        ///ok click per change api call  , get active data api call
                                      },
                                      child: Container(
                                        // Preferances.setString("userId", response.wPSID);
                                        margin:EdgeInsets.only(right: 1.h),
                                        height: 5.h,
                                        width: 8.w,
                                        decoration: BoxDecoration(
                                          color: office>=1 ? ColorUtils.
                                          green : getAllActiveData[index].isOffice0 == true ? ColorUtils.green : ColorUtils.blackColor,
                                          //  color: fill>=0 ? ColorUtils.green : ColorUtils.blackColor,
                                          shape: BoxShape.circle,
                                        ),),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        ////api//
                                        setState(() {
                                          if(fill==4 && office>=2)
                                            getAllActiveData[index].isOffice1=true;
                                        });

                                        ///ALert box

                                        if(fill==4 && office==1){
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text("Update Field Process"),
                                              content: const Text("Are You Sure ?"),
                                              actions: <Widget>[

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
                                                        int message=office+1;
                                                        String msg=message.toString();
                                                        var cusid=getAllActiveData[index].cUSID.toString();
                                                        String? userid = await Preferances.getString("userId");
                                                        Map<String,dynamic> data = {
                                                          "id" : cusid,"message" : msg ,"loginid" :userid
                                                        };
                                                        print("cusid:-" "${cusid}");
                                                        print("message::-" "${msg}");
                                                        print("login id::-" "${userid}");
                                                        if(fill==4 && office==1){
                                                        await  ApiService().updateOffice(context,data: data);
                                                         await ApiService().active(context).then((value) {
                                                            if(value!.message == "ok"){
                                                              setState(() {
                                                                getAllActiveData = value.users!;
                                                                print("1st done");
                                                              });
                                                            }
                                                          });
                                                        }
                                                        else{
                                                          print("api not called");
                                                        }
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
                                          );
                                        }
                                        else if(fill==4 && office>1){
                                          Fluttertoast.showToast(
                                            msg: 'Already Updated',
                                            backgroundColor: Colors.grey,
                                          );
                                        }else{
                                          Fluttertoast.showToast(
                                            msg: 'First Update Above Process',
                                            backgroundColor: Colors.grey,
                                          );
                                        }

                                        ///ok click per change api call  , get active data api call
                                      },
                                      child: Container(
                                        // Preferances.setString("userId", response.wPSID);

                                        height: 5.h,
                                        width: 8.w,
                                        decoration: BoxDecoration(
                                          color: office>=2 ? ColorUtils.green : getAllActiveData[index].isOffice1 == true ? ColorUtils.green : ColorUtils.blackColor,
                                          //  color: fill>=0 ? ColorUtils.green : ColorUtils.blackColor,
                                          shape: BoxShape.circle,
                                        ),),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        ////api//
                                        setState(() {
                                          if(fill==4 && office>=2)
                                            getAllActiveData[index].isOffice2=true;
                                        });

                                        ///ALert box

                                        if(fill==4 && office==2){
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text("Update Field Process"),
                                              content: const Text("Are You Sure ?"),
                                              actions: <Widget>[

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
                                                        int message=office+1;
                                                        String msg=message.toString();
                                                        var cusid=getAllActiveData[index].cUSID.toString();
                                                        String? userid = await Preferances.getString("userId");
                                                        Map<String,dynamic> data = {
                                                          "id" : cusid,"message" : msg ,"loginid" :userid
                                                        };
                                                        print("cusid:-" "${cusid}");
                                                        print("message::-" "${msg}");
                                                        print("login id::-" "${userid}");
                                                        if(fill==4 && office==2){
                                                        await  ApiService().updateOffice(context,data: data);
                                                         await ApiService().active(context).then((value) {
                                                            if(value!.message == "ok"){
                                                              setState(() {
                                                                getAllActiveData = value.users!;
                                                                print("1st done");
                                                              });
                                                            }
                                                          });
                                                        }
                                                        else{
                                                          print("api not called");
                                                        }
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
                                          );
                                        }
                                        else if(fill==4 && office>2){
                                          Fluttertoast.showToast(
                                            msg: 'Already Updated',
                                            backgroundColor: Colors.grey,
                                          );
                                        }else{
                                          Fluttertoast.showToast(
                                            msg: 'First Update Above Process',
                                            backgroundColor: Colors.grey,
                                          );
                                        }

                                        ///ok click per change api call  , get active data api call
                                      },
                                      child: Container(
                                        // Preferances.setString("userId", response.wPSID);
                                        margin:EdgeInsets.only(right: 1.h),
                                        height: 5.h,
                                        width: 8.w,
                                        decoration: BoxDecoration(
                                          color: office>=3 ? ColorUtils.
                                          green : getAllActiveData[index].isOffice2 == true ? ColorUtils.green : ColorUtils.blackColor,
                                          //  color: fill>=0 ? ColorUtils.green : ColorUtils.blackColor,
                                          shape: BoxShape.circle,
                                        ),),
                                    ),

                                  ],
                                )

                              ],
                            ),
                          )
                        ]
                    ),
                  ),
                  DataCell(
                    ///// Factory Process///////
                    Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        ////api//
                                        setState(() {
                                          if(office==3 && factory>=1)
                                            getAllActiveData[index].isFactory0=true;
                                        });

                                        ///ALert box

                                        if(office==3 && factory==0){
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text("Update Field Process"),
                                              content: const Text("Are You Sure ?"),
                                              actions: <Widget>[

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
                                                        int message=factory+1;
                                                        String msg=message.toString();
                                                        var cusid=getAllActiveData[index].cUSID.toString();
                                                        String? userid = await Preferances.getString("userId");
                                                        Map<String,dynamic> data = {
                                                          "id" : cusid,"message" : msg ,"loginid" :userid
                                                        };
                                                        print("cusid:-" "${cusid}");
                                                        print("message::-" "${msg}");
                                                        print("login id::-" "${userid}");
                                                        if(office==3 && factory==0){
                                                        await  ApiService().updateFactory(context,data: data);
                                                          await ApiService().active(context).then((value) {
                                                            if(value!.message == "ok"){
                                                              setState(() {
                                                                getAllActiveData = value.users!;
                                                                print("1st done");
                                                              });
                                                            }
                                                          });
                                                        }
                                                        else{
                                                          print("api not called");
                                                        }
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
                                          );
                                        }
                                        else if(office==3 && factory>0){
                                          Fluttertoast.showToast(
                                            msg: 'Already Updated',
                                            backgroundColor: Colors.grey,
                                          );
                                        }else{
                                          Fluttertoast.showToast(
                                            msg: 'First Update Above Process',
                                            backgroundColor: Colors.grey,
                                          );
                                        }

                                        ///ok click per change api call  , get active data api call
                                      },
                                      child: Container(
                                        // Preferances.setString("userId", response.wPSID);
                                        margin:EdgeInsets.only(right: 1.h),
                                        height: 5.h,
                                        width: 8.w,
                                        decoration: BoxDecoration(
                                          color: factory>=1 ? ColorUtils.
                                          green : getAllActiveData[index].isFactory0 == true ? ColorUtils.green : ColorUtils.blackColor,
                                          //  color: fill>=0 ? ColorUtils.green : ColorUtils.blackColor,
                                          shape: BoxShape.circle,
                                        ),),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        ////api//
                                        setState(() {
                                          if(office==3 && factory>=2)
                                            getAllActiveData[index].isFactory1=true;
                                        });

                                        ///ALert box

                                        if(office==3 && factory==1){
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text("Update Field Process"),
                                              content: const Text("Are You Sure ?"),
                                              actions: <Widget>[

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
                                                        int message=factory+1;
                                                        String msg=message.toString();
                                                        var cusid=getAllActiveData[index].cUSID.toString();
                                                        String? userid = await Preferances.getString("userId");
                                                        Map<String,dynamic> data = {
                                                          "id" : cusid,"message" : msg ,"loginid" :userid
                                                        };
                                                        print("cusid:-" "${cusid}");
                                                        print("message::-" "${msg}");
                                                        print("login id::-" "${userid}");
                                                        if(office==3 && factory==1){
                                                          await  ApiService().updateFactory(context,data: data);
                                                          await ApiService().active(context).then((value) {
                                                            if(value!.message == "ok"){
                                                              setState(() {
                                                                getAllActiveData = value.users!;
                                                                print("1st done");
                                                              });
                                                            }
                                                          });
                                                        }
                                                        else{
                                                          print("api not called");
                                                        }
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
                                          );
                                        }
                                        else if(office==3 && factory>1){
                                          Fluttertoast.showToast(
                                            msg: 'Already Updated',
                                            backgroundColor: Colors.grey,
                                          );
                                        }else{
                                          Fluttertoast.showToast(
                                            msg: 'First Update Above Process',
                                            backgroundColor: Colors.grey,
                                          );
                                        }

                                        ///ok click per change api call  , get active data api call
                                      },
                                      child: Container(
                                        // Preferances.setString("userId", response.wPSID);
                                        margin:EdgeInsets.only(right: 1.h),
                                        height: 5.h,
                                        width: 8.w,
                                        decoration: BoxDecoration(
                                          color: factory>=2 ? ColorUtils.
                                          green : getAllActiveData[index].isFactory1 == true ? ColorUtils.green : ColorUtils.blackColor,
                                          //  color: fill>=0 ? ColorUtils.green : ColorUtils.blackColor,
                                          shape: BoxShape.circle,
                                        ),),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        ////api//
                                        setState(() {
                                          if(office==3 && factory>=3)
                                            getAllActiveData[index].isFactory2=true;
                                        });

                                        ///ALert box

                                        if(office==3 && factory==2){
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text("Update Field Process"),
                                              content: const Text("Are You Sure ?"),
                                              actions: <Widget>[

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
                                                        int message=factory+1;
                                                        String msg=message.toString();
                                                        var cusid=getAllActiveData[index].cUSID.toString();
                                                        String? userid = await Preferances.getString("userId");
                                                        Map<String,dynamic> data = {
                                                          "id" : cusid,"message" : msg ,"loginid" :userid
                                                        };
                                                        print("cusid:-" "${cusid}");
                                                        print("message::-" "${msg}");
                                                        print("login id::-" "${userid}");
                                                        if(office==3 && factory==2){
                                                          await  ApiService().updateFactory(context,data: data);
                                                          await ApiService().active(context).then((value) {
                                                            if(value!.message == "ok"){
                                                              setState(() {
                                                                getAllActiveData = value.users!;
                                                                print("1st done");
                                                                Fluttertoast.showToast(
                                                                  msg: 'All Process Completed',
                                                                  backgroundColor: Colors.grey,
                                                                );
                                                              });
                                                            }
                                                          });
                                                        }
                                                        else{
                                                          print("api not called");
                                                        }
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
                                          );
                                        }
                                        else if(office==3 && factory>2){
                                          Fluttertoast.showToast(
                                            msg: 'Already Updated',
                                            backgroundColor: Colors.grey,
                                          );
                                        }else{
                                          Fluttertoast.showToast(
                                            msg: 'First Update Above Process',
                                            backgroundColor: Colors.grey,
                                          );
                                        }

                                        ///ok click per change api call  , get active data api call
                                      },
                                      child: Container(
                                        // Preferances.setString("userId", response.wPSID);
                                        margin:EdgeInsets.only(right: 1.h),
                                        height: 5.h,
                                        width: 8.w,
                                        decoration: BoxDecoration(
                                          color: factory>=3 ? ColorUtils.green : getAllActiveData[index].isFactory2 == true ? ColorUtils.green : ColorUtils.blackColor,
                                          //  color: fill>=0 ? ColorUtils.green : ColorUtils.blackColor,
                                          shape: BoxShape.circle,
                                        ),),
                                    ),

                                  ],
                                )

                              ],
                            ),
                          )
                        ]
                    ),
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
