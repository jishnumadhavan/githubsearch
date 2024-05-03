import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/searchpageconrtoller.dart';
import '../utlis.dart';

class ProfileView extends StatefulWidget {


  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchPageController>(builder: (context, provider, child) {
      return Scaffold(
        body: Column(
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
      );
    }
    );
  }
}
