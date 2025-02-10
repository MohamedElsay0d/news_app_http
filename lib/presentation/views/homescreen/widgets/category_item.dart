import 'package:flutter/material.dart';

import '../../../../data/model/category_model.dart';

class CategoryItem extends StatelessWidget {
CategoryModel category ; 
  CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.asset(
        'assets/images/${category.imageName}.png',
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
    );
  }
}
