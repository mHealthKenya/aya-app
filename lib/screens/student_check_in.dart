import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:aya_mobile/widgets/app_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:aya_mobile/globals.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  double lat, long;
  

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
      lat = _currentPosition.latitude.toDouble();
      long = _currentPosition.longitude.toDouble(); 
    });
   
   // _sendLocation(lat, long);
   // _getAddressFromLatLng();
  }).catchError((e) {
    print(e);
  });
  print(_currentPosition);
}

_sendLocation(lat, long) async {
try {
  var url = Uri.parse('https://aya-api.mhealthkenya.co.ke/api/checkins');
  var token = Globals.token;
   Response response = await post(url,
   
     headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      body: {"long": '$lat',
      "lat": '$long'});
      Map data = jsonDecode(response.body); 
      if(data["success"] == 'false'){
        return Fluttertoast.showToast(
              msg: "Error occured, please try again.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER_RIGHT,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
      } else{
        print('successfully submitted location');
        return Fluttertoast.showToast(
              msg: "Successfully recorded your location.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER_RIGHT,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
      }     
}catch (e) {
    print(e);
  }
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
    // var lat = _currentPosition.latitude.toString();
    // var long = _currentPosition.longitude.toString(); 
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
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                            
                              children: <Widget>[
                                Text(
                                  'Your location is: ',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                if (_currentPosition == null)
                                 Column(children: <Widget>[CircularProgressIndicator(), Text('Getting your location')]),    
                                if (_currentPosition != null)
                                    
                                  
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text( _currentPosition.toString(),
                                          style:
                                              Theme.of(context).textTheme.bodyText2),
                                     ElevatedButton(                                                  
                             onPressed: () async { await _sendLocation(lat, long); },
                            child: Text('Submit my location'),
                          ),
                                    ],
                                  ),
                                          
                                 
                                          
                              ],
                            ),
            ),
                        
          )),
    );
  }
}