import 'package:flutter/material.dart';

import '../../../../data/model/category_model.dart';
import '../widgets/category_item.dart';

class Categoriesview extends StatelessWidget {
  const Categoriesview({super.key});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CategoryItem(
                category: CategoryModel.categories[index],
              ),
              itemCount: CategoryModel.categories.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
