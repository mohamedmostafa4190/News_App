import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_const.dart';

import '../cubit/lang_cubit/lang_cubit.dart';
import '../cubit/theme_cubit/theme_cubit.dart';
import '../utils/app_color.dart';

class BuildDrawer extends StatelessWidget {
  final Function onTapHome;

  const BuildDrawer({super.key, required this.onTapHome});

  @override
  Widget build(BuildContext context) {
    var darkCubit = context.read<ThemeCubit>();
    var langCubit = context.read<LangCubit>();
    double h = context.screenHeight;
    return Drawer(
      backgroundColor: AppColor.blackColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.newsApp,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: InkWell(
              onTap: () {
                onTapHome();
              },
              child: Row(
                spacing: 10,
                children: [
                  Icon(Icons.home_filled, color: Colors.white),
                  Text(
                    AppLocalizations.of(context)!.goHome,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              spacing: 10,
              children: [
                Icon(Icons.brush, color: Colors.white),
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Colors.black,
                    height: 0.15 * h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              darkCubit.isDark
                                  ? Icons.dark_mode
                                  : Icons.light_mode,
                              color: Colors.white,
                            ),
                            title: Text(
                              darkCubit.isDark
                                  ? AppLocalizations.of(context)!.dark
                                  : AppLocalizations.of(context)!.light,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            trailing: Switch(
                              value: darkCubit.isDark,
                              onChanged: (_) => darkCubit.changeTheme(),
                              activeColor: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 251,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      darkCubit.isDark
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Divider(indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              spacing: 10,
              children: [
                Icon(Icons.language, color: Colors.white),
                Text(
                  AppLocalizations.of(context)!.language,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Colors.black,
                    height: 0.19 * h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Column(
                        spacing: 0.05 * h,
                        children: [
                          InkWell(
                            onTap: () {
                              if (langCubit.isArabic) {
                                langCubit.changeLanguage();
                              }
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.english,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                langCubit.isArabic
                                    ? SizedBox()
                                    : Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (!langCubit.isArabic) {
                                langCubit.changeLanguage();
                              }
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.arabic,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                langCubit.isArabic
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 251,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      langCubit.isArabic
                          ? AppLocalizations.of(context)!.arabic
                          : AppLocalizations.of(context)!.english,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
