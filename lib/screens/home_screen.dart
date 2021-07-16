import 'package:aya_mobile/screens/faq.dart';
import 'package:aya_mobile/screens/posts.dart';
import 'package:aya_mobile/screens/renew_license.dart';
import 'package:aya_mobile/screens/student_check_in.dart';
import 'package:aya_mobile/widgets/app_default.dart';
import 'package:aya_mobile/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aya_mobile/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery. of(context). size. width;
    double screenHeight = MediaQuery. of(context). size. height;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AyaAppBar(),
      body: WillPopScope(
          onWillPop: () async {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return RichAlertDialog(
                    alertTitle: richTitle("Exit the App"),
                    alertSubtitle: richSubtitle('Are you Sure '),
                    alertType: RichAlertType.WARNING,
                    actions: <Widget>[
                      TextButton(
                        child: Text("Yes"),
                        onPressed: () {
                         
                        },
                      ),
                      TextButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
          },
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overScroll) {
              overScroll.disallowGlow();
              return true;
            },
            child: ListView(
              children: <Widget>[
                Text(Globals.token),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.purple,
                            child: CardButton(
                              height: screenHeight * 0.2,
                              width: screenWidth * (35 / 100),
                              icon: FontAwesomeIcons.fileContract,
                              size: screenWidth * (25 / 100),
                              color: Color(0xff7b1fa2),
                              borderColor: Color(0xff7b1fa2).withOpacity(0.75),
                            ),
                           onTap: () async {
                            await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => RenewLicenseScreen()),);    
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Renew License'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.yellowAccent,
                            child: CardButton(
                              height: screenHeight * (20 / 100),
                              width: screenWidth * (35 / 100),
                              icon: FontAwesomeIcons.userGraduate,
                              size: screenWidth * 0.2,
                              color: Color(0xffE3952D),
                              borderColor: Color(0xffE3952D).withOpacity(0.75),
                            ),
                             onTap: () async {
                            await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => StudentCheckInScreen()),);    
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Student Check In'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.green,
                            child: CardButton(
                              height: screenHeight * (20 / 100),
                              width: screenWidth * (35 / 100),
                              icon: FontAwesomeIcons.hospital,
                              size: screenWidth * (25 / 100),
                              color: Color(0xff3c513d),
                              borderColor: Color(0xff3c513d).withOpacity(0.75),
                            ),
                            onTap: () async {
                             
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Continous Professional'+ '\n'+ 'Development - (CPD)',
                              style: TextStyle(
               
               
              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.indigo[300],
                            child: CardButton(
                              height: screenHeight * (20 / 100),
                              width: screenWidth * (35 / 100),
                              icon: FontAwesomeIcons.userFriends,
                              size: screenWidth * (25 / 100),
                              color: Color(0xffaf5676),
                              borderColor: Color(0xffaf5676).withOpacity(0.75),
                            ),
                            onTap: () async {
                             
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Supervisory and Monitoring'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.redAccent,
                            child: CardButton(
                              height: screenHeight * 0.2,
                              width: screenWidth * (35 / 100),
                              icon: FontAwesomeIcons.readme,
                              size: screenWidth * (25 / 100),
                              color: Color(0xffD83B36),
                              borderColor: Color(0xffD83B36).withOpacity(0.75),
                            ),
                            onTap: () async {
                            Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => PostsScreen()),);    
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Knowledge Base'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.brown,
                            child: CardButton(
                              height: screenHeight * (20 / 100),
                              width: screenWidth * (35 / 100),
                              icon: FontAwesomeIcons.fileAlt,
                              size: screenWidth * 0.2,
                              color: Color(0xff5d4037),
                              borderColor: Color(0xff5d4037).withOpacity(0.75),
                            ),
                            onTap: () async {
                            Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => FAQScreen()),);    
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Frequently Asked Questions'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
               
                SizedBox(
                  height: screenHeight * (5 / 100),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )),
    );
  }
}