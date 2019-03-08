import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final data = [
    'San Francisco',
    'Oakland',
    'Berkeley',
    'Fairfield',
    'Danville',
    'Richmond',
    'Vallejo',
    'Emeryville',
    'Albany',
    'Daly City',
    'Sunnyvale',
    'Menlo Park',
    'Redwood City',
    'Dublin',
    'Pleasanton',
    'Antioch',
    'Pittsburg',
    'Suisun City',
    'Walnut Creek',
    'Concord'
  ];

  final recentData = [
    'Dublin',
    'Pleasanton',
    'Antioch',
  ];

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on left of bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for application bar
    return [
      IconButton(
        icon: Icon(
          CupertinoIcons.clear,
        ),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // what should show when someone is searching
    final suggestionsList = query.isEmpty
        ? recentData
        : data
            .where((str) => str.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(Icons.location_city),
            title: RichText(
              text: TextSpan(
                text: suggestionsList[index].substring(0, query.length),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: suggestionsList[index].substring(query.length),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
      itemCount: suggestionsList.length,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // showSearch(context: context, delegate: DataSearch());
    // show result based on selection
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text('hello'),
          ),
        ),
      ),
    );

    // return Card();
  }
}
