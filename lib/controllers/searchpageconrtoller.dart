import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchPageController with ChangeNotifier {

  TextEditingController searchController = TextEditingController();

  Future getUser(String username) async {
    var dio=Dio();
    try {
      if(username.isNotEmpty) {
        Response data = await dio.get('https://api.github.com/users/$username');
        print("data is:${data.data}");
        print("${data}");
      }
      else{
        print("no users found");
      }

    } catch (e) {
      print("error is :$e");
      // throw Exception('Failed to load user data');
    }
  }

  void clearText(){
    searchController.clear();

  }

}