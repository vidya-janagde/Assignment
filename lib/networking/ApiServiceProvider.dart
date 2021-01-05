

import 'dart:convert';
import 'dart:io';


import 'package:flutter_chilkasoft/model/Data.dart';
import 'package:flutter_chilkasoft/model/employeeModel.dart';

import 'package:http/http.dart' as http;

class ApiServiceProvider {
  List<Data> list = [];
  final url =
      'https://services85.ecubix.com/ECPMobileWebService_Ver590/ecpMobileToWebSync.asmx/Get_DrAdditionRequestDetails?fk_EmpGLCode=729&varClientName=VCS_CQA';

  Future<Data> getdata() async {
    try {

      http.Response response = await http.get(url);

      print(response.statusCode);

      if (response.statusCode == 200) {

        Data  responcedata = Data.fromJson(json.decode(response.body));


          list.add(responcedata);





        return responcedata;
      }
    } catch (e) {
      print(e);
    }
  }
}
