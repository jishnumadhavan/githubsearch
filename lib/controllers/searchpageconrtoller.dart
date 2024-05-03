import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:githubsearch/view/ProfileView.dart';
import 'package:githubsearch/view/ReposView.dart';
import 'package:githubsearch/view/resultview.dart';
import 'package:url_launcher/url_launcher.dart';


class SearchPageController with ChangeNotifier {

  TextEditingController searchController = TextEditingController();

  int selectedIndex=0;
  int repolength=0;
  Map<String, dynamic> Userdata={};
  List  Repodata=[];
  List  CopyRepodata=[];
  List ViewItems=[ProfileView(), RepoView()];
  void filterbydown() {
    List itemList = [];
    itemList=CopyRepodata;
    print("on filter $itemList");
    List sortedList = itemList.map((item) {
      DateTime createdAt = DateTime.parse(item['created_at']);
      return {'createdAt': createdAt, ...item};
    }).toList();

    sortedList.sort((a, b) => a['createdAt'].compareTo(b['createdAt']));

    int numberOfItems = 3; // Number of latest items you want to filter
    List filteredList =
    sortedList.reversed.take(numberOfItems).toList();

    print(filteredList);

    print(filteredList);

    Repodata=filteredList;
    notifyListeners();
    print(filteredList);
  }

  void filterbyup() {
    List itemList = [];
    itemList=CopyRepodata;

    List sortedList = itemList.map((item) {
      DateTime createdAt = DateTime.parse(item['created_at']);
      return {'createdAt': createdAt, ...item};
    }).toList();

    sortedList.sort((a, b) => a['createdAt'].compareTo(b['createdAt']));

    // int numberOfItems = 3; // Number of latest items you want to filter
    List filteredList =
    sortedList.reversed.toList();

    Repodata=filteredList;
    notifyListeners();
    print(filteredList);
  }

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
  bool loading=false;
  Future getUser(String username, BuildContext context) async {
    loading=true;
    notifyListeners();
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
        loading=false;
        notifyListeners();
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ResultView())
        );

      }
      else{
        loading=false;
        notifyListeners();
        print("no users found");
      }

    } catch (e) {
      loading=false;
      notifyListeners();
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
        CopyRepodata=data.data;
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