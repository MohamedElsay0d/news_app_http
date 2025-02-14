import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../app_theme.dart';
import '../../../../data/model/news_response/article.dart';

class NewItem extends StatelessWidget {
  final Article article;
  const NewItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.parse(article.publishedAt!);
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
              child: CachedNetworkImage(
                imageUrl: article.urlToImage!,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 8,
          ),
          Text(
            article.title!,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "By: ${article.author ?? 'Unknown'}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppTheme.gray,
                      ),
                ),
              ),
              SizedBox(
                width: 12,
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
