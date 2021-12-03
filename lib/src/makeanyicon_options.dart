import 'dart:convert';
import 'dart:io';

import 'package:any_icon_maker/any_icon_maker.dart';
import 'package:yaml/yaml.dart';

class MakeAnyIconOptions {
  final String outputPath;
  final List<ImageSet> imageSets;

  MakeAnyIconOptions({
    required this.outputPath,
    required this.imageSets,
  });

  factory MakeAnyIconOptions.fromFile(File? file, String output) {
    final options = loadYaml(file?.readAsStringSync() ?? _defaultYaml);
    return MakeAnyIconOptions.fromJson(
        json.decode(json.encode(options)), output);
  }

  factory MakeAnyIconOptions.fromJson(
    Map<String, dynamic> json,
    String output,
  ) {
    List<ImageSet> imageSets = (json['image_sets'] as List)
        .map((item) => ImageSet.fromJson(Map<String, dynamic>.from(item)))
        .toList();

    return MakeAnyIconOptions(
      outputPath: output,
      imageSets: imageSets,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'output': outputPath,
      'image_sets': imageSets.map((e) => e.toJson()),
    };
  }
}

const _defaultYaml = '''
image_sets:
  - name: android
    path: android/app/src/main/res/
    images:
      - size: 48x48
        path: mipmap-mdpi/
        filename: ic_launcher.png
      - size: 72x72
        path: mipmap-hdpi/
        filename: ic_launcher.png
      - size: 96x96
        path: mipmap-xhdpi/
        filename: ic_launcher.png
      - size: 144x144
        path: mipmap-xxhdpi/
        filename: ic_launcher.png
      - size: 192x192
        path: mipmap-xxxhdpi/
        filename: ic_launcher.png
  - name: ios
    path: ios/Runner/Assets.xcassets/AppIcon.appiconset/
    images:
      - size: 20x20
        scale: 1x
        filename: Icon-App-20x20@1x.png
      - size: 20x20
        scale: 2x
        filename: Icon-App-20x20@2x.png
      - size: 20x20
        scale: 3x
        filename: Icon-App-20x20@3x.png
      - size: 29x29
        scale: 1x
        filename: Icon-App-29x29@1x.png
      - size: 29x29
        scale: 2x
        filename: Icon-App-29x29@2x.png
      - size: 29x29
        scale: 3x
        filename: Icon-App-29x29@3x.png
      - size: 40x40
        scale: 1x
        filename: Icon-App-40x40@1x.png
      - size: 40x40
        scale: 2x
        filename: Icon-App-40x40@2x.png
      - size: 40x40
        scale: 3x
        filename: Icon-App-40x40@3x.png
      - size: 60x60
        scale: 1x
        filename: Icon-App-60x60@1x.png
      - size: 60x60
        scale: 2x
        filename: Icon-App-60x60@2x.png
      - size: 60x60
        scale: 3x
        filename: Icon-App-60x60@3x.png
      - size: 76x76
        scale: 1x
        filename: Icon-App-76x76@1x.png
      - size: 76x76
        scale: 2x
        filename: Icon-App-76x76@2x.png
      - size: 83.5x83.5
        scale: 2x
        filename: Icon-App-83.5x83.5@2x.png
      - size: 1024x1024
        scale: 1x
        filename: Icon-App-1024x1024@1x.png
  - name: macos
    path: macos/Runner/Assets.xcassets/AppIcon.appiconset/
    images:
      - size: 16x16
        scale: 1x
        filename: app_icon_16.png
      - size: 32x32
        scale: 1x
        filename: app_icon_32.png
      - size: 64x64
        scale: 1x
        filename: app_icon_64.png
      - size: 128x128
        scale: 1x
        filename: app_icon_128.png
      - size: 256x256
        scale: 1x
        filename: app_icon_256.png
      - size: 512x512
        scale: 1x
        filename: app_icon_512.png
      - size: 1024x1024
        scale: 1x
        filename: app_icon_1024.png
  - name: web
    path: web/
    images:
      - size: 16x16
        filename: favicon.png
      - size: 192x192
        path: icons/
        filename: Icon-192.png
      - size: 512x512
        path: icons/
        filename: Icon-512.png
      - size: 192x192
        path: icons/
        filename: Icon-maskable-192.png
      - size: 512x512
        path: icons/
        filename: Icon-maskable-512.png
  - name: windows
    path: windows/runner/resources/
    images:
      - size: 256x256
        filename: app_icon.ico
''';
