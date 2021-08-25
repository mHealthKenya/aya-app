import 'dart:convert';
import 'package:aya_mobile/globals.dart';
import 'package:aya_mobile/models/userClass.dart';
import 'package:aya_mobile/widgets/app_default.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';
import 'dart:io';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  //a variable of type future to hold the array of posts returned
  Future<User> _user;
  //variable for holding search data
  String searchString = "";
  //controller to feed into the search string
  final TextEditingController editingController = new TextEditingController();

  //overided the initState method to allow the getPosts method to be run onCreate
  void initState() {
    _user = getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
              //future builder of type <List<User>> to asynchronously list all the posts
              child: new FutureBuilder<User>(
                  future: _user,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == null) {
                      return Text('No data available');
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [ 
                          ListTile(
                            leading: Icon(Icons.person_outlined),
                            title: Text(snapshot.data.name),
                          ),
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text(snapshot.data.idNumber.toString()),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text(snapshot.data.indexNo.toString()),
                          ),
                        ],
                      );      
                    }
                    return CircularProgressIndicator();
                  }))),
    );
  }
}

//function that returns a list of posts
Future<User> getUser() async {
  var url = Uri.parse('https://aya-api.mhealthkenya.co.ke/api/auth/user');
  var jwt = Globals.token;

  //todo add a try and catch on this http get request, also check internet connection
  var response = await http
      .get(url, headers: {HttpHeaders.authorizationHeader: "Bearer $jwt"});
  print(response.body);
  return User.fromJson(json.decode(response.body));
}
