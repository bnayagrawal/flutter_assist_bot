
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';

class ImageAssetMedia implements IMedia {

  static const double _max_image_height = 128;

  final String assetPath;

  ImageAssetMedia(this.assetPath);

  @override
  Widget render() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image(
          image: AssetImage(assetPath),
          height: _max_image_height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}