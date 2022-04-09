import '../any_icon_maker.dart';
import 'image_processor.dart';
import 'models/models.dart';

enum ImageProcessingMethod { imgLib, magick }

class AnyIconMaker {
  Future<void> make(
    String iconPath,
    String outputPath,
    List<ImageSet> imageSetList, {
    ImageProcessingMethod method: ImageProcessingMethod.imgLib,
  }) async {
    ImageProcessorAdapter imageProcessorAdapter;
    if (method == ImageProcessingMethod.magick) {
      imageProcessorAdapter = ImageProcessorAdapterMagick();
    } else {
      imageProcessorAdapter = ImageProcessorAdapterImglib();
    }

    for (ImageSet imageSet in imageSetList) {
      for (Image image in imageSet.images) {
        String imagePath = [
          outputPath,
          imageSet.path,
          image.path,
          image.filename,
        ].join('');

        ImageProcessor(imageProcessorAdapter)
            .load(iconPath)
            .resize(image.width.toInt(), image.height.toInt())
            .save(imagePath);

        print('Success: $imagePath');
      }
    }
  }
}
