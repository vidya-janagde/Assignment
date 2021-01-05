import 'package:flutter/material.dart';

class mylist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return mylistState();
  }
}

class mylistState extends State<mylist> {
  List<String> countries = ['India', 'china', 'america', 'uk'];

  List<String> visible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextField(onChanged: (value){visible= countries.where((element) => element.contains(value)).toList();
        setState(() {

        });}),
        SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: visible.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(visible[index]),
              );
            },
          ),
        )
      ],
    ));
  }
}
