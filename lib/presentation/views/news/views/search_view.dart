import 'package:flutter/material.dart';

import '../../../../data/model/news_response/news_response.dart';
import '../../../../data/services/api_service.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/new_item.dart';

class SearchView extends StatefulWidget {
  static const routeName = '/search';
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  late Future<NewsResponse> _newsFuture;
  String? query;

  @override
  void initState() {
    super.initState();
    _newsFuture = APIService.getNewsByQuery(query ?? 'news'); 
  }

  void _searchNews(String query) {
    setState(() {
      this.query = query;
      _newsFuture = APIService.getNewsByQuery(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search for news...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  _searchNews(value);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: FutureBuilder(
                  future: _newsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error loading news'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.articles == null) {
                      return const Center(
                        child: Text('No news found'),
                      );
                    } else {
                      final articles = snapshot.data!.articles!;
                      return ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => NewsBottomSheet(
                              article: articles[index],
                            ),
                          ),
                          child: NewItem(
                            article: articles[index],
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: articles.length,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}