import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/categoryModel.dart';

import 'widget/category_tab_bar.dart';

class CategoryDetails extends StatelessWidget {
  final CategoryModel categoryId;

  const CategoryDetails({super.key, required this.categoryId});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<SourceResponse>(
        future: ApiManager.getSources(categoryId: categoryId.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.lightBlue),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data?.status != 'ok') {
            return Text(snapshot.data?.message ?? '');
          } else {
            var sourcesList = snapshot.data!.sources ?? [];
            return CategoryTabBar(sourcesList: sourcesList);
          }
        },
      ),
    );
  }
}
