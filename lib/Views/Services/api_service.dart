import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelashakti/Views/Model/login_model.dart';
import 'package:kelashakti/Views/Services/Shared_preferance.dart';
import 'package:kelashakti/Views/Services/api_endpoint.dart';
import '../Model/common_model.dart';
import '../Model/refer_list_model.dart';
import 'dio_client.dart';
Dio dio = Dio();
class ApiService {
  ApiClient apiClient = ApiClient();

  Future login(BuildContext context, {
    FormData? data,
  }) async {
    try {
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
      debugPrint('Dio E  $e');
    }



  }

  Future addAccount(BuildContext context, {
    FormData? data,
  }) async {
    try {
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      debugPrint("url := ${ApiEndPoints.addAccountApi}");
      debugPrint("userId := $userid");
      debugPrint("token := $token");
      debugPrint("type := $type");


      Response response;
      response = await dio.post("https://tinkubhaiya.provisioningtech.com/post_ajax/add_account/",
          options: Options(headers: {
            "Client-Service":'frontend-client',
            'Auth-Key':'simplerestapi',
            "User-ID":userid,
            "Authorization":token,
            "type":type
          }),
          data: data);
      if (response.statusCode == 200) {
        debugPrint('add account  ----- > ${response.data}');
        CommonModel responseData =
        CommonModel.fromJson(response.data);
        return responseData;
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e) {
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

}