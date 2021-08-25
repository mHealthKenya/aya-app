import 'dart:convert';
import 'dart:io';

import 'package:aya_mobile/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:aya_mobile/globals.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController msisdnController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: false,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'AYA',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: msisdnController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  style: TextButton.styleFrom(primary: Colors.blue),
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      child: Text('Login'),
                      onPressed: () {                        
                        var msisdn = msisdnController.text;
                        var password = passwordController.text;
                        _authenticateCredentials(msisdn, password);                         
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Dont have an account?'),
                        TextButton(
                          style: TextButton.styleFrom(primary: Colors.blue),
                          child: Text(
                            'Register',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            ))
            );
  }
  
   _authenticateCredentials(String msisdn, String password) async{
try {
  if(msisdn.isEmpty  || password.isEmpty){
    print('empty');
    return Fluttertoast.showToast(
              msg: "Error, Phone or password field is empty.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER_RIGHT,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);   
  } else{

  
  var url = Uri.parse('https://aya-api.mhealthkenya.co.ke/api/auth/login');
   Response response = await post(url,    
      body: {"msisdn": '$msisdn',
      "password": '$password'});
      Map data = jsonDecode(response.body);
       if(data['token'] !=null){
        var token = data['token'];
      print(token);
      setState(() {
              Globals.token = token;
            });
      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => HomeScreen()
                          ),
    );
      }else 
        return Fluttertoast.showToast(
              msg: "Error, $data['message']",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER_RIGHT,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);    
              }                     
}catch (e) {
    print(e);
  }
}
}

