import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../search.dart';
import '../presentation/my_flutter_app_icons.dart';

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Recyclify'),
        // leading: Icon(MyFlutterApp.recycle),
        actions: [
          Builder(
            builder: (context) => IconButton(
                  icon: Icon(CupertinoIcons.search),
                  onPressed: () async {
                    final String result = await showSearch(
                      context: context,
                      delegate: RecyclableSearch(),
                    );
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result),
                      ),
                    );
                  },
                ),
          )
        ],
      ),
    );
  }
}

class RecyclableSearch extends SearchDelegate<String> {
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

  final suggestions = [
    'Dublin',
    'Pleasanton',
    'Antioch',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(CupertinoIcons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(CupertinoIcons.back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = query.isEmpty
        ? suggestions
        : data
            .where((str) => str.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView(
      children: results
          .map<ListTile>((a) => ListTile(
                title: Text(a),
                leading: Icon(MyFlutterApp.recycle),
                onTap: () {
                  close(context, a);
                  a = null;
                },
              ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = query.isEmpty
        ? suggestions
        : data
            .where((str) => str.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView(
      children: results
          .map<ListTile>((a) => ListTile(
                title: Text(
                  a,
                  style: Theme.of(context).textTheme.subhead.copyWith(
                        fontSize: 14.0,
                        color: CupertinoColors.activeBlue,
                      ),
                ),
                // leading: Icon(MyFlutterApp.recycle),
                onTap: () {
                  // showResults(context);
                  // query = a;
                  close(context, a);
                },
              ))
          .toList(),
    );
  }
}
