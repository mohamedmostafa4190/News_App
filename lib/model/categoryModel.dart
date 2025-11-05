import 'package:flutter/cupertino.dart';
import 'package:news_app/l10n/app_localizations.dart';

import '../gen/assets.gen.dart';

class CategoryModel {
  String? id;
  String? name;
  String? image;

  //
  CategoryModel({required this.id, required this.name, required this.image});

  static List<CategoryModel> categoryList(
    BuildContext context, {
    required bool isDark,
  }) => [
    CategoryModel(
      id: 'general',
      name: AppLocalizations.of(context)!.general,
      image: isDark
          ? Assets.images.generalDark.path
          : Assets.images.generalLight.path,
    ),
    CategoryModel(
      id: 'business',
      name: AppLocalizations.of(context)!.business,
      image: isDark
          ? Assets.images.businessDark.path
          : Assets.images.businessLight.path,
    ),
    CategoryModel(
      id: 'sports',
      name: AppLocalizations.of(context)!.sports,
      image: isDark
          ? Assets.images.sportsDark.path
          : Assets.images.sportsLight.path,
    ),
    CategoryModel(
      id: 'technology',
      name: AppLocalizations.of(context)!.technology,
      image: isDark
          ? Assets.images.technologyDark.path
          : Assets.images.technologyLight.path,
    ),
    CategoryModel(
      id: 'entertainment',
      name: AppLocalizations.of(context)!.entertainment,
      image: isDark
          ? Assets.images.entertainmentDark.path
          : Assets.images.entertainmentLight.path,
    ),
    CategoryModel(
      id: 'health',
      name: AppLocalizations.of(context)!.health,
      image: isDark
          ? Assets.images.healthDark.path
          : Assets.images.healthLight.path,
    ),
    CategoryModel(
      id: 'science',
      name: AppLocalizations.of(context)!.science,
      image: isDark
          ? Assets.images.scienceDark.path
          : Assets.images.scienceLight.path,
    ),
  ];
}
