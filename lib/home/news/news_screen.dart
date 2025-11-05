import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/widget/build_error.dart';
import 'package:news_app/home/news/widget/build_news_articles.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class NewsScreen extends StatefulWidget {
  final Source source;
  const NewsScreen({super.key, required this.source});
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late ScrollController _scrollController;
  int page = 1;
  final int pageSize = 10;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getSourcesByCategory(
        sourceId: widget.source.id ?? '',
        page: page,
        pageSize: pageSize,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.lightBlue),
          );
        }
        if (snapshot.hasError) {
          return buildError(
            context: context,
            message: 'Something went wrong',
            onTap: () {
              ApiManager.getSources();
              setState(() {});
            },
          );
        }
        if (snapshot.data?.status != 'ok' || snapshot.data?.articles == null) {
          return buildError(
            context: context,
            message: 'Failed to load news',
            onTap: () {
              ApiManager.getSources();
              setState(() {});
            },
          );
        }

        final articles = snapshot.data!.articles!;
        final totalResults = snapshot.data!.totalResults ?? articles.length;
        final totalPages = (totalResults / pageSize).ceil().clamp(1, 1000);

        return Column(
          children: [
            // Articles list
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return BuildNewsArticles(article: article, onTap: () {});
                },
              ),
            ),
            if (totalPages > 1)
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: List.generate(totalPages, (i) {
                      final p = i + 1;
                      final bool isActive = p == page;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isActive
                                ? Colors.lightBlue
                                : Colors.grey[200],
                            foregroundColor: isActive
                                ? Colors.white
                                : Colors.black,
                            minimumSize: const Size(44, 44),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            if (p == page) return;
                            setState(() {
                              page = p;
                            });
                            // Scroll to top when switching page
                            _scrollController.animateTo(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          },
                          child: Text('$p'),
                        ),
                      );
                    }),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
