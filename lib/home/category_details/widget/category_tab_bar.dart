import 'package:flutter/material.dart';
import 'package:news_app/home/news/news_screen.dart';
import 'package:news_app/utils/app_color.dart';

import '../../../model/SourceResponse.dart';

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({super.key, required this.sourcesList});

  final List<Source> sourcesList;

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              tabs: widget.sourcesList
                  .map(
                    (source) =>
                        selectedIndex == widget.sourcesList.indexOf(source)
                        ? Text(
                            source.name ?? '',
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).textTheme.labelMedium!.color,
                              fontSize: 20,
                            ),
                          )
                        : Text(
                            source.name ?? '',
                            style: TextStyle(
                              color: AppColor.greyColor,
                              fontSize: 20,
                            ),
                          ),
                  )
                  .toList(),
            ),
            Expanded(
              child: NewsScreen(source: widget.sourcesList[selectedIndex]),
            ),
          ],
        ),
      ),
    );
  }
}
