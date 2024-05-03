import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:githubsearch/view/ProfileView.dart';
import 'package:githubsearch/view/ReposView.dart';
import 'package:githubsearch/view/resultview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/User.dart';

class SearchPageController with ChangeNotifier {

  TextEditingController searchController = TextEditingController();
  List <User> userData=[];
  int selectedIndex=0;
  int repolength=0;
  Map<String, dynamic> Userdata={};
  List  Repodata=[];
  List ViewItems=[ProfileView(), RepoView()];

  void OnItemselect(int index){
    selectedIndex=index;
    print("taped view ${index}");
    notifyListeners();
  }
   launchURL(String url) async {
     final Uri url2 = Uri.parse(url.toString());
     if (!await launchUrl(url2)) {
       throw Exception('Could not launch2 $url2');
     }
  }
  Future<void> openBrowserTab(String url) async {
    await FlutterWebBrowser.openWebPage(url: "https://flutter.io/");
  }
  Future getUser(String username, BuildContext context) async {
    var dio=Dio();

    try {
      if(username.isNotEmpty) {
        Response data = await dio.get('https://api.github.com/users/$username');
        print("data is:${data.data}");
        Userdata= data.data;
        print("user data is:${Userdata['public_repos']}");
        notifyListeners();
        await getRepo(username);
        print("list 22 is ${data.data['avatar_url']}");

         userData.add(
          User(
            name: data.data['name'],
            id: data.data['id'].toString(),
            location: data.data['location'],
            email: data.data['email'],
            noofrepo: data.data['public_repos'].toString(),
            avatar: data.data['avatar_url']
          )
        );
        notifyListeners();

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ResultView())
        );
        print("list is ${userData.asMap()}");
        // print("list is ${userData[0].name}");
        // print("list is ${userData[0].location}");
        // print("list is ${userData[0].avatar}");
        // print("list is ${userData[0].noofrepo}");
        //
        // print("${data}");
      }
      else{
        print("no users found");
      }

    } catch (e) {
      print("error is 1 :$e");
      // throw Exception('Failed to load user data');
    }
  }

  Future getRepo(String username) async {
    var dio=Dio();

    try {
      if(username.isNotEmpty) {
        Response data = await dio.get('https://api.github.com/users/$username/repos');
        print("repo data is:${data.data.length}");
        print("repo data is:${data.data.runtimeType}");
        print("repo data is:${data.data.length}");
        Repodata=data.data;
        print("user2 data is:${Repodata}");
        notifyListeners();
        print("${data}");
      }
      else{
        print("no repo found");
      }

    } catch (e) {
      print("error is 2 :$e");
      // throw Exception('Failed to load user data');
    }
  }

  void clearText(){
    searchController.clear();

  }

}