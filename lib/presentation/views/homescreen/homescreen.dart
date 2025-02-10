import 'package:flutter/material.dart';

import 'views/categoriesView.dart';

class Homescreen extends StatelessWidget {
  static const routeName = '/homescreen';
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_sharp),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Categoriesview(),
    );
  }
}
