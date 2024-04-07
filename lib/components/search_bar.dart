import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  List<String> data = [
    'Footwear'
    'Jersy'
    'Shorts'
    'Equipment'
  ];
  List<String> searchResults = [];

  String query = '';

  void onQueryChanged(String newQuery){
    setState(() {
      query = newQuery;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}