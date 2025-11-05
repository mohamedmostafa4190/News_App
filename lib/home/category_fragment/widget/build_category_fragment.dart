import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/categoryModel.dart';
import 'package:news_app/utils/app_const.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utils/app_color.dart';

class BuildCategoryItems extends StatelessWidget {
  final CategoryModel category;
  final int index;

  const BuildCategoryItems({
    super.key,
    required this.index,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    double w = context.screenWidth;
    double h = context.screenHeight;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.01 * h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 0.2 * h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(category.image ?? ''),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: index % 2 == 0
                  ? AlignmentDirectional.bottomEnd
                  : AlignmentDirectional.bottomStart,
              children: [
                index % 2 == 0
                    ? Positioned(
                        bottom: 0.13 * h,
                        left: 0.45 * w,
                        child: Text(
                          category.name ?? '',
                          style: GoogleFonts.inter(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 24,
                          ),
                        ),
                      )
                    : Positioned(
                        bottom: 0.13 * h,
                        left: 0.05 * w,
                        child: Text(
                          category.name ?? '',
                          style: GoogleFonts.inter(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 24,
                          ),
                        ),
                      ),
                _buildViewAllButton(context, w, h, index % 2 == 0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewAllButton(
    BuildContext context,
    double w,
    double h,
    bool isEven,
  ) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, bottom: 16, end: 16),
      child: Container(
        height: 0.07 * h,
        width: 0.45 * w,
        decoration: BoxDecoration(
          color: AppColor.greyColor.withAlpha(120),
          borderRadius: BorderRadius.circular(85),
        ),
        child: Row(
          textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 0.01 * w),
            Text(
              AppLocalizations.of(context)!.viewAll,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: 0.15 * w,
              height: 0.07 * h,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isEven ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
