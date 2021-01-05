import 'package:flutter/material.dart';

import 'EmployeeList.dart';

class ShowData extends StatefulWidget {
  ShowData(this.show);

  Show show;

  @override
  State<StatefulWidget> createState() {
    return ShowDataState();
  }
}

class ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Employee Detaile'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 70,),
              TextFormField(
                textAlign: TextAlign.left,
                textInputAction: TextInputAction.done,
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 0.4),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 0.4),
                    ),
                 labelText: widget.show.name.toString(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 15)),
              ),

              SizedBox(
                height: 10,
              ),

              TextFormField(
                textAlign: TextAlign.left,
                textInputAction: TextInputAction.done,
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 0.4),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 0.4),
                    ),
                    labelText: widget.show.category.toString(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 15)),
              ),

              SizedBox(
                height: 10,
              ),
              TextFormField(
                textAlign: TextAlign.left,
                textInputAction: TextInputAction.done,
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 0.4),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 0.4),
                    ),
                    labelText: widget.show.city.toString(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 15)),
              ),

              SizedBox(
                height: 10,
              ),
              TextFormField(

                textAlign: TextAlign.left,
                textInputAction: TextInputAction.done,
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 0.4),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueGrey, width: 0.4),
                    ),
                    labelText: widget.show.remark.toString(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 15)),
              ),

              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                FlatButton(child: Text('Delete',style: TextStyle(color: Colors.white),),color: Colors.red,onPressed: (){},),
                SizedBox(width: 10,),
                FlatButton(child: Text('Update',style: TextStyle(color: Colors.white)),color: Colors.lightBlue,onPressed: (){},)


              ],)



            ],
          ),
        ));
  }
}
