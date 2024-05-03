import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/User.dart';

class SearchPageController with ChangeNotifier {

  TextEditingController searchController = TextEditingController();
  List <User> userData=[];
  int repolength=0;

  Future getUser(String username) async {
    var dio=Dio();

    try {
      if(username.isNotEmpty) {
        Response data = await dio.get('https://api.github.com/users/$username');
        print("data is:${data.data}");
        await getRepo(username);
        userData.add(
          User(
            name: data.data['name'],
            id: data.data['id'].toString(),
            location: data.data['location'],
            email: data.data['email'],
            noofrepo: data.data['public_repos'],
            avatar: data.data['avatar_url']
          )
        );
        // print("list is $userData");
        print("list is ${userData[0].name}");
        print("list is ${userData[0].location}");
        print("list is ${userData[0].email}");
        print("list is ${userData[0].noofrepo}");

        print("${data}");
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
        repolength=data.data.length;
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