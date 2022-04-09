class Image {
  String size;
  int scale;
  String path;
  String filename;

  double get _width => double.parse(size.split('x')[0]);
  double get _height => double.parse(size.split('x')[1]);

  double get width => _width * scale;
  double get height => _height * scale;

  Image({
    required this.size,
    this.scale = 1,
    this.path = '',
    required this.filename,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      size: json['size'],
      scale: int.parse((json['scale'] ?? '1x').replaceFirst('x', '')),
      path: json['path'] ?? '',
      filename: json['filename'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'size': size,
      'scale': '${scale}x',
      'path': path,
      'filename': filename,
    };
  }
}
