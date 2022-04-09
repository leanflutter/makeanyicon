import 'dart:io';

import 'package:image/image.dart' as imglib;

import 'image_processor_adapter.dart';

class ImageProcessorAdapterImglib extends ImageProcessorAdapter {
  @override
  void save(String outPath) {
    imglib.Image originImage =
        imglib.decodePng(originImageFile!.readAsBytesSync())!;

    var resizedImage = imglib.copyResize(
      originImage,
      width: resizeWidth,
      height: resizeHeight,
      interpolation: imglib.Interpolation.average,
    );

    File outputFile = File(outPath);
    if (!outputFile.parent.existsSync()) {
      outputFile.parent.createSync(recursive: true);
    }
    List<int> resizedImageData;
    if (outPath.split("/").last.contains('.ico')) {
      resizedImageData = imglib.encodeIco(resizedImage);
    } else {
      resizedImageData = imglib.encodePng(resizedImage);
    }
    outputFile.writeAsBytesSync(resizedImageData);
  }
}
