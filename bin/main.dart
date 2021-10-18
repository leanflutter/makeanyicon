import 'dart:io';

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
    'icon',
    valueHelp: 'path',
  );
  final options = parser.parse(args);

  if (options['help'] == true) {
    print('Usage: makeanyicon --icon=app_icon_1024.png\n');
    print(parser.usage);
    return;
  }

  await MakeAnyIcon.instance.make(
    options['icon'],
    MakeAnyIconOptions.fromFile(
      File('makeanyicon_options.yaml'),
    ),
  );
}
