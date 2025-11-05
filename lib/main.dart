// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/news/home_screen.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_theme.dart';

import 'cubit/lang_cubit/lang_cubit.dart';
import 'cubit/search_cubit/search_cubit.dart';
import 'cubit/theme_cubit/theme_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LangCubit()),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, langState) {
          var langCubit = context.watch<LangCubit>();
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              var cubit = context.watch<ThemeCubit>();

              return MaterialApp(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,

                locale: langCubit.isArabic ? Locale('ar') : Locale('en'),

                debugShowCheckedModeBanner: false,
                title: 'News App',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,

                themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,

                home: HomeScreen(),
              );
            },
          );
        },
      ),
      // *** انتهى التعديل ***
    );
  }
}
