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
            animationCurve: Curves.easeIn,
            selectedIndex: provider.selectedIndex,
            showElevation: true,
            onItemSelected: (index) =>
              provider.OnItemselect(index),
            items: [
              FlashyTabBarItem(
                activeColor: colorBlack,
                icon: Icon(Icons.person),
                title: Text('Profile'),
              ),
              FlashyTabBarItem(
                activeColor: colorBlack,
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
          body:
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                // width: 250,
                decoration: BoxDecoration(
                  color: colorBlack,
                  // borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Image.network(
                      provider.Userdata['avatar_url'],
                      height: 90,
                      width: 100,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.Userdata['name'].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          provider.Userdata['location'].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange.shade500,
                              borderRadius:
                              BorderRadius.circular(4)),
                          padding:
                          EdgeInsets.fromLTRB(6, 3, 6, 3),
                          child: Text(
                            "Total repo:  ${provider.Userdata['public_repos'].toString()}",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 8,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    );
  }
}
