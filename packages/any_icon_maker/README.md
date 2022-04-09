# any_icon_maker

[![pub version][pub-image]][pub-url]

[pub-image]: https://img.shields.io/pub/v/any_icon_maker.svg
[pub-url]: https://pub.dev/packages/any_icon_maker

A configurable icon maker.

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [any_icon_maker](#any_icon_maker)
  - [Quick Start](#quick-start)
    - [Installation](#installation)
    - [Usage](#usage)
  - [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Quick Start

### Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  any_icon_maker: ^0.1.0
```

Or

```yaml
dependencies:
  window_manager:
    git:
      url: https://github.com/makeanyicon/any_icon_maker.git
      ref: main
```

### Usage

```dart
import 'package:any_icon_maker/any_icon_maker.dart';

Future<void> main(List<String> args) async {
  String iconPath = 'app_icon_1024.png';
  String outputPath = ''; // Save to current directory
  List<ImageSet> imageSets = [
    ImageSet(
      name: 'web',
      path: 'public/',
      images: [
        Image(size: '48x48', filename: 'favicon.ico'),
        Image(size: '192x192', filename: 'logo192.png'),
        Image(size: '512x512', filename: 'logo512.png'),
      ],
    ),
  ];
  final anyIconMaker = AnyIconMaker();
  await anyIconMaker.make(iconPath, outputPath, imageSets);
}
```

## License

[MIT](./LICENSE)
