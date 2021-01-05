import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chilkasoft/model/Data.dart';
import 'package:flutter_chilkasoft/model/employeeModel.dart';
import 'package:flutter_chilkasoft/networking/ApiServiceProvider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class EmployeeBloc {
  ApiServiceProvider _repository = ApiServiceProvider();
  static bool network_state = false;
  Data response;

  var _textController = StreamController<String>();
  Stream<String> get textStream => _textController.stream;

  final BehaviorSubject<Data> _subject = BehaviorSubject<Data>();

  final BehaviorSubject<Data> select = BehaviorSubject<Data>();

  final _searchTerms = BehaviorSubject<String>();

  var _results = BehaviorSubject<Data>();


  getData(String str) async {
    response = await _repository.getdata();


    _subject.sink.add(response);

  }

  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      network_state = true;

      return network_state;
    }
    return network_state;
  }

  updateText(String str) async {

     _searchTerms.add(str);

    // Output stream (search results)



    response = await _repository.getdata();

    if(response.details.contains(str))
      {
        select.sink.add(response);

      }



  }





  dispose() {
    _subject.close();
    select.close();
    _textController.close();
  }

  BehaviorSubject<Data> get subject => _subject;

  BehaviorSubject<Data> get getselected => select;

  Stream<Data> get results => _results.stream;
}






final employeebloc = EmployeeBloc();
