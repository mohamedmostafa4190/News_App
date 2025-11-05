// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/businessDark.png
  AssetGenImage get businessDark =>
      const AssetGenImage('assets/images/businessDark.png');

  /// File path: assets/images/businessLight.png
  AssetGenImage get businessLight =>
      const AssetGenImage('assets/images/businessLight.png');

  /// File path: assets/images/entertainmentDark.png
  AssetGenImage get entertainmentDark =>
      const AssetGenImage('assets/images/entertainmentDark.png');

  /// File path: assets/images/entertainmentLight.png
  AssetGenImage get entertainmentLight =>
      const AssetGenImage('assets/images/entertainmentLight.png');

  /// File path: assets/images/generalDark.png
  AssetGenImage get generalDark =>
      const AssetGenImage('assets/images/generalDark.png');

  /// File path: assets/images/generalLight.png
  AssetGenImage get generalLight =>
      const AssetGenImage('assets/images/generalLight.png');

  /// File path: assets/images/healthDark.png
  AssetGenImage get healthDark =>
      const AssetGenImage('assets/images/healthDark.png');

  /// File path: assets/images/healthLight.png
  AssetGenImage get healthLight =>
      const AssetGenImage('assets/images/healthLight.png');

  /// File path: assets/images/scienceDark.png
  AssetGenImage get scienceDark =>
      const AssetGenImage('assets/images/scienceDark.png');

  /// File path: assets/images/scienceLight.png
  AssetGenImage get scienceLight =>
      const AssetGenImage('assets/images/scienceLight.png');

  /// File path: assets/images/sportsDark.png
  AssetGenImage get sportsDark =>
      const AssetGenImage('assets/images/sportsDark.png');

  /// File path: assets/images/sportsLight.png
  AssetGenImage get sportsLight =>
      const AssetGenImage('assets/images/sportsLight.png');

  /// File path: assets/images/technologyDark.png
  AssetGenImage get technologyDark =>
      const AssetGenImage('assets/images/technologyDark.png');

  /// File path: assets/images/technologyLight.png
  AssetGenImage get technologyLight =>
      const AssetGenImage('assets/images/technologyLight.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    businessDark,
    businessLight,
    entertainmentDark,
    entertainmentLight,
    generalDark,
    generalLight,
    healthDark,
    healthLight,
    scienceDark,
    scienceLight,
    sportsDark,
    sportsLight,
    technologyDark,
    technologyLight,
  ];
}

class $AssetsSplashGen {
  const $AssetsSplashGen();

  /// File path: assets/splash/branding_dark.png
  AssetGenImage get brandingDark =>
      const AssetGenImage('assets/splash/branding_dark.png');

  /// File path: assets/splash/branding_light.png
  AssetGenImage get brandingLight =>
      const AssetGenImage('assets/splash/branding_light.png');

  /// File path: assets/splash/splash_dark.png
  AssetGenImage get splashDark =>
      const AssetGenImage('assets/splash/splash_dark.png');

  /// File path: assets/splash/splash_light.png
  AssetGenImage get splashLight =>
      const AssetGenImage('assets/splash/splash_light.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    brandingDark,
    brandingLight,
    splashDark,
    splashLight,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSplashGen splash = $AssetsSplashGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
