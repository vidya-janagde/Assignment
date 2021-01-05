import 'package:flutter/material.dart';
import 'package:flutter_chilkasoft/bloc/Employee_bloc.dart';
import 'package:flutter_chilkasoft/model/Data.dart';
import 'package:flutter_chilkasoft/model/employeeModel.dart';
import 'package:flutter_chilkasoft/ui/ShowData.dart';
import 'package:rxdart/src/subjects/behavior_subject.dart';

class EmployeeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmployeeListState();
  }
}

class EmployeeListState extends State<EmployeeList> {
  static TextEditingController controller = new TextEditingController();
  List<Data> data = [];
  List<Details> _searchResult = [];
  Stream<Data> stream = employeebloc.subject.stream;
  EmployeeBloc bloc;
  Show show;
  AsyncSnapshot<Data> snapshot;
  @override
  void initState() {
    super.initState();

   Stream filter= employeebloc.subject.stream.where((event) => event == 'abc');
   filter.listen((event) {
     _searchResult.add(event);
   });
   print(_searchResult.length);
    employeebloc..getData(controller.text == null ? 'a' : controller.text);

    employeebloc..updateText(controller.text == null ? 'a' : controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Employee List'),
          leading: Icon(
            Icons.refresh,
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            prefix: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                        onChanged: (value) {

                          // addtolist(value,snapshot);
                          // addtolist(value, stream);
                          // bloc.updateText(value);
                        }),
                    Expanded(
                        flex: 2,
                        // child: controller.text == ""
                        //     ?
                        // StreamBuilder<Data>(
                        //         stream: employeebloc.subject.stream,
                        //         builder: (context, snapshot) {
                        //           if (snapshot.hasData) {
                        //             if (snapshot.data != null) {
                        //               print(snapshot.data);
                        //               data.add(snapshot.data);
                        //               print(data);
                        //
                        //                   return listWidget(context, snapshot);
                        //
                        //
                        //             }
                        //             return listWidget(context, snapshot);
                        //           } else if (snapshot.hasError) {
                        //             return Text(snapshot.error.toString());
                        //           } else {
                        //             return Center(
                        //                 child: CircularProgressIndicator());
                        //           }
                        //         })
                        //     :
                            // GestureDetector(child: Text("Search data"),

                            // )

                         child:   StreamBuilder<Data>(
                                stream: employeebloc.results,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data != null) {
                                      print(snapshot.data);
                                      // data.add(snapshot.data);
                                      // print(data);



                                       Iterable<Details>  filetedStream =  snapshot.data.details.where((element) => element.varDrName == controller.text);

                                       filetedStream.forEach((element) {_searchResult.add(element); });

                                       return listWidget(context, snapshot);


                                    }
                                    return listWidget(context, snapshot);
                                  } else if (snapshot.hasError) {
                                    return Text(snapshot.error.toString());
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                })),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ))));
  }

  Widget listWidget(BuildContext context, snapshot) {
    return controller.text == null
        ? Text('Serach data')
        : ListView.builder(
            itemCount: snapshot.data.details.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => {
                        show = new Show(
                            snapshot.data.details[index].varDrName,
                            snapshot.data.details[index].varCategory,
                            snapshot.data.details[index].varSpeciality,
                            snapshot.data.details[index].varCity,
                            snapshot.data.details[index].varAppRemarks),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowData(show)))
                      },
                  child: Container(
                    child: Card(
                        child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              snapshot.data.details[index].varDrName
                                          .startsWith(controller.text) ==
                                      null
                                  ? " "
                                  : snapshot.data.details[index].varDrName +
                                      " ",
                              style: TextStyle(fontSize: 15)),
                          Text(
                            snapshot.data.details[index].varCity == null
                                ? " "
                                : snapshot.data.details[index].varCity + "  ",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            snapshot.data.details[index].varMobileNo == null
                                ? ""
                                : snapshot.data.details[index].varMobileNo,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            snapshot.data.details[index].varSpeciality == null
                                ? " "
                                : snapshot.data.details[index].varSpeciality +
                                    "  ",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    )),
                  ));
            });
  }

  addtolist(String str, BehaviorSubject<Data> d) {
    if (d.stream.value.details.contains(str)) {
      // _searchResult.add(d.value);

      print(_searchResult.length);
    }
  }

  getselcted() {
    return StreamBuilder<Data>(
        stream: employeebloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (controller.text != null) {
              if (snapshot.data != null) {
                print(snapshot.data);

                print(data);
                return listWidget(context, snapshot);
              }
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
  }

  void get(String str) {}
}

class Show {
  var name, category, speciality, city, remark;

  Show(this.name, this.category, this.speciality, this.city, this.remark);
}
