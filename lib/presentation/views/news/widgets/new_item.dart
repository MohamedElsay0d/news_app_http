import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../app_theme.dart';

class NewItem extends StatelessWidget {
  const NewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.now().subtract(Duration(days: 2));
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/newImage.png',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "40-year-old man falls 200 feet to his death while canyoneering at national park",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "By : Jon Haworth",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppTheme.gray,
                    ),
              ),
              Text(
                timeago.format(dateTime),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppTheme.gray,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
