import 'dart:io';
import 'package:args/args.dart'; // Ensure this is in your pubspec.yaml
import 'config.dart';

void main(List<String> arguments) async {
  // 1. ArgParser Setup
  final parser = ArgParser()
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Show usage information');

  final argResults = parser.parse(arguments);

  if (argResults['help']) {
    print('Usage: ${AppConfig.executableName} [options]\n${parser.usage}');
    return;
  }

  // 2. Safety Check
  if (!await File('pubspec.yaml').exists()) {
    print(
        '❌ Error: No pubspec.yaml found. Please run this in a Flutter project root.');
    return;
  }

  print('🚀 Starting Flutter Pro Architect Scaffolding...');

  // 3. Create Folder Structure
  for (var folder in AppConfig.folderStructure) {
    final dir = Directory(folder);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
      print('✅ Created: $folder');
    }
  }

  // 4. Generate Boilerplate Files
  print('\n📂 Generating boilerplate files...');
  final locatorFile = File('lib/di/service_locator.dart');
  try {
    await locatorFile.writeAsString(AppConfig.serviceLocatorContent);
    print('✅ Created: lib/di/service_locator.dart');
  } catch (e) {
    print('❌ Failed to create service_locator.dart: $e');
  }

  // 5. Add Packages (Automatically fetching latest)
  print('\n📦 Adding essential packages...');

  // Extract only the package names (skipping the # comments)
  final packageNames =
      AppConfig.dependencies.keys.where((key) => !key.startsWith('#')).toList();

  if (packageNames.isNotEmpty) {
    final process = await Process.run(
        'flutter', ['pub', 'add', ...packageNames],
        runInShell: true);

    if (process.exitCode == 0) {
      print('✅ Successfully added all packages.');
    } else {
      print('❌ Error adding packages: ${process.stderr}');
    }
  }

  print('\n✨ Architecture Ready! Happy Coding.');
  print(
      '🔗 Check lib/di/service_locator.dart to start binding your dependencies.');
}
