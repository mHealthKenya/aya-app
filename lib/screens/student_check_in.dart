import 'dart:async';
import 'package:aya_mobile/widgets/app_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class StudentCheckInScreen extends StatefulWidget {
  const StudentCheckInScreen({ Key key }) : super(key: key);

  @override
  _StudentCheckInScreenState createState() => _StudentCheckInScreenState();
}

class _StudentCheckInScreenState extends State<StudentCheckInScreen> {   
//String googleAPIKey = 'AIzaSyDNAJLCsDoxcyAxNR-nV_J_81Xz6FJQ6Yc';
  final Geolocator geolocator = Geolocator();
  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() {
  Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
      .then((Position position) {
    setState(() {
      _currentPosition = position;
    });
   // _getAddressFromLatLng();
  }).catchError((e) {
    print(e);
  });
  print(_currentPosition);
}

_getAddressFromLatLng() async {
  try {
    String place = geolocator.toString();
    // place = p[0];
    setState(() {
      _currentAddress =
      "$place.";
    });
  } catch (e) {
    print(e);
  }
}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery. of(context). size. width;
    double screenHeight = MediaQuery. of(context). size. height;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AyaAppBar(),
      body: WillPopScope(
          onWillPop: () async {
         Navigator.pop(context);
          },
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overScroll) {
              overScroll.disallowGlow();
              return true;
            },
            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Location',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              if (_currentPosition != null &&
                                  _currentPosition != null)
                                Text('We have recorded your location as \n' + _currentPosition.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                            ],
                          ),
                        
          )),
    );
  }
}