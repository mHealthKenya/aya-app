import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aya_mobile/globals.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController msisdnController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController indexNumberController = TextEditingController();
  TextEditingController licenceNumberController = TextEditingController();
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  
  String gender = "";

  registerUser(String msisdn, String email, String nationalID, String indexNo, String licenceNo, String registrationNo, String password,
      String confirm) async {
    try {
      if (msisdn.isEmpty) {
        return Fluttertoast.showToast(
            msg: "Phone field is empty.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER_RIGHT,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (email.isEmpty) {
        return Fluttertoast.showToast(
            msg: "Email is empty.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER_RIGHT,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (nationalID.isEmpty) {
        return Fluttertoast.showToast(
            msg: "National ID field is empty.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER_RIGHT,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (password.length < 8) {
        return Fluttertoast.showToast(
            msg: "Password must be at least 8 characters long.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER_RIGHT,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (password != confirm) {
        return Fluttertoast.showToast(
            msg: "Passwords did not match",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER_RIGHT,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (gender.isEmpty) {
        return Fluttertoast.showToast(
            msg: "Please select a gender",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER_RIGHT,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      
      else {
        var url =
            Uri.parse('https://aya-api.mhealthkenya.co.ke/api/auth/register');
        var body = {
          "msisdn": msisdn,
          "email": email,
          "nationalID": nationalID,
          "index_no": indexNo,
          "licence_no": licenceNo,
          "reg_no": registrationNo,
          "gender": gender,
          "password": password,
        };
        Response response = await post(url, body: body);
        Map data = jsonDecode(response.body);
        int statusCode = response.statusCode;
        if (statusCode == 200) {
          Navigator.of(context).pushNamed("/login");
        } else {
          return Fluttertoast.showToast(
              msg: "Error, $data['message']",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER_RIGHT,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        print(statusCode);
        print(data);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget buildAYA() {
      return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(
            'AYA',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 30),
          ));
    }

    Widget buildMSISDN() {
      return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: msisdnController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone',
          ),
        ),
      );
    }

    Widget buildEmail() {
      return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
      );
    }

    Widget buildNationalID() {
      return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: nationalIDController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'National ID',
          ),
        ),
      );
    }

    Widget buildIndexNo() {
      return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: indexNumberController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Index Number',
          ),
        ),
      );
    }

    Widget buildLicenceNo() {
      return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: licenceNumberController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Licence Number',
          ),
        ),
      );
    }

    Widget buildRegistrationNo() {
      return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: registrationNumberController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Registration Number',
          ),
        ),
      );
    }

    Widget buildGender() {
      return Padding(
        padding: EdgeInsets.all(10),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Gender",
          ),
          items: [
            {"sex": "Male"},
            {"sex": "Female"}
          ].map((gender) {
            return DropdownMenuItem(
                value: gender["sex"], child: Text(gender["sex"]));
          }).toList(),
          onChanged: (value) => setState(() {
            gender = value as String;
          }),
        ),
      );
    }

    Widget buildPassword() {
      return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
      );
    }

    Widget buildConfirmPassword() {
      return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: passwordConfirmController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Confirm Password',
          ),
        ),
      );
    }

    Widget buildSubmit() {
      return Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.blue),
            child: Text('Register'),
            onPressed: () {
              var msisdn = msisdnController.text;
              var email = emailController.text;
              var nationalID = nationalIDController.text;
              var indexNo = indexNumberController.text;
              var licenceNo = licenceNumberController.text;
              var registrationNo = registrationNumberController.text;
              var password = passwordController.text;
              var confirm = passwordConfirmController.text;
              registerUser(msisdn, email, nationalID, indexNo, licenceNo, registrationNo, password, confirm);
            },
          ));
    }

    Widget buildToLogin() {
      return TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/login");
        },
        style: TextButton.styleFrom(primary: Colors.blue),
        child: Text(
          'Already have an account?',
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    Widget buildRegister() {
      return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildAYA(),
                buildMSISDN(),
                buildEmail(),
                buildNationalID(),
                buildIndexNo(),
                buildLicenceNo(),
                buildRegistrationNo(),
                buildGender(),
                buildPassword(),
                buildConfirmPassword(),
                buildSubmit(),
                buildToLogin()
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          centerTitle: true,
        ),
        body: buildRegister());
  }
}