import 'package:flutter/material.dart';

import '../../../../data/model/category_model.dart';
import '../../news/views/news_view.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsView.routeName, arguments: category);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
        child: Image.asset(
          'assets/images/${category.imageName}.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
