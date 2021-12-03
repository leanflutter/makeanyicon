import 'dart:io';

import 'package:any_icon_maker/any_icon_maker.dart';
import 'package:args/args.dart';
import 'package:makeanyicon/makeanyicon.dart';

Future<void> main(List<String> args) async {
  final parser = ArgParser();

  parser.addFlag(
    'help',
    abbr: 'h',
    negatable: false,
  );

  parser.addOption(
    'input',
    abbr: 'i',
    valueHelp: 'path',
    help: 'Input image (1024x1024 PNG recommended)',
  );

  parser.addOption(
    'method',
    abbr: 'm',
    valueHelp: 'method',
    help: 'Image processing method',
    defaultsTo: 'imglib',
    allowed: [
      'imglib',
      'magick',
    ],
    allowedHelp: {
      'imglib': 'Use Dart image library',
      'magick': 'Use local magick (must be installed)',
    },
  );

  parser.addOption(
    'options',
    abbr: 'f',
    valueHelp: 'makeanyicon_options.yaml',
    help: 'Options yaml file (defaults to example yaml)',
  );

  parser.addOption(
    'output',
    abbr: 'o',
    valueHelp: 'output path',
    help: 'Images output directory (defaults to current directory)',
  );

  final options = parser.parse(args);

  if (options['help'] == true) {
    print('Usage: makeanyicon --icon=app_icon_1024.png\n');
    print(parser.usage);
    return;
  }

  final inputArg = options['input'] as String?;
  if (inputArg == null || inputArg == '') {
    throw ArgumentError('Input file not provided');
  }

  if (!inputArg.endsWith('.png')) {
    throw ArgumentError('Input image is not a PNG file.');
  }

  final inputImage = File(inputArg);
  if (!inputImage.existsSync()) {
    throw ArgumentError('Input image not exists.');
  }

  final optionsArg = options['options'] as String?;
  if (optionsArg != null &&
      !(optionsArg.endsWith('.yaml') || optionsArg.endsWith('.yaml'))) {
    throw ArgumentError('Options file provided is not a YAML file');
  }

  final optionsFile = optionsArg != null ? File(optionsArg) : null;
  if (optionsFile != null && !optionsFile.existsSync()) {
    throw ArgumentError('Options file provided is not exists.');
  }

  ImageProcessingMethod method;
  switch (options['method']) {
    case 'magick':
      method = ImageProcessingMethod.magick;
      break;
    case 'imglib':
    case null:
      method = ImageProcessingMethod.imgLib;
      break;
    default:
      print('Invalid method parameter!\n');
      return;
  }

  await MakeAnyIcon.instance.make(inputArg,
      MakeAnyIconOptions.fromFile(optionsFile, options['output'] ?? ''),
      method: method);
}
