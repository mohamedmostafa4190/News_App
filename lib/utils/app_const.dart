import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class Assets {
  const Assets._();
  static const String package = 'test';
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

extension MediaQueryValues on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}
