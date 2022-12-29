import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Views/Model/get_all_complete.dart';
import 'package:kelashakti/Views/Model/login_model.dart';
import 'package:kelashakti/Views/Services/Shared_preferance.dart';
import 'package:kelashakti/Views/Services/api_endpoint.dart';
import '../Model/common_model.dart';
import '../Model/get_all_enquiry.dart';
import '../Model/refer_list_model.dart';
import 'dio_client.dart';
import 'package:http/http.dart' as http;
Dio dio = Dio();
class ApiService {
  ApiClient apiClient = ApiClient();

  Future login(BuildContext context, {
    FormData? data,
  }) async {
    try {
      print("login try");
      Response response;
      response = await dio.post(ApiEndPoints.loginApi,
          options: Options(headers: {
            "Client-Service": 'frontend-client',
            'Auth-Key': 'simplerestapi'
          }),
          data: data);
      if (response.statusCode == 200) {

        debugPrint('login data  ----- > ${response.data}');
        LoginModel responseData =
        LoginModel.fromJson(response.data);
        Preferances.setString("userId", responseData.id);
        Preferances.setString("userToken", responseData.token);
        Preferances.setString("userType", responseData.type);


        return responseData;
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      print("dio");
      debugPrint('Dio E  $e');
    }



  }

  Future addAccount(BuildContext context, {
    Map? data,
  }) async {

    try {
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");

      var url ="https://tinkubhaiya.provisioningtech.com/post_ajax/add_account/";
      var response = await http.post(
          Uri.parse(url),
          headers:{  "Client-Service":'frontend-client',
            "Auth-Key":'simplerestapi',
            "User-ID":userid.toString(),
            "Authorization":token.toString(),
            "type":type.toString(),} ,
          body: data,);
      if (response.statusCode == 200) {
        debugPrint('add account  ----- > ${response.body}');
        // CommonModel responseData =
        // CommonModel.fromJson(response.body);
        //return responseData;
      } else {
        throw Exception(response.body);
      }
    } on DioError catch (e) {
      debugPrint('Dio E  $e');
    }


  }

  Future referList(BuildContext context) async{
    try{
      Response response;
      response = await dio.get(ApiEndPoints.referListApi);

      print("Response:= ${response.data}");

      if(response.statusCode == 200){
        ReferListModel referListModel = ReferListModel.fromJson(response.data);
        return referListModel;
      }else{
        throw Exception(response.data);
      }


    }on DioError catch(e){
      debugPrint('Dio E $e');
    }

}

  Future enquire(BuildContext context, {
    Map? data,
  }) async {
    print("1");

    try {
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      print("2");

     // Response response;
      print("3");
      var url ="https://tinkubhaiya.provisioningtech.com/post_ajax/add_customer_enquiry/";
      var response = await http.post(
        Uri.parse(url),
          headers:{  "Client-Service":'frontend-client',
            "Auth-Key":'simplerestapi',
            "User-ID":"1",
            "Authorization":token.toString(),
            "type":"1",} ,
          body: data,

      );
      // response = await dio.post(ApiEndPoints.enquireApi,
      //     options: Options(headers: {
      //       "Client-Service":'frontend-client',
      //       "Auth-Key":'simplerestapi',
      //       "User-ID":"1",
      //       "Authorization":token,
      //       "type":"1",
      //     }),
      //     data: data);
      print("4");
      if (response.statusCode == 200 ) {
        print("5");
        debugPrint('add account  ----- > ${response.body}');
        // CommonModel responseData =
        // CommonModel.fromJson(response.body);
       // return responseData;
      } else {
        print("6");
        throw Exception(response.body);
      }
    } on DioError catch (e) {
      print("7");
      debugPrint('Dio E  $e');
    }


    // try {
    // Center(child: CircularProgressIndicator(),);
    //   Response apiResponse =
    //   await apiClient.post(ApiEndPoints.loginApi, data: data,options: Options( headers: {
    //     "Client-Service": "frontend-client",
    //     "Auth-Key": "simplerestapi"
    //   },));
    //   if (apiResponse != null) {
    //     if (apiResponse.statusCode == 200) {
    //       LoginModel loginModel = LoginModel.fromJson(apiResponse.data);
    //       print("LOginModel := $loginModel");
    //       Preferances.setString("userToken", loginModel.token);
    //       Preferances.setString("userId", loginModel.id);
    //
    //       CommonFunctions.toast("Login successfully");
    //
    //       return loginModel;
    //     } else {
    //       CommonFunctions.toast(apiResponse.statusMessage.toString());
    //     }
    //   }
    // } on DioError catch (e) {
    //   final errorMessage = DioExceptions.fromDioError(e).toString();
    //   CommonFunctions.toast(errorMessage);
    //   // Loader.hideLoader();
    //   return;
    // } finally {
    //   // Loader.hideLoader();
    // }
  }
///////////////////////////////// active tab //////////////////////////////
  Future<GetAllActiveModel?> active( BuildContext context) async {

    try {

      String? userid = await Preferances.getString("userId");
      String? type = await Preferances.getString("userType");
      var formData = FormData.fromMap({
        'id':userid,'type':type,'status':0,
      });
      Response response;
      response = await dio.post(ApiEndPoints.getAllApi,
        data: formData,

      );
      print(response.data);

      if(response.statusCode == 200){
        GetAllActiveModel getAllActive = GetAllActiveModel.fromJson(response.data);
        print(response.data);
        return getAllActive;
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      print("active api dio");
      debugPrint('Dio E  $e');
    }
  }

///////////////////////////////// complete tab //////////////////////////////

  Future<GetAllComplete?> complete( BuildContext context) async {

    try {

      String? userid = await Preferances.getString("userId");
      String? type = await Preferances.getString("userType");
      var formData = FormData.fromMap({
        'id':userid,'type':type,'status':1,
      });
      Response response;
      response = await dio.post(ApiEndPoints.getAllApi,
        data: formData,

      );
      print(response.data);

      if(response.statusCode == 200){
        GetAllComplete getAllComplete = GetAllComplete.fromJson(response.data);
        print(response.data);
        return getAllComplete;
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      print("active api dio");
      debugPrint('Dio E  $e');
    }
    return null;
  }




}




