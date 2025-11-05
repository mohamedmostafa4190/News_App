import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/category_fragment/widget/build_category_fragment.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/categoryModel.dart';

import '../../cubit/theme_cubit/theme_cubit.dart';

typedef OnCategoryItemClicked = void Function(CategoryModel);

class CategoryFragment extends StatelessWidget {
  OnCategoryItemClicked onCategoryItemClicked;

  CategoryFragment({super.key, required this.onCategoryItemClicked});

  List<CategoryModel> categoriesList = [];

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ThemeCubit>();
    categoriesList = CategoryModel.categoryList(context, isDark: cubit.isDark);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.goodMorning,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              AppLocalizations.of(context)!.newsForYou,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    onCategoryItemClicked(categoriesList[index]);
                  },
                  child: BuildCategoryItems(
                    index: index,
                    category: categoriesList[index],
                  ),
                ),
                itemCount: categoriesList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
