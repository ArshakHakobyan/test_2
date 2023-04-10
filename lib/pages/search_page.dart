import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({key}) : super(key: key);
  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    //i need to click on search
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.clear),
                ),
                prefixIconColor: const Color.fromRGBO(238, 111, 50, 1),
                suffixIconColor: const Color.fromRGBO(238, 111, 50, 1),
              ),
              cursorColor: const Color.fromRGBO(238, 111, 50, 1),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(238, 111, 50, 1),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          color: Colors.white,
          child: const Center(
            child: Text(
              'Some text',
              style: TextStyle(color: Color.fromRGBO(176, 198, 190, 1)),
            ),
          ),
        ));
  }
}
