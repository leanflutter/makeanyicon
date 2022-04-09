import 'image.dart';

class ImageSet {
  final String name;
  final String path;
  final List<Image> images;

  ImageSet({
    required this.name,
    required this.path,
    required this.images,
  });

  factory ImageSet.fromJson(Map<String, dynamic> json) {
    List<Image> images = (json['images'] as List)
        .map((item) => Image.fromJson(Map<String, dynamic>.from(item)))
        .toList();

    return ImageSet(
      name: json['name'],
      path: json['path'],
      images: images,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'path': path,
      'images': images.map((e) => e.toJson()),
    };
  }
}
