import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kelashakti/Views/Model/get_all_complete.dart';
import 'package:kelashakti/Views/Model/login_model.dart';
import 'package:kelashakti/Views/Services/Shared_preferance.dart';
import 'package:kelashakti/Views/Services/api_endpoint.dart';
import '../../Utils/loader.dart';
import '../Model/common_model.dart';
import '../Model/get_all_cancel.dart';
import '../Model/get_all_enquiry.dart';
import '../Model/refer_list_model.dart';
import 'dio_client.dart';
import 'package:http/http.dart' as http;
Dio dio = Dio();
class ApiService {
  ApiClient apiClient = ApiClient();

  Future<LoginModel?> login(BuildContext context, {
    FormData? data,
  }) async {
    try {
      Loader.showLoader();
      print("login try");
      Response response;
      response = await dio.post(ApiEndPoints.loginApi,
          options: Options(headers: {
            "Client-Service": 'frontend-client',
            'Auth-Key': 'simplerestapi'
          }),
          data: data);
      LoginModel responseData =
      LoginModel.fromJson(response.data);
      if (responseData.message == "ok") {
        var cookies = response.headers['set-cookie'];
        print("cookies:=${cookies![0].split(';')[0]}");

        debugPrint('login data  ----- > ${response.data}');

        Preferances.setString("userId", responseData.id);
        Preferances.setString("userToken", responseData.token);
        Preferances.setString("userType", responseData.type);
        Preferances.setString("cookie",cookies[0].split(';')[0]);
        Fluttertoast.showToast(
          msg: 'Login Sucessfully...',
          backgroundColor: Colors.grey,
        );
        Loader.hideLoader();
        return responseData;
      } else {
        Fluttertoast.showToast(
          msg: "invalied",
          backgroundColor: Colors.grey,
        );
        Loader.hideLoader();

        throw Exception(response.data);
      }
    } on DioError catch (e) {
      print("dio");
      debugPrint('Dio E  $e');
      Loader.hideLoader();
    }
  }

  Future addAccount(BuildContext context, {
    Map? data,
  }) async {
    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      String? cookie = await Preferances.getString("cookie");

      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/add_account/";
      var response = await http.post(
        Uri.parse(url),
        headers: { "Client-Service": 'frontend-client',
          "Auth-Key": 'simplerestapi',
          'User-ID': userid!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Authorization':token!.replaceAll('"', '').replaceAll('"', '').toString(),
          'type': type!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Cookie': cookie!.replaceAll('"', '').replaceAll('"', '').toString(),
        },
        body: data,);
      if (response.statusCode == 200) {
        debugPrint('add account  ----- > ${response.body}');
        // CommonModel responseData =
        // CommonModel.fromJson(response.body);
        //return responseData;
        Loader.hideLoader();
      } else {
        Loader.hideLoader();
        throw Exception(response.body);

      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
    }
  }

  Future referList(BuildContext context) async {
    try {
      Response response;
      response = await dio.get(ApiEndPoints.referListApi);

      print("Response:= ${response.data}");

      if (response.statusCode == 200) {
        ReferListModel referListModel = ReferListModel.fromJson(response.data);
        return referListModel;
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      debugPrint('Dio E $e');
    }
  }

  Future enquire(BuildContext context, {
    Map? data,
  }) async {
    print("1");

    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      print("2");

      // Response response;
      print("3");
      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/add_customer_enquiry/";
      var response = await http.post(
        Uri.parse(url),
        headers: { "Client-Service": 'frontend-client',
          "Auth-Key": 'simplerestapi',
          "User-ID": "1",
          "Authorization": token.toString(),
          "type": "1",},
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
      if (response.statusCode == 200) {
        Loader.hideLoader();
        print("5");
        debugPrint('add account  ----- > ${response.body}');
        // CommonModel responseData =
        // CommonModel.fromJson(response.body);
        // return responseData;
      } else {
        print("6");
        Loader.hideLoader();
        throw Exception(response.body);
      }
    } on DioError catch (e) {
      print("7");
      debugPrint('Dio E  $e');
      Loader.hideLoader();
    }



  }

  Future<GetAllActiveModel?> active(BuildContext context) async {
    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? type = await Preferances.getString("userType");
      var formData = FormData.fromMap({
        'id': userid, 'type': type, 'status': 0,
      });
      Response response;
      response = await dio.post(ApiEndPoints.getAllApi,
        data: formData,
      );
      if (response.statusCode == 200) {
        GetAllActiveModel getAllActive = GetAllActiveModel.fromJson(
            response.data);
        print(response.data);
        Loader.hideLoader();
        return getAllActive;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
    }
  }

///////////////////////////////// complete tab //////////////////////////////

  Future<GetAllComplete?> complete(BuildContext context) async {
    try {
      String? userid = await Preferances.getString("userId");
      String? type = await Preferances.getString("userType");
      var formData = FormData.fromMap({
        'id': userid, 'type': type, 'status': 2,
      });
      Response response;
      response = await dio.post(ApiEndPoints.getAllApi,
        data: formData,

      );
      print(response.data);

      if (response.statusCode == 200) {
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

  ///////////////////////////////// complete tab //////////////////////////////

  Future<GetAllCancel?> cancel(BuildContext context) async {
    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? type = await Preferances.getString("userType");
      var formData = FormData.fromMap({
        'id': userid, 'type': type, 'status': 3,
      });
      Response response;
      response = await dio.post(ApiEndPoints.getAllApi,
        data: formData,

      );
      print(response.data);

      if (response.statusCode == 200) {
        GetAllCancel getAllCancel = GetAllCancel.fromJson(response.data);
        print(response.data);
        Loader.hideLoader();
        return getAllCancel;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      print("active api dio");
      debugPrint('Dio E  $e');
    }
    return null;
  }



/////////////////////////////////  Update Feild //////////////////////////////

  // Future updateField(BuildContext context, {
  //   Map? data,
  // }) async {
  //   try {
  //     String? userid = await Preferances.getString("userId");
  //     String? token = await Preferances.getString("userToken");
  //     String? type = await Preferances.getString("userType");
  //
  //     var url ="https://tinkubhaiya.provisioningtech.com/post_ajax/update_field_process/";
  //     var response = await http.post(
  //       Uri.parse(url),
  //       headers:{  "Client-Service":'frontend-client',
  //         "Auth-Key":'simplerestapi',
  //         "User-ID":userid.toString(),
  //         "Authorization":token.toString(),
  //         "type":type.toString(),} ,
  //       body: data,);
  //     if (response.statusCode == 200) {
  //       debugPrint('add account  ----- > ${response.body}');
  //       print("updated");
  //       // CommonModel responseData =
  //       // CommonModel.fromJson(response.body);
  //       //return responseData;
  //     } else {
  //       print("not updated");
  //       throw Exception(response.body);
  //     }
  //   } on DioError catch (e) {
  //     print("not d updated");
  //     debugPrint('Dio E  $e');
  //   }
  //
  //
  // }

  Future updateField(BuildContext context, {
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
      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/update_field_process/";
      var response = await http.post(
        Uri.parse(url),
        // headers: { "Client-Service": 'frontend-client',
        //   "Auth-Key": 'simplerestapi',
        //   "User-ID": "1",
        //   "Authorization": token.toString(),
        //   "type": "1",},
        body: data,

      );
      print("4");
      if (response.statusCode == 200) {
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
  }

  Future updateOffice(BuildContext context, {
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
      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/update_office_process/";
      var response = await http.post(
        Uri.parse(url),
        // headers: { "Client-Service": 'frontend-client',
        //   "Auth-Key": 'simplerestapi',
        //   "User-ID": "1",
        //   "Authorization": token.toString(),
        //   "type": "1",},
        body: data,

      );
      print("4");
      if (response.statusCode == 200) {
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
  }

  Future updateFactory(BuildContext context, {
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
      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/update_factory_process/";
      var response = await http.post(
        Uri.parse(url),
        // headers: { "Client-Service": 'frontend-client',
        //   "Auth-Key": 'simplerestapi',
        //   "User-ID": "1",
        //   "Authorization": token.toString(),
        //   "type": "1",},
        body: data,

      );
      print("4");
      if (response.statusCode == 200) {
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
  }

  Future updateComment(BuildContext context, {
    Map? data,
  }) async {
    print("1");
    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      print("2");

      // Response response;
      print("3");
      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/update_comment_message/";
      var response = await http.post(

        Uri.parse(url),
        // headers: { "Client-Service": 'frontend-client',
        //   "Auth-Key": 'simplerestapi',
        //   "User-ID": "1",
        //   "Authorization": token.toString(),
        //   "type": "1",},
        body: data,

      );
      print("4");
      if (response.statusCode == 200) {
        print("5");
        debugPrint('add account  ----- > ${response.body}');
        Loader.hideLoader();
        // CommonModel responseData =
        // CommonModel.fromJson(response.body);
        // return responseData;
      } else {
        print("6");
        Loader.hideLoader();
        throw Exception(response.body);

      }
    } on DioError catch (e) {
      print("7");
      debugPrint('Dio E  $e');
      Loader.hideLoader();
    }
  }

}
