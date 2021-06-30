import 'dart:convert';


import 'package:aya_mobile/models/postsClass.dart';
import 'package:aya_mobile/widgets/app_default.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({ Key key }) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  Future<List<Posts>> _posts;
  String searchString = "";
  final TextEditingController editingController = new TextEditingController();

  void initState(){
    _posts = getPosts();
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
            child: new FutureBuilder<List<Posts>>(
              future: _posts,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  List<Posts> allPosts = snapshot.data;
                  return new ListView.builder(
                    itemCount: allPosts.length,
                    itemBuilder: (BuildContext context, int index){
                      return allPosts[index].postTitle.contains(searchString)
                      ? Card(
                        child: Column(
                          children: [
                            ListTile(
                              enabled: true,
                              onTap: (){},
                              title: Text(allPosts[index].postTitle.toString()),
                              subtitle: Text(allPosts[index].postBody.toString()),
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

Future<List<Posts>> getPosts() async{
  var url = Uri.parse('http://192.168.0.167:5050/api/posts');
  var response = await http.get(url);
  print(response.body[0]);
  return List<Posts>.from(json.decode(response.body).map((x) => Posts.fromJson(x)));
}