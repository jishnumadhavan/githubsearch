import 'package:flutter/material.dart';
import 'package:githubsearch/controllers/searchpageconrtoller.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchPageController>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.black54,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://cdn-icons-png.flaticon.com/512/25/25231.png",
            height: 100, color: Colors.white,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 0.2, // Border width
                  style: BorderStyle.solid, // Solid border style
                ),
                borderRadius: BorderRadius.circular(10.0), // Optional: Adds rounded corners
              ),
              child: TextFormField(
                controller: provider.searchController,
                // onEditingComplete: (){
                //   provider.getUser(provider.searchController.text);
                // },
                // onChanged: (value) {
                //   provider.getUser(provider.searchController.text);
                // },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      provider.clearText();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          width: 300,
          child: ElevatedButton(
            onPressed: (){
              provider.getUser(provider.searchController.text, context);
            },
            child: provider.loading? CircularProgressIndicator() : Text("Search", style: TextStyle(color: Colors.black87),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        )
          ],
        ),
      );
    }
    );
  }
}
