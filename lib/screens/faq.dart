import 'dart:convert';

import 'package:aya_mobile/models/faqsClass.dart';
import 'package:aya_mobile/widgets/app_default.dart';
import 'package:aya_mobile/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({ Key key }) : super(key: key);

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  Future<List<FaQs>> _faqs;
  String searchString = "";

  void initState(){
    _faqs = getFAQs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery. of(context). size. width;
    double screenHeight = MediaQuery. of(context). size. height;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AyaAppBar(),
      body: WillPopScope(
          onWillPop: ()  {
            Navigator.pop(context);
          },
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overScroll) {
              overScroll.disallowGlow();
              return true;
            },
            child: new FutureBuilder<List<FaQs>>(
              future: _faqs,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  List<FaQs> allPosts = snapshot.data;
                  return new ListView.builder(
                    itemCount: allPosts.length,
                    itemBuilder: (BuildContext context, int index){
                      return allPosts[index].question.contains(searchString)
                      ? Card(
                        child: Column(
                          children: [
                            ListTile(
                              enabled: true,
                              onTap: (){},
                              title: Text(allPosts[index].question.toString()),
                              subtitle: Text(allPosts[index].answer.toString()),
                            )
                          ],
                        ),
                      ) : Container();
                    }
                    );
                }else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                } 
                // else {
                //   return Text("Sorry, An error occured, kindly try again.");
                // }  
                return CircularProgressIndicator();                              
              }
              
              )
          )),
    );
  }
}

Future<List<FaQs>> getFAQs() async{
  var url = Uri.parse('https://aya-api.mhealthkenya.co.ke/api/listFAQs');
  var response = await http.get(url);
  print(response.body[0]);
  return List<FaQs>.from(json.decode(response.body).map((x) => FaQs.fromJson(x)));
}