import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Show usage information',
    )
    ..addOption('name', abbr: 'n', help: 'Project name');

  final argResults = parser.parse(arguments);

if (argResults['help']) {
    print('Usage: flutter_pro_architect [options]\n${parser.usage}');
    return;
  }

  print('🚀 Starting Flutter Architecture Scaffolding...');

  // 1. Define Folders
  final folders = [
    'lib/app/config',
    'lib/controllers',
    'lib/data/source/local/object_box',
    'lib/data/source/local/secure',
    'lib/data/source/remote/api',
    'lib/data/source/remote/dio',
    'lib/data/source/remote/interceptors',
    'lib/di',
    'lib/model',
    'lib/repositories',
    'lib/res/constants',
    'lib/res/routes',
    'lib/res/themes',
    'lib/utils/helper',
    'lib/view/screens',
    'lib/view/widgets',
  ];

  // 2. Create Folders
  for (var folder in folders) {
    final dir = Directory(folder);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
      print('✅ Created: $folder');
    }
  }

  // 3. Add Dependencies (Runs flutter pub add)
  print('📦 Adding essential packages...');
  final process = await Process.run('flutter', [
    'pub',
    'add',
    'get',
    'dio',
    'http',
    'go_router',
  ], runInShell: true);

  if (process.exitCode == 0) {
    print('✨ Architecture Ready! Happy Coding.');
  } else {
    print('❌ Error adding packages: ${process.stderr}');
  }
}
