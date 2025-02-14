import 'package:flutter/material.dart';

import '../../widgets/custom_drawer.dart';
import '../news/views/search_view.dart';
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
            onPressed: () {
              Navigator.pushNamed(context, SearchView.routeName);
            },
            icon: Icon(Icons.search_sharp),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Categoriesview(),
    );
  }
}
