import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/data/model/source_model.dart';

import '../../../../data/model/category_model.dart';
import '../widgets/news_item.dart';

class NewsView extends StatefulWidget {
  static const routeName = '/news';
  NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late CategoryModel category;
  int currentIdx = 0;
  List<SourceModel> sources = List.generate(
    10,
    (index) => SourceModel(id: index, name: "Source $index"),
  );

  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.id,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_sharp),
          ),
        ],
      ),
      drawer: Drawer(),
      body: DefaultTabController(
        length: sources.length,
        initialIndex: currentIdx,
        animationDuration: Duration(milliseconds: 500),
        child: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: AppTheme.black,
                  width: 2.0,
                ),
              ),
              dividerColor: Colors.transparent,
              onTap: (value) {
                if (currentIdx == value) return;
                setState(() {
                  currentIdx = value;
                });
              },
              isScrollable: true,
              tabs: sources
                  .map((e) => NewsItem(
                      source: e, isSelected: currentIdx == sources.indexOf(e)))
                  .toList(),
            ),
            Expanded(
                child: TabBarView(
              children:
                  sources.map((e) => Center(child: Text(e.name))).toList(),
            ))
          ],
        ),
      ),
    );
  }
}
