import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/searchpageconrtoller.dart';
import '../utlis.dart';

class RepoView extends StatefulWidget {
  const RepoView({Key? key}) : super(key: key);

  @override
  State<RepoView> createState() => _RepoViewState();
}

class _RepoViewState extends State<RepoView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchPageController>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: colorBlack,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              // width: 250,
              decoration: BoxDecoration(
                // color: colorBlack,
                // borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.Userdata['name'].toString(),
                    style: TextStyle(
                      color: colorTextBlack,
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
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .73,
              child: ListView.builder(
                  itemCount: provider.Repodata.length,
                  itemBuilder: (BuildContext, index){
                return Container(
                  margin: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
                  // width: 250,
                  padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                    // color: colorBlack,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.Repodata[index]['name'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            width: 250,
                            child: Text(
                              provider.Repodata[index]['description'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          provider.Repodata[index]['language'] != null ?
                          Container(
                            decoration: BoxDecoration(
                                color: colorBlue,
                                borderRadius:
                                BorderRadius.circular(4)),
                            padding:
                            EdgeInsets.fromLTRB(6, 3, 6, 3),
                            child: Text(
                              "${provider.Repodata[index]['language'].toString()}",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 8,
                              ),
                            ),
                          ): Container(),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.error_outline,color:  colorWhite,size: 15,),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Open Issues: ${provider.Repodata[index]['open_issues'].toString()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.remove_red_eye_outlined,color:  colorWhite,size: 15,),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Watchers: ${provider.Repodata[index]['watchers'].toString()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Border color
                            width: 1.0, // Border width
                          ),
                          // color: colorBlack,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "${provider.Repodata[0]['visibility'].toString()}",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 8,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      );
    });
  }
}
