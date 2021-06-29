import 'package:aya_mobile/widgets/app_default.dart';
import 'package:aya_mobile/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                SizedBox(
                  height: screenHeight * 0.1,
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
                              icon: FontAwesomeIcons.userMd,
                              size: screenWidth * (25 / 100),
                              color: Color(0xff7b1fa2),
                              borderColor: Color(0xff7b1fa2).withOpacity(0.75),
                            ),
                            onTap: () {
                             
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('My Account'),
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
                            onTap: () {
                             
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Student Internship'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.06,
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
                              'CPD Module',
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
                  height: screenHeight * 0.06,
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
                            onTap: () {
                             // Navigator.pushNamed(context, ViewDocuments.id);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('FAQS'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.teal,
                            child: CardButton(
                              height: screenHeight * 0.2,
                              width: screenWidth * (35 / 100),
                              icon: FontAwesomeIcons.stickyNote,
                              size: screenWidth * (25 / 100),
                              color: Color(0xff00796b),
                              borderColor: Color(0xff00796b).withOpacity(0.75),
                            ),
                            onTap: () {
                            //  Navigator.pushNamed(context, NoteList.id);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Take a Note'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.blue,
                            child: CardButton(
                              height: screenHeight * (20 / 100),
                              width: screenWidth * (35 / 100),
                              icon: FontAwesomeIcons.notesMedical,
                              size: screenWidth * 0.2,
                              color: Color(0xff3d5afe),
                              borderColor: Color(0xff3d5afe).withOpacity(0.75),
                            ),
                            onTap: () {
                             
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Health Tracker'),
                          )
                        ],
                      ),
                    )
                  ],
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