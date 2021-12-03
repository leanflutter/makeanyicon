import 'package:any_icon_maker/any_icon_maker.dart';

import 'makeanyicon_options.dart';

class MakeAnyIcon {
  MakeAnyIcon._();

  /// The shared instance of [MakeAnyIcon].
  static final MakeAnyIcon instance = MakeAnyIcon._();

  Future<void> make(
    String iconPath,
    MakeAnyIconOptions options, {
    ImageProcessingMethod method: ImageProcessingMethod.imgLib,
  }) async {
    final anyIconMaker = AnyIconMaker();
    await anyIconMaker.make(
      iconPath,
      options.outputPath,
      options.imageSets,
      method: method,
    );
  }
}
