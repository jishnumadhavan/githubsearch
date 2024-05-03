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
        backgroundColor: colorBlack,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 6, right: 6),
              padding: EdgeInsets.all(5),
              // width: 250,
        decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1.0, // Border width
        ),
        // color: colorBlack,
        borderRadius: BorderRadius.circular(6),),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(provider.Userdata['avatar_url'],
                        ),
                      ),
                      borderRadius: BorderRadius.circular(100)
                    ),
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
                        height: 8,
                      ),
                      Row(
                        children: [
                        Row(
                          children: [
                            Icon(Icons.people, color: colorWhite,size: 16,),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${provider.Userdata['followers'].toString()} followers",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.person_add_alt_1, color: colorWhite,size: 16,),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "${provider.Userdata['following'].toString()} following",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: colorBlue,
                            borderRadius:
                            BorderRadius.circular(4)),
                        padding:
                        EdgeInsets.fromLTRB(6, 3, 6, 3),
                        child: Text(
                          "Total Repository :  ${provider.Userdata['public_repos'].toString()}",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
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
