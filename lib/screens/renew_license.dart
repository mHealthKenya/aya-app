import 'package:aya_mobile/screens/faq.dart';
import 'package:aya_mobile/screens/posts.dart';
import 'package:aya_mobile/widgets/app_default.dart';
import 'package:aya_mobile/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RenewLicenseScreen extends StatefulWidget {
  const RenewLicenseScreen({ Key key }) : super(key: key);

  @override
  _RenewLicenseScreenState createState() => _RenewLicenseScreenState();
}

class _RenewLicenseScreenState extends State<RenewLicenseScreen> {
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
            child: Text('Coming Soon')
          )),
    );
  }
}