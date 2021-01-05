import 'dart:async';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.userid}) : super(key: key);

  var userid;

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool showmainContainer = true;

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  Location location;
  String address;

  String la, lo = "";

  var first;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkNetwork();
    checkLocationAvailability();
    _setNetworkContainerStatus(true);
    location = new Location();
    isServiceEnabled();
  }

  void checkLocationAvailability() async {
    checkRunTimePermissions();
  }

  Future checkNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _setNetworkContainerStatus(true);
      } else {
        _setNetworkContainerStatus(false);
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text("no network"),
        ));
      }
    } on TimeoutException catch (timeoutExecption) {
      _setNetworkContainerStatus(false);
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("slow connection"),
      ));
    } on SocketException catch (socketException) {
      _setNetworkContainerStatus(false);
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("nonetwork"),
      ));
      // print("Status");
      // print(showmainContainer);
    }
  }

  void _setNetworkContainerStatus(bool networkStatus) {
    setState(() {
      showmainContainer = networkStatus;
    });
  }

  void isServiceEnabled() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        isServiceEnabled();
      } else {
        getLocation();
      }
    } else {
      getLocation();
    }
  }

  void getLocation() async {
    try {
      location.changeSettings(accuracy: LocationAccuracy.high);
      _locationData = await location.getLocation();
      setState(() {
        la = _locationData.latitude.toString();
        lo = _locationData.longitude.toString();
      });
      geoCodeLatLong(_locationData.latitude, _locationData.longitude);
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // handle  permission denied error
        checkRunTimePermissions();
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        // handle permission permanently denied error
        // openAppSettings();
      }
    }
  }

  void geoCodeLatLong(double la, double lo) async {
    final coordinates = new Coordinates(la, lo);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses.first;
    setState(() {
      if (first.subLocality.toString() != null) {
        address = first.addressLine;
      } else {
        address = first.locality + first.city;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.userid == null ? "Welcome" : "Welcome  " + widget.userid,
            style: TextStyle(color: Colors.deepOrange, fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              address,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      )
          // crossAxisAlignment: CrossAxisAlignment.center,

          ),
    );
  }

  void checkRunTimePermissions() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        checkRunTimePermissions();
      } else {
        isServiceEnabled();
      }
    } else {
      isServiceEnabled();
    }
  }

// void openAppSettings(){
//
//     showDialog<void>(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Location permission'),
//           content: Text(" Please accept the permissions"),
//           actions: <Widget>[
//             FlatButton(
//               child: Text('Ok'),
//               onPressed: () async {
//
//                 AppSettings.openAppSettings();
//               },
//             ),
//           ],
//         );
//       },
//     );
//
// }

}
