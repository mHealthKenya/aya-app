
import 'package:aya_mobile/authentication/login.dart';
import 'package:aya_mobile/screens/faq.dart';
import 'package:aya_mobile/screens/home_screen.dart';
import 'package:aya_mobile/screens/user_profile.dart';
import 'package:aya_mobile/screens/posts.dart';
import 'package:aya_mobile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Drawer(
        elevation: 1,
        child: Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        DrawerHeader(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: Divider.createBorderSide(context,
                                      color: Colors.transparent, width: 0))),
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                    flex: 2,
                                    child: Image.asset(
                                        'assets/aya_logo.png')),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'AYA ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 32.0,
                                  ),
                                ),
                                Text(
                                  'Mobile',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 32.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListButtons(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UserProfileScreen();
                            }));
                          },
                          icon: Icons.perm_identity,
                          text: 'My Profile',
                        ),
                        ListButtons(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                          },
                          icon: Icons.badge,
                          text: 'Renew License',
                        ),
                        ListButtons(
                          onTap: () {},
                          icon: Icons.location_on,
                          text: 'Student Check In',
                        ),
                        ListButtons(
                          onTap: () {},
                          icon: FontAwesomeIcons.hospital,
                          text: 'CPD',
                        ),
                        ListButtons(
                          onTap: () {},
                          icon: FontAwesomeIcons.userFriends,
                          text: 'Supervisory & Monitoring',
                        ),
                         ListButtons(
                           onTap: () async {
                            Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => PostsScreen()),);    
                            },
                          icon: FontAwesomeIcons.readme,
                          text: 'Knowledge Base',
                        ),
                         ListButtons(
                          onTap: () async {
                            Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => FAQScreen()),);    
                            },
                          icon: FontAwesomeIcons.fileAlt,
                          text: 'Frequently Asked Questions',
                        ),
                        ListButtons(
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return RichAlertDialog(
                                    alertTitle:
                                        richTitle("Log-out from the App"),
                                    alertSubtitle:
                                        richSubtitle('Are you Sure '),
                                    alertType: RichAlertType.WARNING,
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {  },
                                        child: Text("Yes"),
                                        
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
                          icon: Icons.exit_to_app,
                          text: 'Sign Out',
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Divider(
                          indent: 30,
                          endIndent: 30,
                          thickness: 1.5,
                          color: Colors.grey.shade200,
                        ),
                        ListButtons(
                          onTap: () {
                            launch('https://www.termsfeed.com/live/ccf90925-b031-4058-bf5c-3615e5918580',
                             forceSafariVC: false,
                                  forceWebView: false,                                 
                                );
                          },
                          icon: Icons.read_more,
                          text: 'Privacy Policy',
                        ),
                        ListButtons(
                           onTap: () {
                            launch('https://mhealthkenya.org/',
                             forceSafariVC: false,
                                  forceWebView: false,                                 
                                );
                          },
                          icon: Icons.help_outline,
                          text: 'Help and Feedback',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListButtons extends StatelessWidget {
  final String text;
  final icon;
  final onTap;
  ListButtons({this.text, this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 9),
      child: InkWell(
        splashColor: Color(0xffBA6ABC3),
        onTap: onTap,
        focusColor: Colors.green,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            leading: Icon(
              icon,
              size: 25,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}

class FormItem extends StatelessWidget {
  final String hintText;
  final String helperText;
  final Function onChanged;
  final bool isNumber;
  final IconData icon;
  final controller;

  FormItem(
      {this.hintText,
      this.helperText,
      this.onChanged,
      this.icon,
      this.isNumber: false,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(5),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color(0xffaf5676), style: BorderStyle.solid)),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Colors.indigo, style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color(0xffaf5676), style: BorderStyle.solid)),
        ),
        onChanged: (String value) {
          onChanged(value);
        },
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}

class AyaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 56;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('AYA '),
              Text(
                'Mobile',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 1,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ProfilePage()),
    );
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.perm_identity,
                  size: 30,
                  color: Color(0xff5e444d),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
