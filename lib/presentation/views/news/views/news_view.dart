import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/data/services/api_service.dart';
import 'package:number_pagination/number_pagination.dart';

import '../../../../data/model/category_model.dart';
import '../../../../data/model/soureces_response/soureces_response.dart';
import '../../../widgets/custom_drawer.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/new_item.dart';
import '../widgets/source_item.dart';
import 'search_view.dart';

class NewsView extends StatefulWidget {
  static const routeName = '/news';
  NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late CategoryModel category;
  int currentIdx = 0;
  int pageNumber = 1;
  late Future<SourecesResponse> sources = APIService.getSources(category.id);
  @override
  Widget build(BuildContext context) {
    category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.id.toUpperCase(),
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
      body: FutureBuilder(
          future: sources,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              final sources = snapshot.data!.sources;
              return Column(
                children: [
                  DefaultTabController(
                    length: sources!.length,
                    initialIndex: currentIdx,
                    animationDuration: Duration(milliseconds: 500),
                    child: TabBar(
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
                          .map((e) => SourceItem(
                                source: e,
                                isSelected: currentIdx == sources.indexOf(e),
                              ))
                          .toList(),
                    ),
                  ),
                  FutureBuilder(
                      future: APIService.getNews(
                        sources[currentIdx].id!,
                        pageNumber: pageNumber.toString(),
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text('Error'),
                          );
                        }
                        return Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () => showModalBottomSheet(
                                     
                                              context: context,
                                              builder: (context) =>
                                                  NewsBottomSheet(
                                                article: snapshot
                                                    .data!.articles![index],
                                              ),
                                            ),
                                            child: NewItem(
                                              article: snapshot
                                                  .data!.articles![index],
                                            ),
                                          ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(),
                                      itemCount:
                                          snapshot.data!.articles!.length),
                                ),
                                NumberPagination(
                                  onPageChanged: (page) =>
                                      setState(() => pageNumber = page),
                                  totalPages:
                                      (snapshot.data!.totalResults!) ~/ 2,
                                  visiblePagesCount: 3,
                                  currentPage: pageNumber,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              );
            }
          }),
    );
  }
}
