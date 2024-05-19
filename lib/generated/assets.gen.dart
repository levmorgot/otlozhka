/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesTransactionsGen get transactions => const $AssetsImagesTransactionsGen();
}

class $AssetsImagesTransactionsGen {
  const $AssetsImagesTransactionsGen();

  /// File path: assets/images/transactions/cafe.png
  AssetGenImage get cafe => const AssetGenImage('assets/images/transactions/cafe.png');

  /// File path: assets/images/transactions/gifts.png
  AssetGenImage get gifts => const AssetGenImage('assets/images/transactions/gifts.png');

  /// File path: assets/images/transactions/health.png
  AssetGenImage get health => const AssetGenImage('assets/images/transactions/health.png');

  /// File path: assets/images/transactions/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/transactions/home.png');

  /// File path: assets/images/transactions/leisure.png
  AssetGenImage get leisure => const AssetGenImage('assets/images/transactions/leisure.png');

  /// File path: assets/images/transactions/money.png
  AssetGenImage get money => const AssetGenImage('assets/images/transactions/money.png');

  /// File path: assets/images/transactions/other.png
  AssetGenImage get other => const AssetGenImage('assets/images/transactions/other.png');

  /// File path: assets/images/transactions/percent.png
  AssetGenImage get percent => const AssetGenImage('assets/images/transactions/percent.png');

  /// File path: assets/images/transactions/products.png
  AssetGenImage get products => const AssetGenImage('assets/images/transactions/products.png');

  /// File path: assets/images/transactions/study.png
  AssetGenImage get study => const AssetGenImage('assets/images/transactions/study.png');

  /// List of all assets
  List<AssetGenImage> get values => [cafe, gifts, health, home, leisure, money, other, percent, products, study];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
