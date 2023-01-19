import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kelashakti/Views/Model/get_all_complete.dart';
import 'package:kelashakti/Views/Model/login_model.dart';
import 'package:kelashakti/Views/Model/search_model.dart';
import 'package:kelashakti/Views/Model/submited_model.dart';
import 'package:kelashakti/Views/Model/visited_model.dart';
import 'package:kelashakti/Views/Services/Shared_preferance.dart';
import 'package:kelashakti/Views/Services/api_endpoint.dart';
import '../../Utils/loader.dart';
import '../Model/acceptModel.dart';
import '../Model/alert_model.dart';
import '../Model/common_model.dart';
import '../Model/get_all_cancel.dart';
import '../Model/get_all_enquiry.dart';
import '../Model/refer_list_model.dart';
import '../dashboard/bottomNavBar2.dart';
import '../dashboard/bottomNavbar.dart';
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
        if(responseData.type==1){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          const BottomNavBar(0)), (Route<dynamic> route) => false);
        }else if(responseData.type==2){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          const BottomNavBar2()), (Route<dynamic> route) => false);
        }
        Fluttertoast.showToast(
          msg: 'Login Sucessfully...',
          backgroundColor: Colors.grey,
        );
        Loader.hideLoader();
        return responseData;
      } else {
        Fluttertoast.showToast(
          msg: "invalid",
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

        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: "Successfully Added...",
          backgroundColor: Colors.grey,
        );

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

        body: data,

      );

      print("4");
      if (response.statusCode == 200) {
        Loader.hideLoader();
        print("5");
        debugPrint('add account  ----- > ${response.body}');
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
        'id': userid?.replaceAll('"', '').replaceAll('"', '').toString(),
       'type': type?.replaceAll('"', '').replaceAll('"', '').toString(),
        'status': 0,

      });
      print(userid?.replaceAll('"', '').replaceAll('"', '').toString(),);
      print(type?.replaceAll('"', '').replaceAll('"', '').toString(),);
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



  Future<GetAllComplete?> complete(BuildContext context) async {
    try {
      String? userid = await Preferances.getString("userId");
      String? type = await Preferances.getString("userType");
      var formData = FormData.fromMap({
        'id': userid?.replaceAll('"', '').replaceAll('"', '').toString(),
        'type': type?.replaceAll('"', '').replaceAll('"', '').toString(),
        'status': 2,
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



  Future<GetAllCancel?> cancel(BuildContext context) async {
    try {
     Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? type = await Preferances.getString("userType");
      var formData = FormData.fromMap({
        'id': userid?.replaceAll('"', '').replaceAll('"', '').toString(),
        'type': type?.replaceAll('"', '').replaceAll('"', '').toString(),
        'status': 3,
      });
      Response response;
      response = await dio.post(ApiEndPoints.getAllApi,
        data: formData,
      );
      print(response.data);

      if (response.statusCode == 200) {
        GetAllCancel getAllCancel = GetAllCancel.fromJson(response.data);
        Loader.hideLoader();
        return getAllCancel;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
    }
    return null;
  }




  Future updateField(BuildContext context, {
    Map? data,
  }) async {
    try {
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      String? cookie = await Preferances.getString("cookie");

      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/update_field_process/";
      var response = await http.post(
        Uri.parse(url),
        headers: { "Client-Service": 'frontend-client',
          "Auth-Key": 'simplerestapi',
          'User-ID': userid!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Authorization':token!.replaceAll('"', '').replaceAll('"', '').toString(),
          'type': type!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Cookie': cookie!.replaceAll('"', '').replaceAll('"', '').toString(),
        },
        body: data,
      );
      if (response.statusCode == 200) {
        debugPrint('add account  ----- > ${response.body}');
      } else {
        throw Exception(response.body);
      }
    } on DioError catch (e) {
      debugPrint('Dio E  $e');
    }
  }

  Future updateOffice(BuildContext context, {
    Map? data,
  }) async {

    try {
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      String? cookie = await Preferances.getString("cookie");
      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/update_office_process/";
      var response = await http.post(
        Uri.parse(url),
        headers: { "Client-Service": 'frontend-client',
          "Auth-Key": 'simplerestapi',
          'User-ID': userid!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Authorization':token!.replaceAll('"', '').replaceAll('"', '').toString(),
          'type': type!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Cookie': cookie!.replaceAll('"', '').replaceAll('"', '').toString(),
        },
        body: data,

      );

      if (response.statusCode == 200) {
        debugPrint('add account  ----- > ${response.body}');
      } else {
        throw Exception(response.body);
      }
    } on DioError catch (e) {
      debugPrint('Dio E  $e');
    }
  }

  Future updateFactory(BuildContext context, {
    Map? data,
  }) async {
    try {
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      String? cookie = await Preferances.getString("cookie");
      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/update_factory_process/";
      var response = await http.post(
        Uri.parse(url),
        headers: { "Client-Service": 'frontend-client',
          "Auth-Key": 'simplerestapi',
          'User-ID': userid!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Authorization':token!.replaceAll('"', '').replaceAll('"', '').toString(),
          'type': type!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Cookie': cookie!.replaceAll('"', '').replaceAll('"', '').toString(),
        },
        body: data,

      );

      if (response.statusCode == 200) {
        debugPrint('add account  ----- > ${response.body}');
      } else {
        throw Exception(response.body);
      }
    } on DioError catch (e) {
        debugPrint('Dio E  $e');
    }
  }

  Future updateComment(BuildContext context, {
    Map? data,
  }) async {
    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      String? cookie = await Preferances.getString("cookie");
      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/update_comment_message/";
      var response = await http.post(

        Uri.parse(url),
        headers: { "Client-Service": 'frontend-client',
          "Auth-Key": 'simplerestapi',
          'User-ID': userid!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Authorization':token!.replaceAll('"', '').replaceAll('"', '').toString(),
          'type': type!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Cookie': cookie!.replaceAll('"', '').replaceAll('"', '').toString(),
        },
        body: data,

      );

      if (response.statusCode == 200) {

        debugPrint('add account  ----- > ${response.body}');
        Loader.hideLoader();

      } else {
        Loader.hideLoader();
        throw Exception(response.body);

      }
    } on DioError catch (e) {
      debugPrint('Dio E  $e');
      Loader.hideLoader();
    }
  }

  Future<SearchModel?> search(BuildContext context, {
    FormData? data,
  }) async {
    try {
      Loader.showLoader();
      print("1");
      Response response;
      response = await dio.post("https://tinkubhaiya.provisioningtech.com/get_ajax/get_all_enquiry_by_date/",
        data: data,

      );

      print("2");
      if (response.statusCode == 200) {
        SearchModel searchData = SearchModel.fromJson(response.data);
        print("3");
        print(response.data);
        Loader.hideLoader();
        return searchData;

      } else {
        Loader.hideLoader();
        print("4");
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      print("5");
      debugPrint('Dio E  $e');
      Loader.hideLoader();
    }
    return null;
  }

  Future<AlertModel?> alert(BuildContext context) async {
    try {
      String? userid = await Preferances.getString("userId");
      Loader.showLoader();
      Response response;

      var formData = FormData.fromMap({
        'id': userid?.replaceAll('"', '').replaceAll('"', '').toString(),

      });
      response = await dio.post("https://tinkubhaiya.provisioningtech.com/get_ajax/get_alert_list/",
        data: formData,
      );
      if (response.statusCode == 200) {
        AlertModel alertData = AlertModel.fromJson(response.data);
        print(response.data);
        Loader.hideLoader();
        return alertData;

      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {

      debugPrint('Dio E  $e');
      Loader.hideLoader();
    }
    return null;
  }

  Future cancelData(BuildContext context, {
    Map? data,
  }) async {
    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      String? cookie = await Preferances.getString("cookie");

      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/cancell_lead/";
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

        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: "Data Cancel",
          backgroundColor: Colors.grey,
        );

      } else {
        Loader.hideLoader();
        throw Exception(response.body);

      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
    }
  }

  Future<AcceptModel?> accept(BuildContext context) async {
    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? type = await Preferances.getString("userType");
      var formData = FormData.fromMap({
        'loginid': userid?.replaceAll('"', '').replaceAll('"', '').toString(),
        'status': 0,
        'fieldprocess': 1,

      });
      print(userid?.replaceAll('"', '').replaceAll('"', '').toString(),);
      print(type?.replaceAll('"', '').replaceAll('"', '').toString(),);
      Response response;
      response = await dio.post("https://tinkubhaiya.provisioningtech.com/get_ajax/get_pending_leads",
        data: formData,
      );
      if (response.statusCode == 200) {
        AcceptModel acceptModel = AcceptModel.fromJson(
            response.data);
        print(response.data);
        Loader.hideLoader();
        return acceptModel;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
    }
  }

  Future<VisitedModel?> visited(BuildContext context) async {
    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? type = await Preferances.getString("userType");
      var formData = FormData.fromMap({
        'loginid': userid?.replaceAll('"', '').replaceAll('"', '').toString(),
        'status':1,
        'fieldprocess': 2,

      });
      print(userid?.replaceAll('"', '').replaceAll('"', '').toString(),);
      print(type?.replaceAll('"', '').replaceAll('"', '').toString(),);
      Response response;
      response = await dio.post("https://tinkubhaiya.provisioningtech.com/get_ajax/get_pending_leads",
        data: formData,
      );
      if (response.statusCode == 200) {
        VisitedModel visitedModel = VisitedModel.fromJson(
            response.data);
        print(response.data);
        Loader.hideLoader();
        return visitedModel;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
    }
  }

  Future confirmMessage(BuildContext context, {
    Map? data,
  }) async {
    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      String? cookie = await Preferances.getString("cookie");
      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/update_lead_status";
      var response = await http.post(

        Uri.parse(url),
        headers: { "Client-Service": 'frontend-client',
          "Auth-Key": 'simplerestapi',
          'User-ID': userid!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Authorization':token!.replaceAll('"', '').replaceAll('"', '').toString(),
          'type': type!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Cookie': cookie!.replaceAll('"', '').replaceAll('"', '').toString(),
        },
        body: data,

      );

      if (response.statusCode == 200) {

        debugPrint('add account  ----- > ${response.body}');
        Loader.hideLoader();
        Fluttertoast.showToast(
          msg: "Message Sent...",
          backgroundColor: Colors.grey,
        );

      } else {
        Loader.hideLoader();
        throw Exception(response.body);

      }
    } on DioError catch (e) {
      debugPrint('Dio E  $e');
      Loader.hideLoader();
    }
  }

  Future cancelMessage(BuildContext context, {
    Map? data,
  }) async {
    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? token = await Preferances.getString("userToken");
      String? type = await Preferances.getString("userType");
      String? cookie = await Preferances.getString("cookie");
      var url = "https://tinkubhaiya.provisioningtech.com/post_ajax/update_lead_status";
      var response = await http.post(

        Uri.parse(url),
        headers: { "Client-Service": 'frontend-client',
          "Auth-Key": 'simplerestapi',
          'User-ID': userid!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Authorization':token!.replaceAll('"', '').replaceAll('"', '').toString(),
          'type': type!.replaceAll('"', '').replaceAll('"', '').toString(),
          'Cookie': cookie!.replaceAll('"', '').replaceAll('"', '').toString(),
        },
        body: data,

      );

      if (response.statusCode == 200) {

        debugPrint('add account  ----- > ${response.body}');
        Loader.hideLoader();

      } else {
        Loader.hideLoader();
        throw Exception(response.body);

      }
    } on DioError catch (e) {
      debugPrint('Dio E  $e');
      Loader.hideLoader();
    }
  }

  Future<SubmitedModel?> submited(BuildContext context) async {
    try {
      Loader.showLoader();
      String? userid = await Preferances.getString("userId");
      String? type = await Preferances.getString("userType");
      var formData = FormData.fromMap({
        'loginid': userid?.replaceAll('"', '').replaceAll('"', '').toString(),
        'status':2,
        'fieldprocess': 3,

      });
      print(userid?.replaceAll('"', '').replaceAll('"', '').toString(),);
      print(type?.replaceAll('"', '').replaceAll('"', '').toString(),);
      Response response;
      response = await dio.post("https://tinkubhaiya.provisioningtech.com/get_ajax/get_pending_leads",
        data: formData,
      );
      if (response.statusCode == 200) {
        SubmitedModel submitedModel = SubmitedModel.fromJson(
            response.data);
        print(response.data);
        Loader.hideLoader();
        return submitedModel;
      } else {
        Loader.hideLoader();
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      Loader.hideLoader();
      debugPrint('Dio E  $e');
    }
  }

}
