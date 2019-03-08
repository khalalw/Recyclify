import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recyclify'),
        actions: [
          Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: DataSearch(),
                      );
                    },
                  )),
        ],
      ),
    );
  }
}
