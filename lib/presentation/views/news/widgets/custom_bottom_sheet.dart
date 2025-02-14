import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app_theme.dart';
import '../../../../data/model/news_response/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsBottomSheet extends StatelessWidget {
  final Article article;

  const NewsBottomSheet({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      color: AppTheme.black,
      child: SingleChildScrollView(
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
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppTheme.white,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              article.description!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppTheme.white,
                  ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "By: ${article.author ?? 'Unknown'}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.gray,
                  ),
            ),
            Text(
              textAlign: TextAlign.end,
              timeago.format(
                DateTime.parse(article.publishedAt!),
              ),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.gray,
                  ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse(article.url!),
                  );
                  Navigator.pop(context);
                },
                child: const Text('View Full Article'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
