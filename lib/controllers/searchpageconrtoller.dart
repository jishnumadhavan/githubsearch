import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:githubsearch/view/ProfileView.dart';
import 'package:githubsearch/view/ReposView.dart';
import 'package:githubsearch/view/resultview.dart';

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