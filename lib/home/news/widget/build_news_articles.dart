import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/home/news/widget/web_view.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/widget/custom_elevated_buttom.dart';

import '../../../model/NewsResponse.dart';

class BuildNewsArticles extends StatefulWidget {
  const BuildNewsArticles({
    super.key,
    required this.article,
    required this.onTap,
  });

  final Articles article;
  final Function() onTap;

  @override
  State<BuildNewsArticles> createState() => _BuildNewsArticlesState();
}

class _BuildNewsArticlesState extends State<BuildNewsArticles> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    final dateFormat = DateFormat(
      'mm',
    ).format(DateTime.parse(widget.article.publishedAt ?? ''));
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        widget.article.urlToImage ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      widget.article.title ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      widget.article.content ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 0.01 * h),
                    CustomElevatedButton(
                      text: AppLocalizations.of(context)!.viewArticles,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WebViewPage(url: widget.article.url ?? ''),
                          ),
                        );
                        setState(() {});
                      },
                      color: Theme.of(context).canvasColor,
                      textColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: 0.8 * w,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  widget.article.urlToImage ?? '',
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.lightBlue,
                        ),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.article.title ?? '',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              SizedBox(height: 0.001 * h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 0.5 * w),
                      child: Text(
                        'By ${widget.article.author}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    Text(
                      '$dateFormat minutes ago',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
