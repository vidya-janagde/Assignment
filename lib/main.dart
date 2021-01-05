import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chilkasoft/ui/EmployeeList.dart';
import 'package:flutter_chilkasoft/ui/UserList.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'dart:async';


import 'package:flutter/cupertino.dart';

import 'package:flutter_chilkasoft/ui/Dashboard.dart';
import 'package:flutter_chilkasoft/utils/Strings.dart';
import 'package:flutter_chilkasoft/utils/color.dart';
import 'package:flutter_chilkasoft/utils/dimentions.dart';
import 'package:progress_dialog/progress_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:
      User()
      // EmployeeList()
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var name, box;


  @override
  void initState() {
    super.initState();
    saveData();
  }

  saveData() async {
    Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    box = await Hive.openBox('users');

    // var box = Hive.box('users');

    box.put('Sincere@april.biz', '1111');
    box.put('Shanna@melissa.tv', '2222');
    box.put('Nathan@yesenia.net', '3333');
    box.put('Julianne.OConner@kory.org', '4444');
    box.put('Lucio_Hettinger@annie.ca', '5555');

    box.put('Karley_Dach@jasper.info', '6666');
    box.put('Telly.Hoeger@billy.biz', '7777');
    box.put('Sherwood@rosamond.me', '8888');
    box.put('Chaim_McDermott@dana.io', '9999');
    box.put('Rey.Padberg@karina.biz', '1010');

    name = box.get('Karley_Dach@jasper.info');

    print('Name: $name');
  }

  bool isKeybordVisisble = false;
  bool login_state = true;
  bool isloggedin = false;
  Alignment childAlignment = Alignment.center;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  ProgressDialog _progressDialog;

  @override
  Widget build(BuildContext context) {
    _progressDialog = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    _progressDialog.style(
      message: 'Loging',
    );
    return SafeArea(
      child: WillPopScope(
        onWillPop: null,
        child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: false,
            body: Container(
              padding: EdgeInsets.only(left: thirty, right: thirty),
              child: Column(
                mainAxisAlignment: isKeybordVisisble
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: fifteen),
                      child: Text(
                        loginLabel,
                        style:
                            TextStyle(color: loginLabelColor, fontSize: thirty),
                      )),
                  SizedBox(height: ten,),
                  Padding(
                    padding: EdgeInsets.only(top: ten, left: ten, right: ten),
                    child: Container(
                      height: fourtyFive,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: TextFormField(
                        controller: emailController,
                        textAlign: TextAlign.left,
                        textInputAction: TextInputAction.done,
                        decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: loginTextFieldBorderColor, width: 0.4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: loginTextFieldBorderColor, width: 0.4),
                            ),
                            hintText: entermobileorEmail,
                            hintStyle: TextStyle(
                                fontSize: fifteen,
                                color: inputFieldColor.withAlpha(90)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: five, horizontal: fifteen)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: two, left: ten, right: ten),
                    child: Container(
                      height: fourtyFive,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: TextFormField(
                        maxLines: 1,
                        obscureText: true,
                        controller: passwordController,
                        textAlign: TextAlign.left,
                        decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: loginTextFieldBorderColor, width: 0.2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: loginTextFieldBorderColor, width: 0.2),
                            ),
                            hintText: password,
                            hintStyle: TextStyle(
                                fontSize: fifteen,
                                color: inputFieldColor.withAlpha(90)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: five, horizontal: fifteen)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(left: ten, right: ten),
                      child: Container(
                          height: fifty,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(five),
                              color: orangeColor),
                          child: Center(
                            child: Text(
                              continueLabel,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: whiteColor, fontSize: eighteen),
                            ),
                          )),
                    ),
                    onTap: () {
                      checkNetwork();
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Future checkNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (emailController.text.length == 0 ||
            emailController.text.toString() == "" ||
            emailController.text.toString() == null) {
          _showDialog(noemailMobile);
        } else if (passwordController.text.length == 0 ||
            passwordController.text.toString() == "" ||
            passwordController.text.toString() == null) {
          _showDialog(noPassword);
        } else {
          // _checkLogin();
          checkLogin();
        }
      } else {
        _showDialog(nonetwork);
        scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text(nonetwork),
        ));
      }
    } on TimeoutException catch (timeoutExecption) {
      _showDialog(slowConnection);
      scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(slowConnection),
      ));
    } on SocketException catch (socketException) {
      _showDialog(nonetwork);
      scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(nonetwork),
      ));
    }
  }

  Future<void> _showDialog(String errorMessage) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Error'),
          content: Text(" " + errorMessage),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  get loginContainer {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: fifty),
        decoration: BoxDecoration(
          color: formContainerBG,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(45), topLeft: Radius.circular(45)),
        ),
        child: Column(
          children: <Widget>[],
        ));
  }

  Future<void> checkLogin() async {
    try {
      if (box.containsKey(emailController.text)) {
        var userid = box.get(emailController.text);

        if (userid == passwordController.text) {
          var user = emailController.text;

          _progressDialog.show();
          emailController.clear();
          passwordController.clear();

          Future.delayed(Duration(seconds: 1)).then((value) {
            _progressDialog.hide().whenComplete(() => Navigator.of(context)
                .pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Dashboard(userid: user))));
          });
        }
      } else {
        _showDialog("User id does not exists");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
