import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_chilkasoft/model/Data.dart';

import 'package:flutter_chilkasoft/model/employeeModel.dart';
import 'package:flutter_chilkasoft/ui/EmployeeList.dart';
import 'package:flutter_chilkasoft/ui/ShowData.dart';
import 'package:http/http.dart' as http;

class User extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserState();
  }
}

class UserState extends State<User> {
  TextEditingController controller = new TextEditingController();
  bool search = false;
  List<Data> userDetails = [];
  var data;
  Data map;
  Show show;
  List<Details> l;
  List<Details> _searchResult = [];
  final url =
      'https://services85.ecubix.com/ECPMobileWebService_Ver590/ecpMobileToWebSync.asmx/Get_DrAdditionRequestDetails?fk_EmpGLCode=729&varClientName=VCS_CQA';

  @override
  void initState() {
    super.initState();

    getdata();
  }

  Future<List<Details>> getdata() async {
    try {
      http.Response response = await http.get(url);

      print(response.statusCode);

      if (response.statusCode == 200) {
        map = Data.fromJson(json.decode(response.body));

        setState(() {
          l = map.details;

          print(l.length);
        });

        return l;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: onSearchTextChanged,
            ),
            Expanded(
              child: controller.text != null || _searchResult.isNotEmpty
                  ? ListView.builder(
                      itemCount: _searchResult.length,
                      itemBuilder: (BuildContext contect, int index) {
                        return GestureDetector(
                            child: Card(
                              child: Column(
                                children: [
                                  Text('Name:   ' +
                                      _searchResult[index].varDrName),
                                ],
                              ),
                            ),
                            onTap: () => {
                                  show = new Show(
                                      _searchResult[index].varDrName,
                                      _searchResult[index].varCategory,
                                      _searchResult[index].varSpeciality,
                                      _searchResult[index].varCity,
                                      _searchResult[index].varAppRemarks),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ShowData(show)))
                                });
                      },
                    )
                  : ListView.builder(
                      itemCount: l.length,
                      itemBuilder: (BuildContext contect, int index) {
                        return Card(
                          child: Column(
                            children: [
                              Text('Name:   ' + l[index].varDrName),
                            ],
                          ),
                        );
                      },
                    ),
            )
          ],
        )
        // Container()

        );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    l.forEach((userDetail) {
      if (userDetail.varDrName.contains(text) ||
          userDetail.varEmpName.contains(text)) _searchResult.add(userDetail);
    });

    setState(() {});
  }
}
