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

  factory MakeAnyIconOptions.fromFile(File file) {
    final options = loadYaml(file.readAsStringSync());
    return MakeAnyIconOptions.fromJson(json.decode(json.encode(options)));
  }

  factory MakeAnyIconOptions.fromJson(Map<String, dynamic> json) {
    List<ImageSet> imageSets = (json['image_sets'] as List)
        .map((item) => ImageSet.fromJson(Map<String, dynamic>.from(item)))
        .toList();

    return MakeAnyIconOptions(
      outputPath: json['output'],
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
