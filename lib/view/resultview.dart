import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:githubsearch/models/User.dart';
import 'package:githubsearch/utlis.dart';
import 'package:provider/provider.dart';

import '../controllers/searchpageconrtoller.dart';

class ResultView extends StatefulWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchPageController>(builder: (context, provider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: FlashyTabBar(
            backgroundColor: colorBlack,
            animationCurve: Curves.easeIn,
            selectedIndex: provider.selectedIndex,
            showElevation: true,
            onItemSelected: (index) =>
              provider.OnItemselect(index),
            items: [
              FlashyTabBarItem(
                activeColor: colorWhite,
                inactiveColor: colorWhite,
                icon: Icon(Icons.person),
                title: Text('Profile'),
              ),
              FlashyTabBarItem(
                activeColor: colorWhite,
                inactiveColor: colorWhite,
                icon: Icon(Icons.search),
                title: Text('Repositories'),
              ),
            ],
          ),
          appBar: AppBar(
            backgroundColor: colorBlack,
            centerTitle: true,
            title: Row(
              children: [
                Image.network("https://cdn-icons-png.flaticon.com/512/25/25231.png",
                  height: 30, color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "GitHub",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white.withOpacity(.9),
          body: provider.ViewItems[provider.selectedIndex]
        ),
      );
    }
    );
  }
}
