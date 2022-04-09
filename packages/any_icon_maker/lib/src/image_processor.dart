import 'image_processor_adapter.dart';

class ImageProcessor {
  final ImageProcessorAdapter adapter;

  ImageProcessor(this.adapter);

  ImageProcessor load(String path) {
    adapter.load(path);
    return this;
  }

  ImageProcessor resize(int width, int height) {
    adapter.resize(width, height);
    return this;
  }

  void save(String outPath) {
    adapter.save(outPath);
  }
}
