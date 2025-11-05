import 'package:flutter/material.dart';
import 'package:news_app/home/category_details/category_details.dart';
import 'package:news_app/home/category_fragment/category_fragment.dart';
import 'package:news_app/model/categoryModel.dart';
import 'package:news_app/widget/build_drawer.dart';

import '../../l10n/app_localizations.dart';
import '../search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(onTapHome: onTapHomeSelected),
      appBar: AppBar(
        title: Text(
          selectedCategory == null
              ? AppLocalizations.of(context)!.home
              : selectedCategory!.name ?? '',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        actions: selectedCategory == null
            ? []
            : [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
      ),
      body: selectedCategory == null
          ? CategoryFragment(onCategoryItemClicked: onCategoryItemClicked)
          : CategoryDetails(categoryId: selectedCategory!),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryItemClicked(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onTapHomeSelected() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
