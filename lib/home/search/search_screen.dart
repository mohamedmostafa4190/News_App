// dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/news/widget/build_news_articles.dart';
import 'package:news_app/home/search/widget/custom_search.dart';

import '../../cubit/search_cubit/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

late ScrollController _scrollController;

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = context.watch<SearchCubit>();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearch(
                    controller: controller,
                    onSubmit: (value) {
                      if (value.trim().isNotEmpty) {
                        cubit.searchArticles(value);
                      }
                    },
                    onClear: () {
                      controller.clear();
                    },
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Builder(
                      builder: (_) {
                        final currentState = state;
                        if (currentState is LoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (currentState is SuccessState) {
                          final articles = currentState.articles;
                          return ListView.builder(
                            controller: _scrollController,
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              final article = articles[index];
                              return BuildNewsArticles(
                                article: article,
                                onTap: () {},
                              );
                            },
                          );
                        }
                        if (currentState is EmptyState) {
                          return Center(child: Text(currentState.empty));
                        }
                        if (currentState is ErrorState) {
                          return Center(child: Text(currentState.error));
                        }
                        if (controller.text.trim().isEmpty) {
                          return const Center(
                            child: Text('Start typing to search'),
                          );
                        }
                        return const Center(child: Text('No results found'));
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final cubit = context.read<SearchCubit>();
      cubit.searchArticles(controller.text);
    }
  }
}
