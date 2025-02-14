import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'presentation/views/homescreen/homescreen.dart';
import 'presentation/views/news/views/news_view.dart';
import 'presentation/views/news/views/search_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: Homescreen.routeName,
      routes: {
        Homescreen.routeName: (context) => const Homescreen(),
        NewsView.routeName: (context) => NewsView(),
        SearchView.routeName: (context) => const SearchView(),
      },
    );
  }
}
