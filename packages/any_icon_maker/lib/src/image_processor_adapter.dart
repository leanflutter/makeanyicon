import 'dart:io';

class ImageProcessorAdapter {
  File? originImageFile;
  int? resizeWidth;
  int? resizeHeight;

  ImageProcessorAdapter load(String path) {
    originImageFile = File(path);
    resizeWidth = null;
    resizeHeight = null;
    return this;
  }

  ImageProcessorAdapter resize(int width, int height) {
    resizeWidth = width;
    resizeHeight = height;
    return this;
  }

  void save(String outPath) {
    throw UnimplementedError();
  }
}
