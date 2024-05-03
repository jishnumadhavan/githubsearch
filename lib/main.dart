import 'package:flutter/material.dart';
import 'package:githubsearch/view/SearchView.dart';
import 'package:provider/provider.dart';

import 'controllers/searchpageconrtoller.dart';

void main(){
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  MyApp({super.key});

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchPageController()),
      ],
      child: GestureDetector(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GitHub Search',
          home: SearchView(),
        ),
      ),
    );
  }
}