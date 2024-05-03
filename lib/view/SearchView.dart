import 'package:flutter/material.dart';
import 'package:githubsearch/controllers/searchpageconrtoller.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  void initState() {
    super.initState();
    // Call the initialization method using Provider
    Provider.of<SearchPageController>(context, listen: false).checkInternet();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchPageController>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.black54,
        body:
        provider.isConnected ?
        Column(
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
        ) :
            Center(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset("assets/no-internet.png", height: 200,),
                    SizedBox(
                      height: 15,
                    ),
                    Text("No internet", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),)
                  ],
                ),
              ),
            )
      );
    }
    );
  }
}
