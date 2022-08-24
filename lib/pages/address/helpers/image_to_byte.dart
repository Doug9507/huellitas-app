import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/services.dart';

Future<Uint8List> assetTobyte(String path,
    {int width = 90, int height = 90}) async {
  final byteData = await rootBundle.load(path);

  final bytes = byteData.buffer.asUint8List();

  final codec = await instantiateImageCodec(
    bytes,
    targetWidth: width,
    targetHeight: height,
  );

  final frame = await codec.getNextFrame();

  final newByteData = await frame.image.toByteData(format: ImageByteFormat.png);

  return newByteData.buffer.asUint8List();
}
